-- Tabla de películas
CREATE TABLE IF NOT EXISTS peliculas (
    id_pelicula SERIAL PRIMARY KEY,
    slug VARCHAR(150) UNIQUE NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(80),
    duracion VARCHAR(50),
    clasificacion VARCHAR(80),
    sinopsis TEXT,
    poster TEXT,
    trailer TEXT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de funciones / horarios
CREATE TABLE IF NOT EXISTS funciones (
    id_funcion SERIAL PRIMARY KEY,
    id_pelicula INT NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    formato VARCHAR(80) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    precio NUMERIC(10, 2) NOT NULL,

    CONSTRAINT fk_funcion_pelicula
        FOREIGN KEY (id_pelicula)
        REFERENCES peliculas(id_pelicula)
        ON DELETE CASCADE
);

-- Tabla de compras
CREATE TABLE IF NOT EXISTS compras (
    id_compra SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_funcion INT NOT NULL,
    cantidad_entradas INT NOT NULL,
    total NUMERIC(10, 2) NOT NULL,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_compra_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,

    CONSTRAINT fk_compra_funcion
        FOREIGN KEY (id_funcion)
        REFERENCES funciones(id_funcion)
        ON DELETE CASCADE
);

-- Necesario para validar compra + función en detalle
ALTER TABLE compras
ADD CONSTRAINT uq_compra_funcion UNIQUE (id_compra, id_funcion);

-- Tabla de asientos comprados
CREATE TABLE IF NOT EXISTS compra_asientos (
    id_detalle SERIAL PRIMARY KEY,
    id_compra INT NOT NULL,
    id_funcion INT NOT NULL,
    asiento VARCHAR(10) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL,

    CONSTRAINT fk_asiento_compra_funcion
        FOREIGN KEY (id_compra, id_funcion)
        REFERENCES compras(id_compra, id_funcion)
        ON DELETE CASCADE,

    CONSTRAINT fk_asiento_funcion
        FOREIGN KEY (id_funcion)
        REFERENCES funciones(id_funcion)
        ON DELETE CASCADE,

    CONSTRAINT uq_asiento_funcion UNIQUE (id_funcion, asiento)
);



