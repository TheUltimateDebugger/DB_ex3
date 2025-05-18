SELECT DISTINCT M.number , COUNT(M.party)
FROM memberinknesset M
GROUP BY M.number
ORDER BY M.number ASC;