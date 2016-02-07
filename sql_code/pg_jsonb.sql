CREATE INDEX on movies_jsonb(
	(movie#>>'{actors,0,lastname}')
);

CREATE INDEX idx_ops on movies_jsonb
USING gin (movie);

CREATE INDEX idx_path_ops on movies_jsonb
USING gin (movie jsonb_path_ops);