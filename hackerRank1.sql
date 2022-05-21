
--  chanllenge link
-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=false
-- problem discription


-- Given the CITY and COUNTRY tables, 
-- query the names of all the continents (COUNTRY.Continent) 
-- and their respective average city populations (CITY.Population)
--  rounded down to the nearest integer.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

--  solution

select country.continent,floor(avg(city.population)) from country
inner join city on city.countrycode = country.code
group by country.continent