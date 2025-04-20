# Write your MySQL query statement below
WITH CTE_full AS (
SELECT B.name AS Department, A.name AS Employee, A.salary as Salary 
FROM Employee AS A
JOIN Department AS B
ON A.departmentid = B.id
)

SELECT A.Department, A.Employee, A.Salary
FROM CTE_full AS A
INNER JOIN (SELECT Department, MAX(salary) as Salary
FROM CTE_full
GROUP BY Department
) AS B

ON A.Department = B.Department
AND A.Salary = B.Salary