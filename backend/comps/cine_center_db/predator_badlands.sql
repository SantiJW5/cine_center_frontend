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
    'predator-badlands',
    'Predator Badlands',
    'Acción / Ciencia ficción',
    '120 min.',
    'Mayores de 16',
    'En un territorio hostil, un nuevo enfrentamiento contra el Predator desata una lucha brutal por sobrevivir.',
    '/img/predator_badlands.jpg',
    'https://www.youtube.com/embed/43R9l7EkJwE'
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '12:45',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '15:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '18:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '20:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D DOB',
    '2026-06-01',
    '22:50',
    55
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '12:45',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '15:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '18:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '20:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D SUB',
    '2026-06-01',
    '22:50',
    55
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
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '12:45',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '15:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '18:00',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '20:30',
    55
),
(
    (SELECT id_pelicula FROM peliculas WHERE slug = 'predator-badlands'),
    'Cochabamba',
    '2D CXC Atmos DOB',
    '2026-06-01',
    '22:50',
    55
);