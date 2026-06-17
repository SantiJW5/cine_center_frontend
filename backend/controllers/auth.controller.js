import bcrypt from 'bcryptjs';
import pool from '../config/db.js';

export const registerUser = async (req, res) => {
  try {
    const { nombre, apellido, ciudad, gmail, contrasena } = req.body;

    if (!nombre || !apellido || !ciudad || !gmail || !contrasena) {
      return res.status(400).json({
        message: 'Todos los campos son obligatorios'
      });
    }

    const ciudadesPermitidas = ['Cochabamba', 'La Paz', 'Santa Cruz'];

    if (!ciudadesPermitidas.includes(ciudad)) {
      return res.status(400).json({
        message: 'Ciudad no válida'
      });
    }

    const userExists = await pool.query(
      'SELECT * FROM usuarios WHERE gmail = $1',
      [gmail]
    );

    if (userExists.rows.length > 0) {
      return res.status(409).json({
        message: 'Ese gmail ya está registrado'
      });
    }

    const hashedPassword = await bcrypt.hash(contrasena, 10);

    const result = await pool.query(
      `INSERT INTO usuarios (nombre, apellido, ciudad, gmail, contrasena)
       VALUES ($1, $2, $3, $4, $5)
       RETURNING id_usuario, nombre, apellido, ciudad, gmail`,
      [nombre, apellido, ciudad, gmail, hashedPassword]
    );

    res.status(201).json({
      message: 'Usuario registrado correctamente',
      user: result.rows[0]
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: 'Error en el servidor'
    });
  }
};

export const loginUser = async (req, res) => {
  try {
    const { ciudad, nombre, contrasena } = req.body;

    if (!ciudad || !nombre || !contrasena) {
      return res.status(400).json({
        message: 'Todos los campos son obligatorios'
      });
    }

    const result = await pool.query(
      `SELECT * FROM usuarios 
       WHERE ciudad = $1 AND nombre = $2`,
      [ciudad, nombre]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({
        message: 'Usuario no encontrado'
      });
    }

    const user = result.rows[0];

    const passwordValid = await bcrypt.compare(contrasena, user.contrasena);

    if (!passwordValid) {
      return res.status(401).json({
        message: 'Contraseña incorrecta'
      });
    }

    res.json({
      message: 'Inicio de sesión correcto',
      user: {
        id_usuario: user.id_usuario,
        nombre: user.nombre,
        apellido: user.apellido,
        ciudad: user.ciudad,
        gmail: user.gmail
      }
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: 'Error en el servidor'
    });
  }
};