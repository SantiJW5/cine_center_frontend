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
    'slender-man',
    'Slender Man',
    'Terror',
    '98 min.',
    'Mayores de 14',
    'Un grupo de jóvenes investiga una leyenda oscura, sin imaginar que la presencia de Slender Man comenzará a perseguirlos.',
    '/img/slender_man.jpg',
    'https://www.youtube.com/embed/RhgeNY24wZY'
)
ON CONFLICT (slug) DO NOTHING;

-----------------------------------------------

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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '14:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '16:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '19:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '21:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '23:00',
    45
);

---------------------------------------------------


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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '14:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '16:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '19:00',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '21:30',
    45
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'slender-man'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '23:00',
    45
);

----------------------------------------------------------

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
WHERE p.slug = 'slender-man'
ORDER BY f.formato, f.hora;