-- Sélectionner tous les enregistrements d'une table
SELECT * FROM player;

-- Sélectionner tous les enregistrements d'une table en ne récupérant
-- que certaines colonnes
SELECT name, email FROM player;

-- Sélectionner tous les enregistrements correspondant à une
-- ou plusieurs conditions
-- OPERATEURS LOGIQUES : AND et OR
SELECT * FROM player WHERE id = 2; -- égal à
SELECT * FROM player WHERE id != 2; -- différent de
SELECT * FROM player WHERE name = 'Thor';

-- AND : les conditions doivent toutes être vraies
SELECT * FROM player
WHERE birthdate > '2009-12-31'
AND points <= 100;

-- OR : une seule condition vraie suffit
SELECT * FROM player
WHERE birthdate > '2009-12-31'
OR points <= 100;

-- Mix AND OR
SELECT * FROM player
WHERE birthdate > '2009-12-31'
OR points <= 30
AND points >= 10;

-- Privilégier le OR grâce à des parenthèses
SELECT * FROM player
WHERE (birthdate > '2009-12-31'
OR points <= 30)
AND points >= 10;

5 + 4 * 6
5 + 24 = 29

(5 + 4) * 6
20 * 6 = 120

-- Autres opérateurs de comparaison
-- Sélectionner des enregistrements dont un champ respecte un certain format
-- Opérateur LIKE
-- % (pourcentage) : 0, 1 ou une infinité de caractères
-- _ (tiret du bas) : un et un seul caractère

-- termine par
SELECT * FROM player WHERE email LIKE '%@sfr.fr'

-- commence par
SELECT * FROM player WHERE name LIKE 't%'

-- commence par m suivi précisément de 3 caractères
SELECT * FROM player WHERE name LIKE 'm___'

-- contient
SELECT * FROM player WHER name LIKE '%an%'

-- Opérateur IN
-- Sélectionner des enregistrements dont la valeur d'un champ se trouve
-- dans une liste prédéfinie
SELECT * FROM player
WHERE name IN ('fab', 'thor', 'toto');

SELECT name, email FROM player
WHERE points IN (10, 20, 30, 40);

-- Opérateur BETWEEN
-- Sélectionner des enregistrements dont la valeur d'un champ
-- se situe entre deux valeurs
SELECT * FROM player WHERE points BETWEEN 50 AND 100;
-- équivalent avec un AND :
SELECT * FROM player WHERE points >= 50 AND points <= 100;

-- Opérateur inversion
-- Tous les joueurs dont le nombre de points n'est ni 10, ni 20, ni 30, ni 40
SELECT name, email FROM player
WHERE points NOT IN (10, 20, 30, 40);

-- Tous les joueurs dont l'adresse email ne termine pas @sfr.fr
SELECT * FROM player WHERE email NOT LIKE '%@sfr.fr'

SELECT * FROM player WHERE points NOT BETWEEN 50 AND 100;

-- Clause ORDER BY : trier les résultats
-- On peut trier les résultats suivant un ou plusieurs champs (clause en fin de requête)

-- trier par nom par ordre alphabétique : ASC
SELECT * FROM player ORDER BY name ASC;
SELECT * FROM player ORDER BY points ASC; -- croissant
SELECT * FROM player ORDER BY birthdate ASC; -- chronologique
SELECT * FROM player ORDER BY name DESC; -- alphabétique inversé
SELECT * FROM player ORDER BY points DESC; -- décroissant
SELECT * FROM player ORDER BY birthdate DESC; -- anti chronologique

-- On peut cumuler les tris : si jamais les valeurs sont identitiques pour le premier tri,
-- quel est l'ordre de tri suivant. Ex:
-- ici on trie du plus vieux au plus jeune, si jamais certains sont nés le même jour,
-- alors ils seront triés de celui qui a le moins de points vers celui qui en a le plus
SELECT * FROM `player` ORDER BY birthdate ASC, points ASC