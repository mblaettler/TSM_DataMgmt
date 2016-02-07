CREATE TABLE graph (id serial, node1 int,
node2 int);
INSERT INTO graph(node1, node2) values
(1, 2),(1, 3),(1, 4),(3, 4),(3, 5),(4, 5),(5, 6);

WITH RECURSIVE
	graph_cte (node1, node2) AS (
	SELECT node1, node2 from graph
	UNION ALL
	SELECT node2 AS "node1", node1 AS "node2" FROM graph
),
paths (node1,node2,path) AS (
	SELECT node1, node2, ARRAY[node1] AS "path"
		FROM graph_cte b1
		WHERE b1.node1 = 2 --<<< Start Node >>>
	UNION ALL
	SELECT b2.node1,b2.node2,p.path || b2.node1
		FROM graph_cte b2
		JOIN paths p
		ON (p.node2 = b2.node1
		AND b2.node1 <> ALL (p.path[2:array_upper(p.path,1)]) /* Prevent re-tracing */
		)
)
SELECT path || node2 AS "path"
	FROM paths
	WHERE node2 = 6 --<<< End node >>>
	--AND ARRAY[2,3] <@ path -- <<< via... >>> - <@ means 'is contained by'
ORDER BY array_length(path,1), path;