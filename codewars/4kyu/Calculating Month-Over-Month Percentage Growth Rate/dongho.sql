--https://www.codewars.com/kata/589e0837e10c4a1018000028/train/sql
--PostgreSQL 9.6

SELECT -- ù�� '-01'�� �ϵ��ڵ� ����
       CAST(date_trunc('MONTH', created_at) AS date) AS date,
       count(*) AS count, 
       -- (�����-����) / ���� * 100 = ������(�Ҽ��� 1�ڸ� �ݿø�, %ǥ��)
       ROUND(CAST(float8 (count(*) - LAG(count(*)) over (order by CAST(date_trunc('MONTH',created_at) AS date)))       
                 / LAG(count(*)) over (order by cast(date_trunc('MONTH',created_at) AS date)) AS numeric)*100,1)||'%'               
       AS percent_growth
  FROM posts
 GROUP BY 1
 ORDER BY 1