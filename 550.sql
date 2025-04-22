-- SELECT 
--   ROUND(
--     COUNT(DISTINCT A.player_id) * 1.0 /
--     (SELECT COUNT(DISTINCT player_id) FROM Activity),
--     2
--   ) AS fraction  
-- FROM Activity AS A
-- JOIN Activity AS B
--   ON A.player_id = B.player_id
--   AND A.event_date = DATE_ADD(B.event_date, INTERVAL 1 DAY);


SELECT 

    ROUND(COUNT( DISTINCT A.player_id)*1

    /(SELECT COUNT(DISTINCT player_id) FROM Activity)
,2) as fraction 
FROM Activity AS A
JOIN (SELECT B.player_id, B.event_date 
      
      FROM Activity AS B
      JOIN (SELECT player_id , min(event_date) AS event_date FROM Activity 
            GROUP BY player_id) AS C

      ON B.player_id = C.player_id
      AND  C.event_date = B.event_date) AS D
ON A.player_id = D.player_id
AND A.event_date = DATE_ADD(D.event_date, INTERVAL 1 DAY);


