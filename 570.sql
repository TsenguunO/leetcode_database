# Write your MySQL query statement below

SELECT A.name from Employee AS A
JOIN (
    
    SELECT managerId FROM Employee
    GROUP BY managerId 
    HAVING count(distinct id) >=5 
    
    ) AS B
ON A.id = B.managerId