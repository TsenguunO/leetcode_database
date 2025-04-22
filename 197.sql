# Write your MySQL query statement below
WITH CTE_temp AS (

SELECT *,
LAG(temperature,1) OVER(ORDER BY recordDate ASC) prev_temperature,
LAG(recordDate,1) OVER(ORDER BY recordDate ASC) prev_recordDate
FROM Weather

)

SELECT Id  FROM CTE_temp
WHERE temperature > prev_temperature
AND DATE_ADD(recordDate, INTERVAL -1 DAY) = prev_recordDate