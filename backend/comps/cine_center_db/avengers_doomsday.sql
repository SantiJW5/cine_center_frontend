INSERT INTO peliculas (
    slug,
    titulo,
    genero,
    duracion,
    clasificacion,
    sinopsis,
    poster,
    trailer
)
VALUES (
    'avengers-doomsday',
    'Avengers Doomsday',
    'Acción / Superhéroes',
    '140 min.',
    'Mayores de 12',
    'Los Avengers se reúnen nuevamente para enfrentar una amenaza que podría cambiar el destino del universo para siempre.',
    '/img/avengers_doomsday.jpg',
    'https://www.youtube.com/embed/dQw4w9WgXcQ'
)
ON CONFLICT (slug) DO NOTHING;

------------------------------------

INSERT INTO funciones (
    id_pelicula,
    ciudad,
    formato,
    fecha,
    hora,
    precio
)
VALUES
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '11:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '14:15',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '17:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '20:45',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '22:30',
    63
);

------------------------------------

INSERT INTO funciones (
    id_pelicula,
    ciudad,
    formato,
    fecha,
    hora,
    precio
)
VALUES
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '11:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '14:15',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '17:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '20:45',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '22:30',
    63
);

-----------------------------------------------------

INSERT INTO funciones (
    id_pelicula,
    ciudad,
    formato,
    fecha,
    hora,
    precio
)
VALUES
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '11:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '14:15',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '17:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '20:45',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'avengers-doomsday'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '22:30',
    63
);

--------------------------------------

SELECT 
  p.slug,
  p.titulo,
  f.ciudad,
  f.formato,
  f.fecha,
  f.hora,
  f.precio
FROM funciones f
INNER JOIN peliculas p ON f.id_pelicula = p.id_pelicula
WHERE p.slug = 'avengers-doomsday'
ORDER BY f.formato, f.hora;