-- Ecrivez les requêtes SQL qui sélectionnent :

-- Les joueurs qui habitent Paris (75000), et qui ont plus de 75 points,
-- ainsi que les joueurs qui habitent Lille
-- et qui ont plus de 50 points
SELECT * FROM player
WHERE zipcode = '75000' AND points > 75
OR zipcode = '59000' AND points > 50;

-- Les joueurs qui habitent Arras (62000), qui ont une adresse mail chez wanadoo.fr,
-- et dont le nombre de points est compris
-- entre 15 et 25
SELECT * FROM player WHERE zipcode = '62000' AND email LIKE '%@wanadoo.fr'
AND points BETWEEN 15 AND 25;

-- Le nombre de points par ville, en excluant les villes dont le nombre de points est inférieur à 30
SELECT zipcode, SUM(points) FROM player GROUP BY zipcode HAVING SUM(points) >= 30

-- Le nom et l'équipe des joueurs qui habitent à Lille (59000), qui ont un nombre de points en 50 et 60,
-- qui font partie de l'équipe 1,
-- ainsi que le nom et l'équipe des joueurs de l'équipe 3 dont le nom commence par "t"
SELECT name, team FROM player
WHERE zipcode = '59000' AND points BETWEEN 50 AND 60 AND team = 1
OR team = 3 AND name LIKE 't%';

-- le nombre de joueurs dont le mois de naissance est octobre,
-- en comptant uniquement les joueurs qui ont plus de 30 points
SELECT COUNT(*) FROM player
WHERE MONTH(birthdate) = 10 AND points > 30

SELECT COUNT(*) FROM player
WHERE birthdate LIKE '%-10-%' AND points > 30
