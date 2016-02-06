WITH RECURSIVE t(n) AS (
	-- non-recursive term
	SELECT 1 --set n=1
	UNION ALL
	-- recursive term
	SELECT n+1 FROM t WHERE n < 10
) -- creates table with 1..10
SELECT sum(n) FROM t; -- 55