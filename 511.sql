# Write your MySQL query statement below
SELECT 
    A.player_id, 
    A.event_date as first_login 

FROM Activity AS A

INNER JOIN (SELECT player_id, min(event_date) AS event_date FROM Activity GROUP BY player_id) AS B
ON A.player_id = B.player_id
AND A.event_date = B.event_date



