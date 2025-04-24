# Write your MySQL query statement below

SELECT name, bonus FROM Employee AS A
LEFT JOIN Bonus AS B
ON A.empID = B.empID

WHERE B.Bonus <1000 
OR B.Bonus is NULL