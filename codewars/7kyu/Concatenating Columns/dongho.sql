--https://www.codewars.com/kata/59440034e94fae05b2000073/train/sql

-- ���ڿ���ġ��(postgreSQL 9.6)
SELECT concat(concat(concat(prefix, ' ', first),' ',last),' ',suffix) as title
  FROM names