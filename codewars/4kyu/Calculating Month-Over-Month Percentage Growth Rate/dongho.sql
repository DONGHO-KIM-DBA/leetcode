--https://www.codewars.com/kata/589e0837e10c4a1018000028/train/sql
--PostgreSQL 9.6

SELECT -- 첫일 '-01'로 하드코딩 오류
       CAST(date_trunc('MONTH', created_at) AS date) AS date,
       count(*) AS count, 
       -- (현재월-전월) / 전월 * 100 = 증가율(소수점 1자리 반올림, %표시)
       ROUND(CAST(float8 (count(*) - LAG(count(*)) over (order by CAST(date_trunc('MONTH',created_at) AS date)))       
                 / LAG(count(*)) over (order by cast(date_trunc('MONTH',created_at) AS date)) AS numeric)*100,1)||'%'               
       AS percent_growth
  FROM posts
 GROUP BY 1
 ORDER BY 1