-- break problems into subqueries first

-- challenge link 
-- https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true
-- problem desciption
-- Julia asked her students to create some coding challenges.
--  Write a query to print the hacker_id, name, and the total number 
--  of challenges created by each student. Sort your results by the 
--  total number of challenges in descending order. If more than 
--  one student created the same number of challenges, 
--  then sort the result by hacker_id. If more than 
--  one student created the same number of challenges and 
--  the count is less than the maximum number of challenges created,
--  then exclude those students from the result


/*
Enter your query here.
*/

select hk.hacker_id,hk.name,count(challenges.challenge_id) as chl_count
from hackers hk 
inner join challenges on challenges.hacker_id = hk.hacker_id
group by hk.hacker_id,hk.name

having chl_count = (
    select max(t1.c) from (
        select count(challenge_id) as c,hacker_id
        from challenges
        group by hacker_id
    ) t1
    )
    or chl_count in (
        select t2.c from (
            select count(challenge_id) as c,hacker_id
            from challenges
            group by hacker_id
        )t2
        group by t2.c
        having count(t2.c) = 1
        
    )
order by chl_count desc,hk.hacker_id asc
