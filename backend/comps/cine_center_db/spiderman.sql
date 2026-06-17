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
    'spider-man-brand-new-day',
    'Spider-Man Brand New Day',
    'Acción / Aventura',
    '125 min.',
    'Todo público',
    'Peter Parker inicia una nueva etapa como Spider-Man, enfrentando nuevos enemigos y descubriendo el verdadero peso de ser un héroe.',
    '/img/spidermanbrandnewday.jpg',
    'https://www.youtube.com/embed/Pw1X-57Ms-8'
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '12:00',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '14:30',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '17:00',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '19:30',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '22:00',
    50
);

--------------------------------------------------------


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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '12:00',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '14:30',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '17:00',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '19:30',
    50
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'spider-man-brand-new-day'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '22:00',
    50
);

-------------------------------------------------

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
WHERE p.slug = 'spider-man-brand-new-day'
ORDER BY f.formato, f.hora;