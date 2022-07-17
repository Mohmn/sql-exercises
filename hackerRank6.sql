
--  chanllenge link
-- https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true
-- problem discription


-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

--     Equilateral: It's a triangle with 

-- sides of equal length.
-- Isosceles: It's a triangle with
-- sides of equal length.
-- Scalene: It's a triangle with
-- sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

--  solution



select CASE 
         WHEN (A+B) <= C Then 'Not A Triangle'
         WHEN (A = B and B= C and A = c) then 'Equilateral'
         WHEN (A !=B and B!=C and A!=c ) then 'Scalene'
         WHEN (A=B or B=c or a = c) then 'Isosceles'
         END                
    from triangles;