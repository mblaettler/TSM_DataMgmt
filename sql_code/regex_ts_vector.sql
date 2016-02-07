
-- Table schema
CREATE TABLE sometextcorpus (
  id serial PRIMARY KEY,
  body text
);

SELECT id, body FROM sometextcorpus
WHERE body ILIKE '%hour%'

SELECT * FROM sometextcorpus
WHERE body ~ 'hour'

SELECT id, body FROM sometextcorpus
WHERE body LIKE 'hour%'

SELECT id, body FROM sometextcorpus
WHERE body LIKE '%hour'

SELECT 'hours' ILIKE 'Hours';

-- Exercise 12.1.2
SELECT 'a fat cat sat on a mat and ate fat rats'::tsvector @@ 'cat & rat'::tsquery;

SELECT to_tsvector('a fat cat sat on a mat and ate fat rats') @@ to_tsquery('cat & rat');

SELECT to_tsvector('the quick brown fox jumps over the lazy dog.') @@ to_tsquery('foxes');

SELECT to_tsvector('Wie passend, Du kämpfst wie eine Kuh.') @@ to_tsquery('kämpfen');

-- Exercise 12.1.3
SELECT title FROM articles WHERE to_tsvector(body) @@ to_tsquery('titles');

SELECT title FROM articles WHERE to_tsvector(title || ' ' || body) @@ to_tsquery('hoops');

-- Exercise 12.1.4
SELECT title, ts_rank_cd(to_tsvector(body), query) AS rank
FROM articles, to_tsquery('hoops|(full & useful)') query WHERE query @@ to_tsvector(body)
ORDER BY rank DESC
LIMIT 10;

SELECT title, ts_rank_cd(to_tsvector(body), query, 32 /* rank/(rank+1) */ ) AS rank FROM articles, to_tsquery('hoops|(full & useful)') query
WHERE query @@ to_tsvector(body)
ORDER BY rank DESC
LIMIT 10;




