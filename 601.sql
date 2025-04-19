# Write your MySQL query statement below
WITH CTE_lead_date AS(
    SELECT id, visit_date, people,
lag(people) over(order by visit_date asc) AS Lag1,
lag(people,2) over(order by visit_date asc) AS Lag2,
lead(people) over(order by visit_date asc) AS lead1,
lead(people,2) over(order by visit_date asc) AS lead2
FROM Stadium
)

SELECT id, visit_date, people FROM CTE_lead_date
WHERE (people>=100 AND Lag1>=100 AND Lag2>=100) 
OR (people>=100 AND lead1>=100 AND lead2>=100) 
OR (people>=100 AND lead1>=100 AND Lag1>=100) 



