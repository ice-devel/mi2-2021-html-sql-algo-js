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
-- Requête de suppression