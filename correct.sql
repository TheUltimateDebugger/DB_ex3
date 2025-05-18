SELECT d1.name AS n1 ,d2.name AS n2
FROM donors d1, donors d2
WHERE d1.cause = d2.cause and d1.name < d2.name AND NOT EXISTS(
    SELECT *
    FROM donors d1_sub
    WHERE d1_sub.name = d1.name AND NOT EXISTS(
        SELECT *
        FROM donors d2_sub
        WHERE d2_sub.name = d2.name AND d2_sub.cause = d1_sub.cause
    )
)
AND
    NOT EXISTS(
    SELECT *
    FROM donors d2_sub
    WHERE d2_sub.name = d2.name AND NOT EXISTS(
        SELECT *
        FROM donors d1_sub
        WHERE d1_sub.name = d1.name AND d1_sub.cause = d2_sub.cause
    )
)
GROUP BY n1, n2
ORDER BY n1, n2