-- {{meeting},{training}}
SELECT schedule[1:2][1:1]
FROM sal_emp WHERE name = 'Bill';

-- any record where pay_by_quarter contains 10000
-- in this case Bill
SELECT * FROM sal_emp
WHERE 10000 = ANY (pay_by_quarter);

-- 1, 6
SELECT f1[1][-2][3], f1[1][-1][5]
FROM (SELECT '[1:1][-2:-1][3:5] = {{{1,2,3},{4,5,6}}}'::int[] as f1) AS ss;