-- 3, ->> gets it as text
SELECT '[1,2,3]'::json->2;

-- 2, --> gets it as text
SELECT '{"a":1,"b":2}'::json->'b';

-- 3, get JSON object at specified path, #>> for text
SELECT '{"a":[1,2,3],"b":[4,5,6]}'::json#>'{a,2}';