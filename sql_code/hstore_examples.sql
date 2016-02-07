-- schemaless table
CREATE TABLE kvp_table(id serial, kvp hstore);

-- "a"=>"1", first key is taken
-- a=>2 does not overwrite
SELECT 'a=>1,a=>2'::hstore

-- "col1"=>"123", "col2"=>"foo", "col3"=>"bar"
-- 123 is converted to text
CREATE TABLE test (col1 integer, col2 text, col3 text);
INSERT INTO test VALUES (123, 'foo', 'bar');
SELECT hstore(t) FROM test AS t;

-- list all keys as arrays
SELECT akeys(<mykvpfield>) FROM ...

-- et key value
SELECT mykvpfield->'<key>' FROM ...
-- Test if key exists :
... WHERE mykvpfield ? '<key>';
-- test if key-value exists
... WHERE mykvpfield @> hstore('<key>','<value>')
-- get all key-value pairs as tuples(!)
SELECT each(mykvpfield) FROM ...