# Write your MySQL query statement below
SELECT A.name as Customers FROM Customers AS A
LEFT JOIN Orders AS B
ON A.id = B.customerID

WHERE B.customerId is NULL