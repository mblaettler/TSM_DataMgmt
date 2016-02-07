-- Table schema
CREATE TABLE sometextcorpus (
  id serial PRIMARY KEY,
  body text
);

-- ILIKE: string pattern matching
SELECT id, body FROM sometextcorpus
WHERE body ILIKE '%hour%';

-- ~: followed by regular expression
SELECT * FROM sometextcorpus
WHERE body ~ 'hour';

-- to_tsvector parses and normalizes
SELECT to_tsvector(
 'a fat cat sat on a mat and ate fat rats')
 @@ to_tsquery('cat & rat');

SELECT title FROM articles WHERE to_tsvector(
 title || ' ' || body) 
 @@ to_tsquery('hoops');
 
-- ts_rank_cd example
SELECT title, ts_rank_cd(to_tsvector(body)
 , query, 32 /* rank/(rank+1) */ ) AS rank
 FROM articles,
 to_tsquery('hoops|(full & useful)') query
WHERE query @@ to_tsvector(body)
ORDER BY rank DESC
LIMIT 10;