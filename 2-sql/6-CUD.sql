-- Requête d'insertion
INSERT INTO player (id, name, birthdate, email, points, team, zipcode)
VALUES (NULL, 'Machin', '2000-12-31', 'machin@gmail.com', 0, 1, '59000');

-- Si un champ peut être NULL, on peut l'omettre dans la requête
INSERT INTO player (id, name, email, points, team, zipcode)
VALUES (NULL, 'Machin', 'machin@gmail.com', 0, 1, '59000');

-- Il est possible de ne préciser aucun champ, et donc il faudra une valeur pour chaque
-- champ en base, exactement dans le même ordre que celui de la base
INSERT INTO player
VALUES (NULL, 'Machin', '2000-12-31', 'machin@gmail.com', 0, 1, '59000');

-- On peut faire plusieurs insertions dans la même table en une seule requête
INSERT INTO player
VALUES (NULL, 'Machin', '2000-12-31', 'machin@gmail.com', 0, 1, '59000'),
(NULL, 'Machin2', '2000-12-15', 'machin2@gmail.com', 0, 1, '75000');

-- Requête de modification
UPDATE player SET name = 'Bidule', email = 'bidule@gmail.com' WHERE id = 8;
UPDATE player SET points = 15 WHERE points < 5;

-- Le WHERE fonctionne exactement comme dans la requête SELECT, elle sert à préciser
-- quels sont les enregistrements que l'on mettre à jour

-- réutiliser la valeur actuelle avant le changement : ajouter 15 points à tout le monde
UPDATE player SET points = points + 15;

-- Requête de suppression
DELETE FROM player; -- mega danger, pas de where : suppression de tous les enregistrements
DELETE FROM player WHERE id = 6;
DELETE FROM player WHERE email LIKE '%@aol.com';