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
    'digital-circus',
    'Digital Circus',
    'Animación / Fantasía',
    '100 min.',
    'Todo público',
    'Un grupo de personajes queda atrapado dentro de un extraño circo digital lleno de aventuras, misterios y situaciones inesperadas.',
    '/img/digitalcircus.jpg',
    'https://www.youtube.com/embed/AjFk1cY265I'
)
ON CONFLICT (slug) DO NOTHING;

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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '10:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '13:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '15:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '18:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '20:30',
    45
);

----------------------------------------------

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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '10:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '13:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '15:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '18:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'digital-circus'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '20:30',
    45
);

-------------------------------------------------------------

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
WHERE p.slug = 'digital-circus'
ORDER BY f.formato, f.hora;