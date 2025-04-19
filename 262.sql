# Write your MySQL query statement below
WITH CTE_Unbanned_trips AS (
    SELECT id, client_id, driver_id, status, request_at 
    FROM Trips
    WHERE client_id NOT IN (
        SELECT users_id FROM Users
        WHERE banned = 'Yes'
    )
    AND driver_id NOT IN(
        SELECT users_id FROM Users
        WHERE banned = 'Yes'
    )
)
SELECT request_at AS 'Day',
ROUND(
    SUM(CASE WHEN LEFT(status, 6) = 'cancel' THEN 1 
             ELSE 0 
        END)/COUNT(*)
    , 2) AS 'Cancellation Rate' 

FROM CTE_Unbanned_trips
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at