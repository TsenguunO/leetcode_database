# Write your MySQL query statement below
SELECT 
P.firstname,
P.lastname,
A.city,
A.state

FROM Person AS P
LEFT JOIN Address AS A
ON P.personId = A.personID
