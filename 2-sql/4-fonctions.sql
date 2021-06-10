-- I / Fonctions scalaires
-- Une fonction scalaire c'est une fonction qui va appliquer un traitement sur un champ de chaque enregistrement
-- UPPER / LOWER : majuscule / minuscle
SELECT id, UPPER(name), email FROM player;

-- REVERSE : inverse les caractères
-- CONCAT : assemble plusieurs chaines de caractères
SELECT id, CONCAT(name, ' - ', email) FROM player

-- ROUND(value) : arrondir à unit
-- ROUND(value, 1) : arrondir au dixième
-- TRUNCATE(value, 1) : couper/tronquer au dixième

-- YEAR, MONTH, DAY, HOUR, MINUT, SECOND

-- On peut utiliser ces fonctions dans le SELECT ou dans le WHERE
SELECT * FROM player WHERE DAY(birthdate) = 1

-- II / Fonction d'agrégation
-- Ce sont des fonctions qui s'applique sur un ensemble de valeur : elles regroupents les lignes

-- COUNT
-- SUM
-- AVG
-- MIN / MAX
-- GROUP_CONCAT

-- Sélectionne le nombre de points par équipe, en récupérant les noms de tous les joueurs dans chaque groupe

SELECT SUM(points), team GROUP_CONCAT(name)  FROM player GROUP BY team;
SELECT SUM(points), team, GROUP_CONCAT(name SEPARATOR ' / ') FROM player GROUP BY team