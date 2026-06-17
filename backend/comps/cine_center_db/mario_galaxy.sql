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
    'super-mario-galaxy',
    'Super Mario Galaxy',
    'Animación / Aventura',
    '105 min.',
    'Todo público',
    'Mario viaja por diferentes galaxias para rescatar a sus amigos y enfrentarse a nuevos desafíos espaciales.',
    '/img/super_mario_galaxy_poster.jpg',
    'https://www.youtube.com/embed/iTzCWDQSwvk'
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '10:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '12:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '15:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '17:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '20:00',
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '10:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '12:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '15:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '17:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'super-mario-galaxy'),
    'Cochabamba',
    '3D DOB',
    '2026-06-01',
    '20:00',
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
WHERE p.slug = 'super-mario-galaxy'
ORDER BY f.formato, f.hora;