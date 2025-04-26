SELECT customer_number 
FROM orders
group by customer_number
having count(*)>0
order by count(*) desc
limit 1

