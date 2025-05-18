SELECT DISTINCT name
FROM memberInKnesset NATURAL JOIN members
GROUP BY uid, name
HAVING COUNT(DISTINCT number) > 4 and COUNT(DISTINCT party) = 1
ORDER BY name;
