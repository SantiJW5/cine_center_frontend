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
ON CONFLICT (slug) DO NOTHING;