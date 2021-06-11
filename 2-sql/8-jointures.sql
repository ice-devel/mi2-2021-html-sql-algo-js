-- Les jointures

-- Les types de relation
-- manyToOne / oneToMany (n -> 1, 1 -> n)
-- manyToMany (n -> n)
-- oneToOne

-- manyToOne / oneToMany
-- la relation peut être bidirectionnelle : a partir d'un joueur on peut récupérer l'équipe,
-- à partir de l'équipe on peut récupérer les joueurs

-- On a un côté propriétaire : owning-side, et le côté inverse : inverse-side
-- Le owning, c'est la table qui va avoir une colonne en plus : ici ce sont les joueurs "team_id". Cette colonne
-- est une référence à un enregistrement d'une autre table : la table team

-- Ca permet de séparer les deux concepts, d'éviter de dupliquer des donnéees (pas besoin de réécrire le nom de l'équipe
-- pour chaque joueur)

SELECT * FROM player INNER JOIN team ON player.team = team.id

-- Certaines colonnes peuvent avoir le même nom dans les deux tables, il faut donc les préfixer par le nom de la table
SELECT player.name, player.email, team.name FROM `player` INNER JOIN team ON player.team = team.id

-- Alias de table : en général, on utilise des alias pour remplacer le nom des tables
SELECT P.name, P.email, T.name
FROM player P INNER JOIN team T ON P.team = T.id

-- Jointure interne

-- Une jointure interne, c'est le INNER JOIN suivi d'un ON
-- Dans le ON, on met la condition de jointure, c'est à dire quel est le champ (team)
-- dans player qui sert à faire la liaison avec l'id dans la table team

-- La jointure interne ne renvoie que les enregistrements dont la condition de jointure
-- est satisfaite : ici les joueurs qui n'ont pas d'équipe ne ressortiront pas dans les résultats

-- Jointure externe

SELECT P.name, P.email, T.name
FROM player P LEFT OUTER JOIN team T ON P.team = T.id

-- Une jointure externe renvoie tous les enregistrements de la table prioritaire, même
-- si la condition de jointure n'est pas satisfaite : dans notre exemple,
-- tous les joueurs vont ressortir dans les résultats, même si ils n'ont pas d'équipe.
-- Toutes les colonnes demandées dans le SELECT faisant référence àdes informations de l'équipe
-- seront à NULL pour ces joueurs.

SELECT P.name, P.email, T.name
FROM player P LEFT JOIN team T ON P.team = T.id

-- En utilisant RIGHT à la place de LEFT, on priorise la table à droite, ici
-- ça veut dire que l'on absolument toutes les équipes mêmes si il n'y a pas
-- de joueur dedans

-- les deux en même temps
SELECT P.name, P.email, T.name FROM player P FULL OUTER JOIN team T ON P.team = T.id

-- pour mysql, ça marche pas donc :
SELECT P.name, P.email, T.name FROM player P LEFT OUTER JOIN team T ON P.team = T.id
UNION
SELECT P.name, P.email, T.name FROM player P RIGHT OUTER JOIN team T ON P.team = T.id

-- raccourci :
-- on peut écrire
JOIN -- pour INNER JOIN
LEFT JOIN -- pour LEFT OUTER JOIN
RIGHT JOIN -- pour RIGHT OUTER JOIN

-- ManyToMany
-- liaison pour récupérer tous les joueurs avec tous leurs pouvoirs, même
-- ceux qui n'en ont pas
SELECT * FROM player P
LEFT JOIN player_power PP ON P.id = PP.player_id
LEFT JOIN power PO ON PO.id = PP.power_id

-- récupérer les joueurs avec leurs pouvoirs, uniquement ceux qui ont au moins un pouvoir
SELECT * FROM player P
INNER JOIN player_power PP ON P.id = PP.player_id
INNER JOIN power PO ON PO.id = PP.power_id

-- sélectionner les pouvoirs du joueur 1
SELECT * FROM power PO
INNER JOIN player_power PP ON PO.id = PP.power_id
WHERE PP.player_id = 1

SELECT * FROM power PO
INNER JOIN player_power PP ON PO.id = PP.power_id
INNER JOIN player P ON PP.player_id = P.id
WHERE P.name = 'Thor'

