# Write your MySQL query statement below
WITH CTE_Logs_log AS(
select *, lag(num) over(order by id asc) AS num_lag1, lag(num,2) over(order by id asc) as num_lag2 from Logs

)
select distinct num as ConsecutiveNums  from CTE_Logs_log
WHERE num = num_lag1 AND num_lag1 = num_lag2