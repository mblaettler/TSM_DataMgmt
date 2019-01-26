SELECT kalenderwoche, artikelgruppe, ort, SUM(anzahl) as summe
FROM OP_VERKAUF
WHERE monat = 03 AND jahr = 2011 AND warenkategorie = 'Fisch'
GROUP BY ROLLUP(artikelgruppe, kalenderwoche, ort)
-- NOTE: HAVING is WHERE for aggregated functions
HAVING GROUPING(kalenderwoche) + GROUPING(artikelgruppe) + GROUPING(ort) < 3;