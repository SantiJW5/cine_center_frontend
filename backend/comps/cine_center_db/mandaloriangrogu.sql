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
    'mandalorian-y-grogu',
    'Mandalorian y Grogu',
    'Ciencia ficción / Aventura',
    '115 min.',
    'Todo público',
    'El Mandaloriano y Grogu emprenden una nueva misión por la galaxia, enfrentándose a peligros que pondrán a prueba su vínculo.',
    '/img/mandaloriangrogu.jpg',
    'https://www.youtube.com/embed/dQw4w9WgXcQ'
)
ON CONFLICT (slug) DO NOTHING;
-------------------------------------------------
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '11:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '13:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '16:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '18:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '21:00',
    55
);
------------------------------------------------------
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '11:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '13:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '16:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '18:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '21:00',
    55
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '11:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '13:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '16:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '18:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'mandalorian-y-grogu'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '21:00',
    55
);
------------------------------------------------------
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
WHERE p.slug = 'mandalorian-y-grogu'
ORDER BY f.formato, f.hora;