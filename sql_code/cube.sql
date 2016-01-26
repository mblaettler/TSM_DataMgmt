SELECT kalenderwoche, artikelgruppe, SUM(anzahl) as summe
FROM OP_VERKAUF
WHERE monat = 03 AND jahr = 2011 AND warenkategorie = 'Fisch'
GROUP BY CUBE(artikelgruppe, kalenderwoche);