CREATE TABLE filiale AS
SELECT DISTINCT(filialnr), filiale, plz, ort
FROM op_verkauf
ORDER BY filialnr;
ALTER TABLE filiale
ADD PRIMARY KEY (filialnr);

CREATE TABLE artikel AS
SELECT DISTINCT(artnr), bezeichnung, artikelgruppe, warenkategorie, preis, mwst_satz
FROM op_verkauf
ORDER BY artnr;
ALTER TABLE artikel
ADD PRIMARY KEY (artnr);

CREATE TABLE fact_table AS
SELECT filialnr, artnr, anzahl
FROM op_verkauf;
ALTER TABLE fact_table
ADD FOREIGN KEY (filialnr) REFERENCES filiale (filialnr);
ALTER TABLE fact_table
ADD FOREIGN KEY (artnr) REFERENCES artikel (artnr);