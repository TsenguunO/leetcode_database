CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.

    SELECT 
    CASE 
    WHEN N<0 THEN NULL
    WHEN COUNT(*)<N THEN NULL
    ELSE MIN(salary) 
    END AS SAL
    FROM
    (
    SELECT DISTINCT salary FROM Employee
    ORDER BY salary DESC
    LIMIT N
    ) AS T
  );
END