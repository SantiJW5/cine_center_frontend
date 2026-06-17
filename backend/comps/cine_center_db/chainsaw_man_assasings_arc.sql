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
    'chainsawman-assasings-arc',
    'Chainsawman assasings arc',
    'Anime / Acción',
    '115 min.',
    'Mayores de 16',
    'Denji vuelve a enfrentarse a una amenaza llena de violencia, persecuciones y enemigos que buscan acabar con Chainsaw Man.',
    '/img/chainsawman_assasings_arc.jpg',
    'https://www.youtube.com/embed/_PRaywfa1LE'
)
ON CONFLICT (slug) DO NOTHING;

-------------------

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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '12:20',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '15:10',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '18:00',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '20:50',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '23:10',
    48
);

-----------------------------------

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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '12:20',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '15:10',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '18:00',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '20:50',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsawman-assasings-arc'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '23:10',
    48
);

--------------------

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
WHERE p.slug = 'chainsawman-assasings-arc'
ORDER BY f.formato, f.hora;