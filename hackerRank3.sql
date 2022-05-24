


--  chanllenge link
https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
-- problem discription


-- Julia just finished conducting a coding contest, 
-- and she needs your help assembling the leaderboard!
--  Write a query to print the respective hacker_id and name of hackers who achieved 
--  full scores for more than one challenge. Order your output in descending order 
--  by the total number of challenges in which the hacker earned a full score. 
--  If more than one hacker received full scores in same number of challenges, 
--  then sort them by ascending hacker_id.

-- Write a query to help Eve.

-- solutionn

select hack.hacker_id,hack.name from submissions as sub
    inner join hackers as hack on hack.hacker_id = sub.hacker_id
    inner join challenges as ch on sub.challenge_id = ch.challenge_id
        inner join difficulty as dif on dif.difficulty_level = ch.difficulty_level
        where (sub.score = dif.score and ch.difficulty_level = dif.difficulty_level)
        group by hack.hacker_id,hack.name
                having count(sub.hacker_id) > 1
        order by count(sub.hacker_id) desc,sub.hacker_id asc


--  lessons having is used where group by
-- use where for conditions like if in a for loop
-- and  select if ilke if(print('something) else print('something else')