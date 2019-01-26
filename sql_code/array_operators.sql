-- contained by: returns true
--  is 2 and 7 in ARRAY[1,7,4,2,6]
SELECT ARRAY[2,7]<@ARRAY[1,7,4,2,6];

-- equal: returns true
SELECT ARRAY[1.1,2.1,3.1]::int[]=ARRAY[1,2,3];

-- have elements in common: returns true
SELECT ARRAY[1,4,3]&&ARRAY[2,1];