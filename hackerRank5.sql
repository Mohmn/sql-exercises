-- break problems into subqueries first

-- challenge link 
-- https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true&h_r=next-challenge&h_v=zen
-- problem desciption
-- You did such a great job helping Julia with her last coding contest 
-- challenge that she wants you to work on this one, too!
-- The total score of a hacker is the sum of their maximum scores 
-- for all of the challenges. Write a query to print the hacker_id, 
-- name, and total score of the hackers ordered by the descending score. 
-- If more than one hacker achieved the same total score, then sort the 
-- result by ascending hacker_id. Exclude all hackers with a total score of
-- from your result.



select t.hacker_id ,hackers.name,sum(t.max_score) as t_score from (
select hacker_id,challenge_id,max(score) as max_score
from submissions
group by hacker_id,challenge_id
    ) as t
    inner join hackers on hackers.hacker_id = t.hacker_id
    group by t.hacker_id,hackers.name
    having t_score > 0
    order by t_score desc,t.hacker_id asc