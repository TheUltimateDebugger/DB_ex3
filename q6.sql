WITH RECURSIVE neighbour(counter, uid) AS (
    SELECT 0, m1.uid
    FROM members m1
    WHERE m1.name = 'Menachem Begin'
    UNION
    SELECT n.counter + 1, km1.uid
    FROM  memberInKnesset km1, memberInKnesset km2 NATURAL JOIN neighbour n
    WHERE km1.party = km2.party AND km1.number = km2.number AND n.counter < 3)
SELECT DISTINCT m3.uid, m3.name
FROM members m3
WHERE m3.uid NOT IN (SELECT uid FROM neighbour)
ORDER BY m3.uid;


