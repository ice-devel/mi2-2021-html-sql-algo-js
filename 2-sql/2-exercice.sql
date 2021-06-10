-- Ecrivez les requêtes SQL suivantes qui

-- Sélectionne les joueurs dont l'id est supérieur à 3
SELECT * FROM player WHERE id > 3;
-- Sélectionne les joueurs dont le nom est Dupond et l'adresse mail est dupond@gmail.com
SELECT * FROM player WHERE name = 'Dupond' AND email = 'dupond@gmail.com';
-- Sélectionne les joueurs triés par date de naissance
SELECT * FROM player ORDER BY birthdate;
-- Sélectionne les joueurs dont la date de naissance est au moins 2005, triés par nom
SELECT * FROM player WHERE birthdate >= '2005-01-01' ORDER BY name ;
SELECT * FROM player WHERE YEAR(birthdate) >= 2005 ORDER BY name;
-- Sélectionne les joueurs dont l'adresse email termine soit par hotmail.com, soit par yahoo.fr
SELECT * FROM player WHERE email LIKE '%hotmail.com' OR email LIKE '%@yahoo.fr';
-- Sélectionne les joueurs dont le nom commence par "s", ou dont le nombre de points est compris entre 50 et 100
SELECT * FROM player WHERE name LIKE 's%' OR points >= 50 AND points <= 100;
SELECT * FROM player WHERE name LIKE 's%' OR points BETWEEN 50 AND 100;
