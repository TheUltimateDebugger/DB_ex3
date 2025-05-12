SELECT Distinct number, AVG(startYear-birthYear) as "avgAge"
FROM knessets NATURAL JOIN memberInKnesset NATURAL JOIN members
GROUP BY number
ORDER BY number