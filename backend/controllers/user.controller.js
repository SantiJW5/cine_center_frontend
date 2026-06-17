import pool from '../config/db.js';

export const getUserPurchases = async (req, res) => {
  try {
    const { id_usuario } = req.params;

    const result = await pool.query(
      `
      SELECT 
        c.id_compra,
        c.cantidad_entradas,
        c.total,
        c.fecha_compra,

        f.ciudad,
        f.formato,
        f.fecha,
        f.hora,
        f.precio,

        p.titulo,
        p.poster,
        p.slug,

        COALESCE(
          JSON_AGG(ca.asiento ORDER BY ca.asiento) 
          FILTER (WHERE ca.asiento IS NOT NULL),
          '[]'
        ) AS asientos

      FROM compras c
      INNER JOIN funciones f ON c.id_funcion = f.id_funcion
      INNER JOIN peliculas p ON f.id_pelicula = p.id_pelicula
      LEFT JOIN compra_asientos ca ON c.id_compra = ca.id_compra

      WHERE c.id_usuario = $1

      GROUP BY 
        c.id_compra,
        f.id_funcion,
        p.id_pelicula

      ORDER BY c.fecha_compra DESC
      `,
      [id_usuario]
    );

    res.json({
      purchases: result.rows
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: 'Error al obtener historial de compras'
    });
  }
};