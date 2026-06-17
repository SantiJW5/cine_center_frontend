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
    'scary-movie-6',
    'Scary Movie 6',
    'Comedia / Terror',
    '95 min.',
    'Mayores de 14',
    'Una nueva parodia de terror llega con situaciones absurdas, sustos inesperados y muchas referencias al cine moderno.',
    '/img/scarymovie6.jpg',
    'https://www.youtube.com/embed/CwFNxa67WEo'
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '12:15',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '14:45',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '17:15',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '19:45',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '22:15',
    45
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '12:15',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '14:45',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '17:15',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '19:45',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'scary-movie-6'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '22:15',
    45
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
WHERE p.slug = 'scary-movie-6'
ORDER BY f.formato, f.hora;