-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TYPE maker.urn_change AS (
  ink       NUMERIC,
  art       NUMERIC,
  timestamp NUMERIC
  );

CREATE OR REPLACE FUNCTION urn_history(ilk TEXT, urn TEXT)
  RETURNS SETOF maker.urn_change
AS
$body$
WITH
  ilk AS ( SELECT DISTINCT id FROM maker.ilks WHERE ilk = $1),

  inks AS (
    SELECT vat_urn_ink.id, ink, block_timestamp
    FROM maker.vat_urn_ink
           LEFT JOIN headers ON headers.block_number = vat_urn_ink.block_number
    WHERE ilk = (SELECT ilk.id FROM ilk) AND urn = $2
    ORDER BY headers.block_number DESC
  ),

  arts AS (
    SELECT vat_urn_art.id, art::numeric, block_timestamp
    FROM maker.vat_urn_art -- Fix type of art
           LEFT JOIN headers ON headers.block_number = vat_urn_art.block_number
    WHERE ilk = (SELECT ilk.id FROM ilk) AND urn = $2
    ORDER BY headers.block_number DESC
  )

SELECT ink, art, block_timestamp FROM (
  SELECT ink, null AS art, block_timestamp FROM inks
  UNION ALL
  SELECT null AS ink, art, block_timestamp FROM arts
) AS updates ORDER BY block_timestamp DESC

$body$
  LANGUAGE SQL;


-- +goose Down
-- SQL in this section is executed when the migration is rolled back.

DROP FUNCTION IF EXISTS urn_history(ilk TEXT, urn TEXT);
DROP TYPE IF EXISTS maker.urn_change CASCADE;