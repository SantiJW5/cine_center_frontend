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
    'chainsaw-man-el-arco-de-reze',
    'Chainsaw Man: El Arco de Reze',
    'Anime / Acción',
    '110 min.',
    'Mayores de 16',
    'Denji conoce a Reze, una misteriosa chica que cambiará su vida mientras nuevos enemigos aparecen en su camino.',
    '/img/reze_arc.jpg',
    'https://www.youtube.com/embed/eRXMdJoXRGQ'
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '13:15',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '15:45',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '18:15',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '20:45',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '22:45',
    48
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '13:15',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '15:45',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '18:15',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '20:45',
    48
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'chainsaw-man-el-arco-de-reze'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '22:45',
    48
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
WHERE p.slug = 'chainsaw-man-el-arco-de-reze'
ORDER BY f.formato, f.hora;