SELECT * FROM player WHERE

-- Sélectionner le joueur qui a le plus nombre de points

-- ça c'est impossible car les fonctions d'agrégation comme MAX sont interdites dans le WHERE
-- SELECT * FROM player WHERE points = MAX(points);

-- en deux étapes (impossible en SQL)
maxPoints = SELECT MAX(points) FROM player;
SELECT * FROM player WHERE points = maxPoints;

-- ça donne, avec une sous requête
SELECT * FROM player WHERE points = (SELECT MAX(points) FROM player);

-- avec cette requête on peut potentiellement avoir plusieurs joueurs,
-- car ils peuvent plusieurs à avoir le même nombre de points

SELECT * FROM player WHERE points = (SELECT MAX(points) FROM player)
ORDER BY birthdate DESC
LIMIT 1;