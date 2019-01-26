-- ->> gets it as text
SELECT '[1,2,3]'::json->>2;
-- use cast to get another type
SELECT CAST('[1,2,3]'::json->>2 AS INTEGER);

-- -> gets it as json
SELECT '{"a":1,"b":2}'::json->'b';

-- JSON object at specified path as json
SELECT '{"a":[1,2,3],"b":[4,5,6]}'::json#>'{a,2}';
-- JSON object at specified path as text
SELECT '{"a":[1,2,3],"b":[4,5,6]}'::json#>>'{a,2}';

-- contains (only jsonb). Both statements return true
SELECT '{"a": 2}'::jsonb <@'{"a":2,"b":[4,5,6]}'::jsonb;
SELECT '{"b": [4,5]}'::jsonb <@'{"a":2,"b":[4,5,6]}'::jsonb;