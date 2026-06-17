--create database cine_center_db;

CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    gmail VARCHAR(120) UNIQUE NOT NULL,
    contrasena TEXT NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from usuarios;