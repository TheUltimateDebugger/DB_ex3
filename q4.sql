SELECT DISTINCT k.number, m.party, COUNT(*) AS memberCount
FROM knessets k NATURAL JOIN memberInKnesset m
GROUP BY k.number, m.party
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*)
    FROM memberInKnesset m2
    WHERE m2.number = k.number
    GROUP BY m2.party
    )
ORDER BY k.number, m.party