SELECT A.name as Employee FROM Employee AS A
INNER JOIN Employee AS B
ON A.managerID = B.id
AND A.salary>B.salary