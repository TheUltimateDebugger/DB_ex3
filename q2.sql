SELECT Distinct number, AVG(startYear-birthYear) as "avgage"
FROM knessets NATURAL JOIN memberInKnesset NATURAL JOIN members
GROUP BY number
ORDER BY number