-- GROUP BY / grouper les enregistrements

-- sélectionne le nombre de points par équipe :
-- on groupe les joueurs par équipe, et on sélectionne la somme (SUM) de leurs points
SELECT team, SUM(points) FROM player GROUP BY team

-- On peut cumuler plusieurs groupements
SELECT team, SUM(points) FROM player GROUP BY team, zipcode

-- Conditionner un GROUP BY : HAVING
-- Obtenir le nombre par équipe en excluant les équipes qui n'ont pas au moins 10 points
SELECT team, SUM(points) FROM player
GROUP BY team HAVING SUM(points) > 10

-- Le HAVING est au GROUP BY ce que le WHERE est au SELECT

-- Condtionner un GROUP BY en filtrant également les enregistrements
-- Sélectionner le nombre de points par équipe en ne comptant pas les points des joueurs qui sont nés
-- avant 2010 (et en excluant du coup également les joueurs qui n'ont pas de date de naissance)
-- et ne sortant que les équipes qui ont au moins 10 points
-- en triant de l'équipe qui a le plus de points vers celle qui en a le moins
SELECT team, SUM(points)
FROM player
WHERE birthdate >= '2010-01-01'
GROUP BY team
HAVING SUM(points) > 10
ORDER BY SUM(points) DESC
