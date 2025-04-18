-- # Write your MySQL query statement below
-- SELECT *, rank() over(partition by score order by score desc) FROM Scores
-- ORDER BY score desc

WITH CTE_score AS(
    select distinct score as score from Scores 
),
CTE_rank AS (
    select score, row_number() over(order by score desc) as score_rank 
    from CTE_score
)
select A.score, B.score_rank as 'rank' from Scores           AS A
join CTE_rank AS B
on A.score = B.score
order by A.score desc