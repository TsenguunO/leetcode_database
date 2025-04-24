# Write your MySQL query statement below




SELECT ROUND(sum(tiv_2016 ),2) AS tiv_2016 
FROM Insurance AS A
JOIN (SELECT lat, lon
FROM Insurance


GROUP BY lat, lon
HAVING count(*)<2
) AS B
ON A.lat = B.lat AND
A.lon = B.lon

WHERE A.tiv_2015 IN(SELECT tiv_2015 
FROM Insurance
GROUP BY tiv_2015
HAVING count(*)>1)