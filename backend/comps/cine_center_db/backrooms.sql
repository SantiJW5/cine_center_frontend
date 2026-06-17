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
    'backrooms-sin-salida',
    'BACKROOMS: SIN SALIDA',
    'Suspenso',
    '120 min.',
    'Mayores de 14',
    'Una historia de terror y suspenso dentro de un lugar sin salida.',
    '/img/backrooms.jpg',
    'https://www.youtube.com/embed/0HjdiohVOik'
)
ON CONFLICT (slug) 
DO UPDATE SET
    titulo = EXCLUDED.titulo,
    genero = EXCLUDED.genero,
    duracion = EXCLUDED.duracion,
    clasificacion = EXCLUDED.clasificacion,
    sinopsis = EXCLUDED.sinopsis,
    poster = EXCLUDED.poster,
    trailer = EXCLUDED.trailer;

--------------------------------------

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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '11:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '14:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '16:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '16:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '17:45',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '18:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '19:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '21:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '21:30',
    63
);

-----------------------------------------------------------

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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '11:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '14:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '16:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '16:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '17:45',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '18:30',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '19:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '21:00',
    63
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'backrooms-sin-salida'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '21:30',
    63
);

----------------------------------------

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
WHERE p.slug = 'backrooms-sin-salida'
ORDER BY f.formato, f.hora;