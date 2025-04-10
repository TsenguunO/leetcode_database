WITH CTE_Salary AS (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 2
)
SELECT 
    CASE 
        WHEN COUNT(*) = 1 THEN NULL
        ELSE MIN(salary)
    END AS SecondHighestSalary
FROM CTE_Salary;
