# Write your MySQL query statement below
WITH CTE_Salary AS (
    SELECT 
    D.name AS Department,
    E.name AS Employee,
    E.salary AS Salary

    FROM Employee AS E
    JOIN Department AS D
    ON E.departmentId = D.id
),
CTE_Salary_Rank AS(
SELECT Department, Salary, ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Salary DESC) AS Salary_Rank
FROM (SELECT DISTINCT Department, Salary FROM CTE_Salary) AS Temp
)
-- SELECT * FROM CTE_Salary_Rank
SELECT A.Department, Employee, A.Salary
FROM CTE_Salary AS A
JOIN CTE_Salary_Rank AS B
ON A.Department = B.Department
AND A.Salary = B.Salary 

WHERE B.Salary_Rank <=3