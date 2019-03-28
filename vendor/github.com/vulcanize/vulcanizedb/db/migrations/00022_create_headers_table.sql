-- +goose Up
CREATE TABLE public.headers (
  id                    SERIAL PRIMARY KEY,
  hash                  VARCHAR(66),
  block_number          BIGINT,
  raw                   JSONB,
  block_timestamp       NUMERIC,
  eth_node_id           INTEGER,
  eth_node_fingerprint  VARCHAR(128),
  CONSTRAINT eth_nodes_fk FOREIGN KEY (eth_node_id)
  REFERENCES eth_nodes (id)
  ON DELETE CASCADE
);

-- Index is removed when table is
CREATE INDEX headers_block_number ON public.headers (block_number);


-- +goose Down
DROP TABLE public.headers;
