-- ask for dim. of array
array_ndims(ARRAY[[1,2,3],[4,5,6]]) --2
array_dims(ARRAY[[1,2,3],[4,5,6]]) --[1:2][1:3]

-- append/prepend array
SELECT ARRAY[2, 3, 4, 5] || ARRAY[6, 7]; -- {2, 3, 4, 5, 6, 7}
SELECT array_cat(ARRAY[2, 3, 4, 5], ARRAY[6, 7]);

SELECT array_append(ARRAY[2, 3, 4, 5], 6); -- {2, 3, 4, 5, 6}

SELECT array_prepend(1, ARRAY[2, 3, 4, 5]); -- {1, 2, 3, 4, 5}

-- get upper/lower bound of array
array_lower('[0:2]={1,2,3}'::int[], 1) --0
array_upper('[0:2]={1,2,3}'::int[], 1) --2

-- get array length
array_length(array[1,2,3], 1) --3

-- fill array, 2nd arg=length, 3rd arg=lower bound
SELECT array_fill(7, ARRAY[3], ARRAY[2]) -- [2:4]={7,7,7}

-- expand an array to a set of rows
SELECT unnest(ARRAY[1,2]) -- 1 2 as rows

-- conversion
SELECT array_to_string(ARRAY[1, 2, 3, NULL, 5], ',', '*') -- 1,2,3,*,5
SELECT string_to_array('xx~^~yy~^~zz', '~^~', 'yy') -- {xx,NULL,zz}