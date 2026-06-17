import pool from '../config/db.js';

function extractHour(selectedTime) {
  return selectedTime.split('-')[0].trim();
}

function extractPrice(selectedTime) {
  const match = selectedTime.match(/(\d+)\s*Bs/);
  return match ? Number(match[1]) : 0;
}

export const createPurchase = async (req, res) => {
  const client = await pool.connect();

  try {
    const {
      id_usuario,
      movieSlug,
      selectedFormat,
      selectedTime,
      selectedSeats
    } = req.body;

    if (
      !id_usuario ||
      !movieSlug ||
      !selectedFormat ||
      !selectedTime ||
      !selectedSeats ||
      selectedSeats.length === 0
    ) {
      return res.status(400).json({
        message: 'Faltan datos para realizar la compra'
      });
    }

    const hora = extractHour(selectedTime);
    const precio = extractPrice(selectedTime);
    const cantidad = selectedSeats.length;
    const total = cantidad * precio;

    await client.query('BEGIN');

    const funcionResult = await client.query(
      `
      SELECT 
        f.id_funcion,
        f.precio
      FROM funciones f
      INNER JOIN peliculas p ON f.id_pelicula = p.id_pelicula
      WHERE p.slug = $1
      AND f.formato = $2
      AND f.hora = $3
      LIMIT 1
      `,
      [movieSlug, selectedFormat, hora]
    );

    if (funcionResult.rows.length === 0) {
      await client.query('ROLLBACK');

      return res.status(404).json({
        message: 'No se encontró la función seleccionada'
      });
    }

    const funcion = funcionResult.rows[0];

    const occupiedSeatsResult = await client.query(
      `
      SELECT asiento
      FROM compra_asientos
      WHERE id_funcion = $1
      AND asiento = ANY($2)
      `,
      [funcion.id_funcion, selectedSeats]
    );

    if (occupiedSeatsResult.rows.length > 0) {
      await client.query('ROLLBACK');

      const occupiedSeats = occupiedSeatsResult.rows.map((row) => row.asiento);

      return res.status(409).json({
        message: `Estas butacas ya fueron compradas: ${occupiedSeats.join(', ')}`
      });
    }

    const compraResult = await client.query(
      `
      INSERT INTO compras (
        id_usuario,
        id_funcion,
        cantidad_entradas,
        total
      )
      VALUES ($1, $2, $3, $4)
      RETURNING id_compra
      `,
      [id_usuario, funcion.id_funcion, cantidad, total]
    );

    const id_compra = compraResult.rows[0].id_compra;

    for (const asiento of selectedSeats) {
      await client.query(
        `
        INSERT INTO compra_asientos (
          id_compra,
          id_funcion,
          asiento,
          precio
        )
        VALUES ($1, $2, $3, $4)
        `,
        [id_compra, funcion.id_funcion, asiento, precio]
      );
    }

    await client.query('COMMIT');

    res.status(201).json({
      message: 'Compra realizada correctamente',
      id_compra,
      total
    });

  } catch (error) {
    await client.query('ROLLBACK');

    console.error(error);

    res.status(500).json({
      message: 'Error al realizar la compra'
    });
  } finally {
    client.release();
  }
};