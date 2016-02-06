SELECT ARRAY[1,2,3+4]; -- {1,2,7}

-- e.g. {1,2,3,4,5,5}
SELECT ARRAY(SELECT 1+(random()*5)::int
FROM generate_series(1,6) ORDER BY 1);