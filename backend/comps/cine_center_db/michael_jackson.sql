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
    'michael',
    'Michael',
    'Drama / Biografía',
    '130 min.',
    'Mayores de 14',
    'La historia de Michael, un artista que marcó generaciones con su música, su talento y su vida llena de momentos inolvidables.',
    '/img/michael.jpg',
    'https://www.youtube.com/embed/iVJaujA54Y8'
)
ON CONFLICT (slug) DO NOTHING;
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'michael'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '11:45',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'michael'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '15:00',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'michael'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '18:15',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'michael'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '21:30',
    50
);
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'michael'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '11:45',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'michael'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '15:00',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'michael'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '18:15',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'michael'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '21:30',
    50
);

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
WHERE p.slug = 'michael'
ORDER BY f.formato, f.hora;