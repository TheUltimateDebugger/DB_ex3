WITH femaleCount AS (SELECT party, number, COUNT(*) AS females
                     FROM memberinknesset NATURAL JOIN members
                     WHERE gender = 'female'
                     GROUP BY party, number
                     ),
    totalCount AS (SELECT party, number, COUNT(*) AS total
                  FROM memberinknesset
                  GROUP BY party, number
                  )
SELECT femaleCount.party, femaleCount.number, (100 * femaleCount.females / totalCount.total) AS femalePercent
FROM femaleCount JOIN totalCount ON femaleCount.party = totalCount.party AND femaleCount.number = totalCount.number
WHERE (100 * femaleCount.females / totalCount.total) > 29
ORDER BY femaleCount.party, femaleCount.number;


-- with femalePartyCount(number,party, femaleCount) as
-- (select number, party, count(distinct uid)
-- from memberInKnesset natural join members
-- where gender='female'
-- group by number, party),
-- partySize(number, party, psize) as
-- (select number, party, count(distinct uid) as psize
-- from memberInKnesset
-- group by number, party)
--
-- select party,number,femalecount*100/psize as femalePercent
-- from femalePartyCount natural join partySize
-- where femalecount*100.0/psize >=30
-- order by party, number;