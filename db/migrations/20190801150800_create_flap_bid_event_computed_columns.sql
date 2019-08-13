-- +goose Up
-- +goose StatementBegin

-- Extend type flap_bid_event with bid field
CREATE FUNCTION api.flap_bid_event_bid(event api.flap_bid_event)
    RETURNS SETOF api.flap AS
$$
SELECT *
FROM api.get_flap(event.bid_id, event.block_height)
$$
    LANGUAGE sql
    STABLE;

-- Extend type flap_bid_event with txs field
CREATE FUNCTION api.flap_bid_event_tx(event api.flap_bid_event)
    RETURNS SETOF api.tx AS
$$
SELECT txs.hash, txs.tx_index, headers.block_number, headers.hash, tx_from, tx_to
FROM public.header_sync_transactions txs
         LEFT JOIN headers ON txs.header_id = headers.id
WHERE block_number <= event.block_height
  AND txs.tx_index <= event.tx_idx
ORDER BY block_number DESC
$$
    LANGUAGE SQL
    STABLE;

-- +goose StatementEnd
-- +goose Down
DROP FUNCTION api.flap_bid_event_tx(api.flap_bid_event);
DROP FUNCTION api.flap_bid_event_bid(api.flap_bid_event);