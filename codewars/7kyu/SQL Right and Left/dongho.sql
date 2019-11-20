--https://www.codewars.com/kata/5943a58f95d5f72cb900006a/train/sql

SELECT LEFT(project, commits) AS project, 
       RIGHT(address, contributors) AS address
  FROM repositories