CREATE TABLE maker.vat_fold (
  id        SERIAL PRIMARY KEY,
  header_id INTEGER NOT NULL REFERENCES headers (id) ON DELETE CASCADE,
  ilk       TEXT,
  urn       TEXT,
  rate      NUMERIC,
  log_idx   INTEGER NOT NULL,
  tx_idx    INTEGER NOT NULL,
  raw_log   JSONB,
  UNIQUE (header_id, tx_idx, log_idx)
);

ALTER TABLE public.checked_headers
  ADD COLUMN vat_fold_checked BOOLEAN NOT NULL DEFAULT FALSE;
