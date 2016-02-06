WITH movies_etp AS (
	SELECT * from m WHERE name ilike 'P%'
)
SELECT * from movies_etp ORDER BY name;