--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: api; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA api;


--
-- Name: maker; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA maker;


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: bite_event; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.bite_event AS (
	ilk_identifier text,
	urn_identifier text,
	bid_id numeric,
	ink numeric,
	art numeric,
	tab numeric,
	block_height bigint,
	tx_idx integer
);


--
-- Name: COLUMN bite_event.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.bite_event.block_height IS '@omit';


--
-- Name: COLUMN bite_event.tx_idx; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.bite_event.tx_idx IS '@omit';


--
-- Name: era; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.era AS (
	epoch bigint,
	iso timestamp without time zone
);


--
-- Name: flap; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.flap AS (
	bid_id numeric,
	guy text,
	tic bigint,
	"end" bigint,
	lot numeric,
	bid numeric,
	gal text,
	dealt boolean,
	created timestamp without time zone,
	updated timestamp without time zone
);


--
-- Name: flap_bid_event; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.flap_bid_event AS (
	bid_id numeric,
	lot numeric,
	bid_amount numeric,
	act text,
	block_height bigint,
	tx_idx integer
);


--
-- Name: COLUMN flap_bid_event.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flap_bid_event.block_height IS '@omit';


--
-- Name: COLUMN flap_bid_event.tx_idx; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flap_bid_event.tx_idx IS '@omit';


--
-- Name: flip_bid_event; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.flip_bid_event AS (
	bid_id numeric,
	lot numeric,
	bid_amount numeric,
	act text,
	block_height bigint,
	tx_idx integer,
	contract_address text
);


--
-- Name: COLUMN flip_bid_event.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flip_bid_event.block_height IS '@omit';


--
-- Name: COLUMN flip_bid_event.tx_idx; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flip_bid_event.tx_idx IS '@omit';


--
-- Name: COLUMN flip_bid_event.contract_address; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flip_bid_event.contract_address IS '@omit';


--
-- Name: flip_state; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.flip_state AS (
	block_height bigint,
	bid_id numeric,
	ilk_id integer,
	urn_id integer,
	guy text,
	tic bigint,
	"end" bigint,
	lot numeric,
	bid numeric,
	gal text,
	dealt boolean,
	tab numeric,
	created timestamp without time zone,
	updated timestamp without time zone
);


--
-- Name: COLUMN flip_state.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flip_state.block_height IS '@omit';


--
-- Name: COLUMN flip_state.ilk_id; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flip_state.ilk_id IS '@omit';


--
-- Name: COLUMN flip_state.urn_id; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flip_state.urn_id IS '@omit';


--
-- Name: flop; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.flop AS (
	bid_id numeric,
	guy text,
	tic bigint,
	"end" bigint,
	lot numeric,
	bid numeric,
	dealt boolean,
	created timestamp without time zone,
	updated timestamp without time zone
);


--
-- Name: flop_bid_event; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.flop_bid_event AS (
	bid_id numeric,
	lot numeric,
	bid_amount numeric,
	act text,
	block_height bigint,
	tx_idx integer
);


--
-- Name: COLUMN flop_bid_event.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flop_bid_event.block_height IS '@omit';


--
-- Name: COLUMN flop_bid_event.tx_idx; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.flop_bid_event.tx_idx IS '@omit';


--
-- Name: frob_event; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.frob_event AS (
	ilk_identifier text,
	urn_identifier text,
	dink numeric,
	dart numeric,
	block_height bigint,
	tx_idx integer
);


--
-- Name: COLUMN frob_event.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.frob_event.block_height IS '@omit';


--
-- Name: COLUMN frob_event.tx_idx; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.frob_event.tx_idx IS '@omit';


--
-- Name: ilk_file_event; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.ilk_file_event AS (
	ilk_identifier text,
	what text,
	data text,
	block_height bigint,
	tx_idx integer
);


--
-- Name: COLUMN ilk_file_event.ilk_identifier; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.ilk_file_event.ilk_identifier IS '@omit';


--
-- Name: COLUMN ilk_file_event.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.ilk_file_event.block_height IS '@omit';


--
-- Name: COLUMN ilk_file_event.tx_idx; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.ilk_file_event.tx_idx IS '@omit';


--
-- Name: ilk_state; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.ilk_state AS (
	ilk_identifier text,
	block_height bigint,
	rate numeric,
	art numeric,
	spot numeric,
	line numeric,
	dust numeric,
	chop numeric,
	lump numeric,
	flip text,
	rho numeric,
	duty numeric,
	pip text,
	mat numeric,
	created timestamp without time zone,
	updated timestamp without time zone
);


--
-- Name: poke_event; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.poke_event AS (
	ilk_id integer,
	val numeric,
	spot numeric,
	block_height bigint,
	tx_idx integer
);


--
-- Name: COLUMN poke_event.ilk_id; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.poke_event.ilk_id IS '@omit';


--
-- Name: COLUMN poke_event.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.poke_event.block_height IS '@omit';


--
-- Name: COLUMN poke_event.tx_idx; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.poke_event.tx_idx IS '@omit';


--
-- Name: queued_sin; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.queued_sin AS (
	era numeric,
	tab numeric,
	flogged boolean,
	created timestamp without time zone,
	updated timestamp without time zone
);


--
-- Name: relevant_block; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.relevant_block AS (
	block_height bigint,
	block_hash text,
	ilk_id integer
);


--
-- Name: relevant_flap_block; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.relevant_flap_block AS (
	block_height bigint,
	block_hash text,
	bid_id numeric
);


--
-- Name: relevant_flip_block; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.relevant_flip_block AS (
	block_height bigint,
	block_hash text,
	bid_id numeric
);


--
-- Name: relevant_flop_block; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.relevant_flop_block AS (
	block_height bigint,
	block_hash text,
	bid_id numeric
);


--
-- Name: sin_act; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.sin_act AS ENUM (
    'flog',
    'fess'
);


--
-- Name: sin_queue_event; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.sin_queue_event AS (
	era numeric,
	act api.sin_act,
	block_height bigint,
	tx_idx integer
);


--
-- Name: COLUMN sin_queue_event.block_height; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.sin_queue_event.block_height IS '@omit';


--
-- Name: COLUMN sin_queue_event.tx_idx; Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON COLUMN api.sin_queue_event.tx_idx IS '@omit';


--
-- Name: tx; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.tx AS (
	transaction_hash text,
	transaction_index integer,
	block_height bigint,
	block_hash text,
	tx_from text,
	tx_to text
);


--
-- Name: urn_state; Type: TYPE; Schema: api; Owner: -
--

CREATE TYPE api.urn_state AS (
	urn_identifier text,
	ilk_identifier text,
	block_height bigint,
	ink numeric,
	art numeric,
	ratio numeric,
	safe boolean,
	created timestamp without time zone,
	updated timestamp without time zone
);


--
-- Name: all_bites(text); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_bites(ilk_identifier text) RETURNS SETOF api.bite_event
    LANGUAGE sql STABLE STRICT
    AS $$
WITH ilk AS (SELECT id FROM maker.ilks WHERE ilks.identifier = ilk_identifier)
SELECT ilk_identifier, identifier AS urn_identifier, bite_identifier AS bid_id, ink, art, tab, block_number, tx_idx
FROM maker.bite
         LEFT JOIN maker.urns ON bite.urn_id = urns.id
         LEFT JOIN headers ON bite.header_id = headers.id
WHERE urns.ilk_id = (SELECT id FROM ilk)
ORDER BY urn_identifier, block_number DESC
$$;


--
-- Name: all_flap_bid_events(); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_flap_bid_events() RETURNS SETOF api.flap_bid_event
    LANGUAGE sql STABLE
    AS $$
WITH address AS (
    SELECT contract_address
    FROM maker.flap_kick
    LIMIT 1
),
     deals AS (
         SELECT deal.bid_id,
                flap_bid_lot.lot,
                flap_bid_bid.bid     AS bid_amount,
                'deal'               AS act,
                headers.block_number AS block_height,
                tx_idx
         FROM maker.deal
                  LEFT JOIN headers ON deal.header_id = headers.id
                  LEFT JOIN maker.flap_bid_bid
                            ON deal.bid_id = flap_bid_bid.bid_id
                                AND flap_bid_bid.block_number = headers.block_number
                  LEFT JOIN maker.flap_bid_lot
                            ON deal.bid_id = flap_bid_lot.bid_id
                                AND flap_bid_lot.block_number = headers.block_number
         WHERE deal.contract_address = (SELECT * FROM address)
         ORDER BY block_height DESC
     ),
     yanks AS (
         SELECT yank.bid_id,
                flap_bid_lot.lot,
                flap_bid_bid.bid     AS bid_amount,
                'yank'               AS act,
                headers.block_number AS block_height,
                tx_idx
         FROM maker.yank
                  LEFT JOIN headers ON yank.header_id = headers.id
                  LEFT JOIN maker.flap_bid_bid
                            ON yank.bid_id = flap_bid_bid.bid_id
                                AND flap_bid_bid.block_number = headers.block_number
                  LEFT JOIN maker.flap_bid_lot
                            ON yank.bid_id = flap_bid_lot.bid_id
                                AND flap_bid_lot.block_number = headers.block_number
         WHERE yank.contract_address = (SELECT * FROM address)
         ORDER BY block_height DESC
     )

SELECT flap_kick.bid_id, lot, bid AS bid_amount, 'kick' AS act, block_number AS block_height, tx_idx
FROM maker.flap_kick
         LEFT JOIN headers ON flap_kick.header_id = headers.id
UNION
SELECT bid_id, lot, bid AS bid_amount, 'tend' AS act, block_number AS block_height, tx_idx
FROM maker.tend
         LEFT JOIN headers ON tend.header_id = headers.id
WHERE tend.contract_address = (SELECT * FROM address)
UNION
SELECT *
FROM deals
UNION
SELECT *
FROM yanks

$$;


--
-- Name: all_flaps(); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_flaps() RETURNS SETOF api.flap
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN QUERY (
        WITH bid_ids AS (
            SELECT DISTINCT flap_bid_guy.bid_id
            FROM maker.flap_bid_guy
            UNION
            SELECT DISTINCT flap_bid_tic.bid_id
            FROM maker.flap_bid_tic
            UNION
            SELECT DISTINCT flap_bid_bid.bid_id
            FROM maker.flap_bid_bid
            UNION
            SELECT DISTINCT flap_bid_lot.bid_id
            FROM maker.flap_bid_lot
            UNION
            SELECT DISTINCT flap_bid_end.bid_id
            FROM maker.flap_bid_end
            UNION
            SELECT DISTINCT flap_bid_gal.bid_id
            FROM maker.flap_bid_gal
        )
        SELECT f.*
        FROM bid_ids,
             LATERAL api.get_flap(bid_ids.bid_id) f
    );
END
$$;


--
-- Name: all_flip_bid_events(); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_flip_bid_events() RETURNS SETOF api.flip_bid_event
    LANGUAGE sql STABLE
    AS $$
WITH addresses AS (
    SELECT distinct contract_address
    FROM maker.flip_kick
),
     deals AS (
         SELECT deal.bid_id,
                flip_bid_lot.lot,
                flip_bid_bid.bid     AS bid_amount,
                'deal'               AS act,
                headers.block_number AS block_height,
                tx_idx,
                deal.contract_address
         FROM maker.deal
                  LEFT JOIN headers ON deal.header_id = headers.id
                  LEFT JOIN maker.flip_bid_bid
                            ON deal.bid_id = flip_bid_bid.bid_id
                                AND flip_bid_bid.block_number = headers.block_number
                  LEFT JOIN maker.flip_bid_lot
                            ON deal.bid_id = flip_bid_lot.bid_id
                                AND flip_bid_lot.block_number = headers.block_number
         WHERE deal.contract_address IN (SELECT * FROM addresses)
         ORDER BY block_height DESC
     ),
     yanks AS (
         SELECT yank.bid_id,
                flip_bid_lot.lot,
                flip_bid_bid.bid     AS bid_amount,
                'yank'               AS act,
                headers.block_number AS block_height,
                tx_idx,
                yank.contract_address
         FROM maker.yank
                  LEFT JOIN headers ON yank.header_id = headers.id
                  LEFT JOIN maker.flip_bid_bid
                            ON yank.bid_id = flip_bid_bid.bid_id
                                AND flip_bid_bid.block_number = headers.block_number
                  LEFT JOIN maker.flip_bid_lot
                            ON yank.bid_id = flip_bid_lot.bid_id
                                AND flip_bid_lot.block_number = headers.block_number
         WHERE yank.contract_address IN (SELECT * FROM addresses)
         ORDER BY block_height DESC
     ),
     ticks AS (
         SELECT flip_tick.bid_id,
                flip_bid_lot.lot,
                flip_bid_bid.bid     AS bid_amount,
                'tick'               AS act,
                headers.block_number AS block_height,
                tx_idx,
                flip_tick.contract_address
         FROM maker.flip_tick
                  LEFT JOIN headers on flip_tick.header_id = headers.id
                  LEFT JOIN maker.flip_bid_bid
                            ON flip_tick.bid_id = flip_bid_bid.bid_id
                                AND flip_bid_bid.block_number = headers.block_number
                  LEFT JOIN maker.flip_bid_lot
                            ON flip_tick.bid_id = flip_bid_lot.bid_id
                                AND flip_bid_lot.block_number = headers.block_number
         ORDER BY block_height DESC
     )
SELECT flip_kick.bid_id, lot, bid AS bid_amount, 'kick' AS act, block_number AS block_height, tx_idx, contract_address
FROM maker.flip_kick
         LEFT JOIN headers ON flip_kick.header_id = headers.id
UNION
SELECT bid_id, lot, bid AS bid_amount, 'tend' AS act, block_number AS block_height, tx_idx, contract_address
FROM maker.tend
         LEFT JOIN headers on tend.header_id = headers.id
WHERE tend.contract_address IN (SELECT * FROM addresses)
UNION
SELECT bid_id, lot, bid AS bid_amount, 'dent' AS act, block_number AS block_height, tx_idx, dent.contract_address
FROM maker.dent
         LEFT JOIN headers on dent.header_id = headers.id
WHERE dent.contract_address IN (SELECT * FROM addresses)
UNION
SELECT *
from deals
UNION
SELECT *
from yanks
UNION
SELECT * FROM ticks
$$;


--
-- Name: all_flips(text); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_flips(ilk text) RETURNS SETOF api.flip_state
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN QUERY (
        WITH ilk_ids AS (SELECT id
                        FROM maker.ilks
                        WHERE identifier = all_flips.ilk),
             address AS (
                 SELECT DISTINCT contract_address
                 FROM maker.flip_ilk
                 WHERE flip_ilk.ilk_id = (SELECT id FROM ilk_ids)
                 LIMIT 1),
             bid_ids AS (
                 SELECT DISTINCT flip_kicks.kicks
                 FROM maker.flip_kicks
                 WHERE contract_address = (SELECT * FROM address)
                 ORDER BY flip_kicks.kicks)
        SELECT f.*
        FROM bid_ids,
             LATERAL api.get_flip(bid_ids.kicks, all_flips.ilk) f
    );
END
$$;


--
-- Name: all_flop_bid_events(); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_flop_bid_events() RETURNS SETOF api.flop_bid_event
    LANGUAGE sql STABLE
    AS $$
WITH address AS (
    SELECT contract_address
    FROM maker.flop_kick
    LIMIT 1
),
     deals AS (
         SELECT deal.bid_id,
                flop_bid_lot.lot,
                flop_bid_bid.bid     AS bid_amount,
                'deal'               AS act,
                headers.block_number AS block_height,
                tx_idx
         FROM maker.deal
                  LEFT JOIN headers ON deal.header_id = headers.id
                  LEFT JOIN maker.flop_bid_bid
                            ON deal.bid_id = flop_bid_bid.bid_id
                                AND flop_bid_bid.block_number = headers.block_number
                  LEFT JOIN maker.flop_bid_lot
                            ON deal.bid_id = flop_bid_lot.bid_id
                                AND flop_bid_lot.block_number = headers.block_number
         WHERE deal.contract_address = (SELECT * FROM address)
         ORDER BY block_height DESC
     ),
     yanks AS (
         SELECT yank.bid_id,
                flop_bid_lot.lot,
                flop_bid_bid.bid     AS bid_amount,
                'yank'               AS act,
                headers.block_number AS block_height,
                tx_idx
         FROM maker.yank
                  LEFT JOIN headers ON yank.header_id = headers.id
                  LEFT JOIN maker.flop_bid_bid
                            ON yank.bid_id = flop_bid_bid.bid_id
                                AND flop_bid_bid.block_number = headers.block_number
                  LEFT JOIN maker.flop_bid_lot
                            ON yank.bid_id = flop_bid_lot.bid_id
                                AND flop_bid_lot.block_number = headers.block_number
         WHERE yank.contract_address = (SELECT * FROM address)
         ORDER BY block_height DESC
     )

SELECT flop_kick.bid_id, lot, bid AS bid_amount, 'kick' AS act, block_number AS block_height, tx_idx
FROM maker.flop_kick
         LEFT JOIN headers ON flop_kick.header_id = headers.id
UNION
SELECT bid_id, lot, bid AS bid_amount, 'dent' AS act, block_number AS block_height, tx_idx
FROM maker.dent
         LEFT JOIN headers ON dent.header_id = headers.id
WHERE dent.contract_address = (SELECT * FROM address)
UNION
SELECT *
FROM deals
UNION
SELECT *
FROM yanks

$$;


--
-- Name: all_flops(); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_flops() RETURNS SETOF api.flop
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN QUERY (
        WITH bid_ids AS (
            SELECT DISTINCT flop_bid_guy.bid_id
            FROM maker.flop_bid_guy
            UNION
            SELECT DISTINCT flop_bid_tic.bid_id
            FROM maker.flop_bid_tic
            UNION
            SELECT DISTINCT flop_bid_bid.bid_id
            FROM maker.flop_bid_bid
            UNION
            SELECT DISTINCT flop_bid_lot.bid_id
            FROM maker.flop_bid_lot
            UNION
            SELECT DISTINCT flop_bid_end.bid_id
            FROM maker.flop_bid_end
        )
        SELECT f.*
        FROM bid_ids,
             LATERAL api.get_flop(bid_ids.bid_id) f
    );
END
$$;


--
-- Name: all_frobs(text); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_frobs(ilk_identifier text) RETURNS SETOF api.frob_event
    LANGUAGE sql STABLE STRICT
    AS $$
WITH ilk AS (SELECT id FROM maker.ilks WHERE ilks.identifier = ilk_identifier)

SELECT ilk_identifier, identifier AS urn_identifier, dink, dart, block_number, tx_idx
FROM maker.vat_frob
         LEFT JOIN maker.urns ON vat_frob.urn_id = urns.id
         LEFT JOIN headers ON vat_frob.header_id = headers.id
WHERE urns.ilk_id = (SELECT id FROM ilk)
ORDER BY identifier, block_number DESC
$$;


--
-- Name: all_ilk_file_events(text); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_ilk_file_events(ilk_identifier text) RETURNS SETOF api.ilk_file_event
    LANGUAGE sql STABLE STRICT
    AS $$
WITH ilk AS (SELECT id FROM maker.ilks WHERE ilks.identifier = ilk_identifier)

SELECT ilk_identifier, what, data :: text, block_number, tx_idx
FROM maker.cat_file_chop_lump
         LEFT JOIN headers ON cat_file_chop_lump.header_id = headers.id
WHERE cat_file_chop_lump.ilk_id = (SELECT id FROM ilk)
UNION
SELECT ilk_identifier, what, flip AS data, block_number, tx_idx
FROM maker.cat_file_flip
         LEFT JOIN headers ON cat_file_flip.header_id = headers.id
WHERE cat_file_flip.ilk_id = (SELECT id FROM ilk)
UNION
SELECT ilk_identifier, what, data :: text, block_number, tx_idx
FROM maker.jug_file_ilk
         LEFT JOIN headers ON jug_file_ilk.header_id = headers.id
WHERE jug_file_ilk.ilk_id = (SELECT id FROM ilk)
UNION
SELECT ilk_identifier, what, data :: text, block_number, tx_idx
FROM maker.spot_file_mat
         LEFT JOIN headers ON spot_file_mat.header_id = headers.id
WHERE spot_file_mat.ilk_id = (SELECT id FROM ilk)
UNION
SELECT ilk_identifier, 'pip' AS what, pip AS data, block_number, tx_idx
FROM maker.spot_file_pip
         LEFT JOIN headers ON spot_file_pip.header_id = headers.id
WHERE spot_file_pip.ilk_id = (SELECT id FROM ilk)
UNION
SELECT ilk_identifier, what, data :: text, block_number, tx_idx
FROM maker.vat_file_ilk
         LEFT JOIN headers ON vat_file_ilk.header_id = headers.id
WHERE vat_file_ilk.ilk_id = (SELECT id FROM ilk)
ORDER BY block_number DESC
$$;


--
-- Name: max_block(); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.max_block() RETURNS bigint
    LANGUAGE sql STABLE
    AS $$
SELECT max(block_number)
FROM public.headers
$$;


--
-- Name: FUNCTION max_block(); Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON FUNCTION api.max_block() IS '@omit';


--
-- Name: all_ilk_states(text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_ilk_states(ilk_identifier text, block_height bigint DEFAULT api.max_block()) RETURNS SETOF api.ilk_state
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
    r api.relevant_block;
BEGIN
    FOR r IN SELECT get_ilk_blocks_before.block_height
             FROM api.get_ilk_blocks_before(ilk_identifier, all_ilk_states.block_height)
        LOOP
            RETURN QUERY
                SELECT * FROM api.get_ilk(ilk_identifier, r.block_height);
        END LOOP;
END;
$$;


--
-- Name: all_ilks(bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_ilks(block_height bigint DEFAULT api.max_block()) RETURNS SETOF api.ilk_state
    LANGUAGE sql STABLE STRICT
    AS $$
WITH rates AS (SELECT DISTINCT ON (ilk_id) rate, ilk_id, block_hash
               FROM maker.vat_ilk_rate
               WHERE block_number <= all_ilks.block_height
               ORDER BY ilk_id, block_number DESC),
     arts AS (SELECT DISTINCT ON (ilk_id) art, ilk_id, block_hash
              FROM maker.vat_ilk_art
              WHERE block_number <= all_ilks.block_height
              ORDER BY ilk_id, block_number DESC),
     spots AS (SELECT DISTINCT ON (ilk_id) spot, ilk_id, block_hash
               FROM maker.vat_ilk_spot
               WHERE block_number <= all_ilks.block_height
               ORDER BY ilk_id, block_number DESC),
     lines AS (SELECT DISTINCT ON (ilk_id) line, ilk_id, block_hash
               FROM maker.vat_ilk_line
               WHERE block_number <= all_ilks.block_height
               ORDER BY ilk_id, block_number DESC),
     dusts AS (SELECT DISTINCT ON (ilk_id) dust, ilk_id, block_hash
               FROM maker.vat_ilk_dust
               WHERE block_number <= all_ilks.block_height
               ORDER BY ilk_id, block_number DESC),
     chops AS (SELECT DISTINCT ON (ilk_id) chop, ilk_id, block_hash
               FROM maker.cat_ilk_chop
               WHERE block_number <= all_ilks.block_height
               ORDER BY ilk_id, block_number DESC),
     lumps AS (SELECT DISTINCT ON (ilk_id) lump, ilk_id, block_hash
               FROM maker.cat_ilk_lump
               WHERE block_number <= all_ilks.block_height
               ORDER BY ilk_id, block_number DESC),
     flips AS (SELECT DISTINCT ON (ilk_id) flip, ilk_id, block_hash
               FROM maker.cat_ilk_flip
               WHERE block_number <= all_ilks.block_height
               ORDER BY ilk_id, block_number DESC),
     rhos AS (SELECT DISTINCT ON (ilk_id) rho, ilk_id, block_hash
              FROM maker.jug_ilk_rho
              WHERE block_number <= all_ilks.block_height
              ORDER BY ilk_id, block_number DESC),
     duties AS (SELECT DISTINCT ON (ilk_id) duty, ilk_id, block_hash
                FROM maker.jug_ilk_duty
                WHERE block_number <= all_ilks.block_height
                ORDER BY ilk_id, block_number DESC),
     pips AS (SELECT DISTINCT ON (ilk_id) pip, ilk_id, block_hash
              FROM maker.spot_ilk_pip
              WHERE block_number <= all_ilks.block_height
              ORDER BY ilk_id, block_number DESC),
     mats AS (SELECT DISTINCT ON (ilk_id) mat, ilk_id, block_hash
              FROM maker.spot_ilk_mat
              WHERE block_number <= all_ilks.block_height
              ORDER BY ilk_id, block_number DESC)
SELECT ilks.identifier,
       all_ilks.block_height,
       rates.rate,
       arts.art,
       spots.spot,
       lines.line,
       dusts.dust,
       chops.chop,
       lumps.lump,
       flips.flip,
       rhos.rho,
       duties.duty,
       pips.pip,
       mats.mat,
       (SELECT api.epoch_to_datetime(h.block_timestamp) AS created
        FROM api.get_ilk_blocks_before(ilks.identifier, all_ilks.block_height) b
                 JOIN headers h on h.block_number = b.block_height
        ORDER BY h.block_number ASC
        LIMIT 1),
       (SELECT api.epoch_to_datetime(h.block_timestamp) AS updated
        FROM api.get_ilk_blocks_before(ilks.identifier, all_ilks.block_height) b
                 JOIN headers h on h.block_number = b.block_height
        ORDER BY h.block_number DESC
        LIMIT 1)
FROM maker.ilks AS ilks
         LEFT JOIN rates on rates.ilk_id = ilks.id
         LEFT JOIN arts on arts.ilk_id = ilks.id
         LEFT JOIN spots on spots.ilk_id = ilks.id
         LEFT JOIN lines on lines.ilk_id = ilks.id
         LEFT JOIN dusts on dusts.ilk_id = ilks.id
         LEFT JOIN chops on chops.ilk_id = ilks.id
         LEFT JOIN lumps on lumps.ilk_id = ilks.id
         LEFT JOIN flips on flips.ilk_id = ilks.id
         LEFT JOIN rhos on rhos.ilk_id = ilks.id
         LEFT JOIN duties on duties.ilk_id = ilks.id
         LEFT JOIN pips on pips.ilk_id = ilks.id
         LEFT JOIN mats on mats.ilk_id = ilks.id
WHERE (
              rates.rate is not null OR
              arts.art is not null OR
              spots.spot is not null OR
              lines.line is not null OR
              dusts.dust is not null OR
              chops.chop is not null OR
              lumps.lump is not null OR
              flips.flip is not null OR
              rhos.rho is not null OR
              duties.duty is not null OR
              pips.pip is not null OR
              mats.mat is not null
          )
$$;


--
-- Name: max_timestamp(); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.max_timestamp() RETURNS numeric
    LANGUAGE sql STABLE
    AS $$
SELECT max(block_timestamp)
FROM public.headers
$$;


--
-- Name: all_poke_events(numeric, numeric); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_poke_events(begintime numeric DEFAULT 0, endtime numeric DEFAULT api.max_timestamp()) RETURNS SETOF api.poke_event
    LANGUAGE sql STABLE
    AS $$
SELECT ilk_id, "value" AS val, spot, block_number AS block_height, tx_idx
FROM maker.spot_poke
         LEFT JOIN public.headers ON spot_poke.header_id = headers.id
WHERE block_timestamp BETWEEN beginTime AND endTime
$$;


--
-- Name: all_queued_sin(); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_queued_sin() RETURNS SETOF api.queued_sin
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    _era NUMERIC;
BEGIN
    FOR _era IN
        SELECT DISTINCT era FROM maker.vow_sin_mapping
        LOOP
            RETURN QUERY
                SELECT * FROM api.get_queued_sin(_era);
        END LOOP;
END;
$$;


--
-- Name: all_sin_queue_events(numeric); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_sin_queue_events(era numeric) RETURNS SETOF api.sin_queue_event
    LANGUAGE sql STABLE
    AS $$
SELECT block_timestamp AS era, 'fess' :: api.sin_act AS act, block_number AS block_height, tx_idx
FROM maker.vow_fess
         LEFT JOIN headers ON vow_fess.header_id = headers.id
WHERE block_timestamp = all_sin_queue_events.era
UNION
SELECT era, 'flog' :: api.sin_act AS act, block_number AS block_height, tx_idx
FROM maker.vow_flog
         LEFT JOIN headers ON vow_flog.header_id = headers.id
where vow_flog.era = all_sin_queue_events.era
ORDER BY block_height DESC
$$;


--
-- Name: all_urn_states(text, text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_urn_states(ilk_identifier text, urn_identifier text, block_height bigint DEFAULT api.max_block()) RETURNS SETOF api.urn_state
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
    blocks  BIGINT[];
    i       BIGINT;
    _ilk_id NUMERIC;
    _urn_id NUMERIC;
BEGIN
    SELECT id
    FROM maker.ilks
    WHERE ilks.identifier = ilk_identifier INTO _ilk_id;
    SELECT id
    FROM maker.urns
    WHERE urns.identifier = urn_identifier
      AND urns.ilk_id = _ilk_id INTO _urn_id;

    blocks := ARRAY(
            SELECT block_number
            FROM (SELECT block_number
                  FROM maker.vat_urn_ink
                  WHERE vat_urn_ink.urn_id = _urn_id
                    AND block_number <= all_urn_states.block_height
                  UNION
                  SELECT block_number
                  FROM maker.vat_urn_art
                  WHERE vat_urn_art.urn_id = _urn_id
                    AND block_number <= all_urn_states.block_height) inks_and_arts
            ORDER BY block_number DESC
        );

    FOREACH i IN ARRAY blocks
        LOOP
            RETURN QUERY
                SELECT * FROM api.get_urn(ilk_identifier, urn_identifier, i);
        END LOOP;
END;
$$;


--
-- Name: all_urns(bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.all_urns(block_height bigint DEFAULT api.max_block()) RETURNS SETOF api.urn_state
    LANGUAGE sql STABLE STRICT
    AS $$
WITH urns AS (SELECT urns.id AS urn_id, ilks.id AS ilk_id, ilks.ilk, urns.identifier
              FROM maker.urns urns
                       LEFT JOIN maker.ilks ilks ON urns.ilk_id = ilks.id),
     inks AS ( -- Latest ink for each urn
         SELECT DISTINCT ON (urn_id) urn_id, ink, block_number
         FROM maker.vat_urn_ink
         WHERE block_number <= all_urns.block_height
         ORDER BY urn_id, block_number DESC),
     arts AS ( -- Latest art for each urn
         SELECT DISTINCT ON (urn_id) urn_id, art, block_number
         FROM maker.vat_urn_art
         WHERE block_number <= all_urns.block_height
         ORDER BY urn_id, block_number DESC),
     rates AS ( -- Latest rate for each ilk
         SELECT DISTINCT ON (ilk_id) ilk_id, rate, block_number
         FROM maker.vat_ilk_rate
         WHERE block_number <= all_urns.block_height
         ORDER BY ilk_id, block_number DESC),
     spots AS ( -- Get latest price update for ilk. Problematic from update frequency, slow query?
         SELECT DISTINCT ON (ilk_id) ilk_id, spot, block_number
         FROM maker.vat_ilk_spot
         WHERE block_number <= all_urns.block_height
         ORDER BY ilk_id, block_number DESC),
     ratio_data AS (SELECT urns.ilk, urns.identifier, inks.ink, spots.spot, arts.art, rates.rate
                    FROM inks
                             JOIN urns ON inks.urn_id = urns.urn_id
                             JOIN arts ON arts.urn_id = inks.urn_id
                             JOIN spots ON spots.ilk_id = urns.ilk_id
                             JOIN rates ON rates.ilk_id = spots.ilk_id),
     ratios AS (SELECT ilk, identifier as urn_identifier, ((1.0 * ink * spot) / NULLIF(art * rate, 0)) AS ratio
                FROM ratio_data),
     safe AS (SELECT ilk, urn_identifier, (ratio >= 1) AS safe FROM ratios),
     created AS (SELECT urn_id, api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM (SELECT DISTINCT ON (urn_id) urn_id, block_hash
                       FROM maker.vat_urn_ink
                       ORDER BY urn_id, block_number ASC) earliest_blocks
                          LEFT JOIN public.headers ON hash = block_hash),
     updated AS (SELECT DISTINCT ON (urn_id) urn_id, api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM ((SELECT DISTINCT ON (urn_id) urn_id, block_hash
                        FROM maker.vat_urn_ink
                        WHERE block_number <= block_height
                        ORDER BY urn_id, block_number DESC)
                       UNION
                       (SELECT DISTINCT ON (urn_id) urn_id, block_hash
                        FROM maker.vat_urn_art
                        WHERE block_number <= block_height
                        ORDER BY urn_id, block_number DESC)) last_blocks
                          LEFT JOIN public.headers ON headers.hash = last_blocks.block_hash
                 ORDER BY urn_id, headers.block_timestamp DESC)

SELECT urns.identifier,
       ilks.identifier,
       all_urns.block_height,
       inks.ink,
       arts.art,
       ratios.ratio,
       COALESCE(safe.safe, arts.art = 0),
       created.datetime,
       updated.datetime
FROM inks
         LEFT JOIN arts ON arts.urn_id = inks.urn_id
         LEFT JOIN urns ON arts.urn_id = urns.urn_id
         LEFT JOIN ratios ON ratios.urn_identifier = urns.identifier
         LEFT JOIN safe ON safe.urn_identifier = ratios.urn_identifier
         LEFT JOIN created ON created.urn_id = urns.urn_id
         LEFT JOIN updated ON updated.urn_id = urns.urn_id
         LEFT JOIN maker.ilks ON ilks.id = urns.ilk_id
$$;


--
-- Name: bite_event_bid(api.bite_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.bite_event_bid(event api.bite_event) RETURNS SETOF api.flip_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_flip(event.bid_id, event.ilk_identifier, event.block_height)
$$;


--
-- Name: bite_event_ilk(api.bite_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.bite_event_ilk(event api.bite_event) RETURNS api.ilk_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_ilk(event.ilk_identifier, event.block_height)
$$;


--
-- Name: bite_event_tx(api.bite_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.bite_event_tx(event api.bite_event) RETURNS api.tx
    LANGUAGE sql STABLE
    AS $$
SELECT txs.hash, txs.tx_index, headers.block_number, headers.hash, tx_from, tx_to
FROM public.header_sync_transactions txs
         LEFT JOIN headers ON txs.header_id = headers.id
WHERE block_number <= event.block_height
  AND txs.tx_index = event.tx_idx
ORDER BY block_number DESC
$$;


--
-- Name: bite_event_urn(api.bite_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.bite_event_urn(event api.bite_event) RETURNS SETOF api.urn_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_urn(event.ilk_identifier, event.urn_identifier, event.block_height)
$$;


--
-- Name: epoch_to_datetime(numeric); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.epoch_to_datetime(epoch numeric) RETURNS timestamp without time zone
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT TIMESTAMP 'epoch' + epoch * INTERVAL '1 second' AS datetime
$$;


--
-- Name: FUNCTION epoch_to_datetime(epoch numeric); Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON FUNCTION api.epoch_to_datetime(epoch numeric) IS '@omit';


--
-- Name: flap_bid_event_bid(api.flap_bid_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.flap_bid_event_bid(event api.flap_bid_event) RETURNS SETOF api.flap
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_flap(event.bid_id, event.block_height)
$$;


--
-- Name: flap_bid_event_tx(api.flap_bid_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.flap_bid_event_tx(event api.flap_bid_event) RETURNS SETOF api.tx
    LANGUAGE sql STABLE
    AS $$
    SELECT * FROM get_tx_data(event.block_height, event.tx_idx)
$$;


--
-- Name: flap_bid_events(api.flap); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.flap_bid_events(flap api.flap) RETURNS SETOF api.flap_bid_event
    LANGUAGE sql STABLE
    AS $$
    SELECT *
    FROM api.all_flap_bid_events()
    WHERE bid_id = flap.bid_id
    $$;


--
-- Name: flip_bid_event_bid(api.flip_bid_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.flip_bid_event_bid(event api.flip_bid_event) RETURNS SETOF api.flip_state
    LANGUAGE sql STABLE
    AS $$
WITH ilks AS (
    SELECT ilks.identifier
    FROM maker.flip_ilk
       LEFT JOIN maker.ilks ON ilks.id = flip_ilk.ilk_id
    WHERE contract_address = event.contract_address
    LIMIT 1
)
SELECT *
FROM api.get_flip(event.bid_id, (SELECT identifier FROM ilks))
$$;


--
-- Name: flip_bid_event_tx(api.flip_bid_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.flip_bid_event_tx(event api.flip_bid_event) RETURNS SETOF api.tx
    LANGUAGE sql STABLE
    AS $$
    SELECT * FROM get_tx_data(event.block_height, event.tx_idx)
$$;


--
-- Name: flip_state_bid_events(api.flip_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.flip_state_bid_events(flip api.flip_state) RETURNS SETOF api.flip_bid_event
    LANGUAGE sql STABLE
    AS $$
WITH addresses AS ( -- get the contract address from flip_ilk table using the ilk_id from flip
    SELECT contract_address
    FROM maker.flip_ilk
             LEFT JOIN maker.ilks ON ilks.id = flip_ilk.ilk_id
    WHERE ilks.id = flip.ilk_id
    ORDER BY block_number DESC
    LIMIT 1
)
SELECT bid_id, lot, bid_amount, act, block_height, tx_idx, events.contract_address
FROM api.all_flip_bid_events() AS events
         LEFT JOIN addresses ON events.contract_address = addresses.contract_address
WHERE bid_id = flip.bid_id
$$;


--
-- Name: flip_state_ilk(api.flip_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.flip_state_ilk(flip api.flip_state) RETURNS api.ilk_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_ilk((SELECT identifier FROM maker.ilks WHERE ilks.id = flip.ilk_id), flip.block_height)
$$;


--
-- Name: flip_state_urn(api.flip_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.flip_state_urn(flip api.flip_state) RETURNS SETOF api.urn_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_urn((SELECT identifier FROM maker.ilks WHERE ilks.id = flip.ilk_id),
                 (SELECT identifier FROM maker.urns WHERE urns.id = flip.urn_id), flip.block_height)
$$;


--
-- Name: frob_event_ilk(api.frob_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.frob_event_ilk(event api.frob_event) RETURNS api.ilk_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_ilk(event.ilk_identifier, event.block_height)
$$;


--
-- Name: frob_event_tx(api.frob_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.frob_event_tx(event api.frob_event) RETURNS api.tx
    LANGUAGE sql STABLE
    AS $$
SELECT txs.hash, txs.tx_index, headers.block_number, headers.hash, tx_from, tx_to
FROM public.header_sync_transactions txs
         LEFT JOIN headers ON txs.header_id = headers.id
WHERE block_number <= event.block_height
  AND txs.tx_index = event.tx_idx
ORDER BY block_number DESC
LIMIT 1 -- Should always be true anyway?
$$;


--
-- Name: frob_event_urn(api.frob_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.frob_event_urn(event api.frob_event) RETURNS SETOF api.urn_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_urn(event.ilk_identifier, event.urn_identifier, event.block_height)
$$;


--
-- Name: get_flap(numeric, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_flap(bid_id numeric, block_height bigint DEFAULT api.max_block()) RETURNS api.flap
    LANGUAGE sql STABLE
    AS $$
WITH address AS (
    SELECT contract_address
    FROM maker.flap_bid_bid
    WHERE flap_bid_bid.bid_id = get_flap.bid_id
      AND block_number <= block_height
    LIMIT 1
),
     guy AS (
         SELECT guy, bid_id
         FROM maker.flap_bid_guy
         WHERE flap_bid_guy.bid_id = get_flap.bid_id
           AND block_number <= block_height
         ORDER BY flap_bid_guy.bid_id, block_number DESC
         LIMIT 1
     ),
     tic AS (
         SELECT tic, bid_id
         FROM maker.flap_bid_tic
         WHERE flap_bid_tic.bid_id = get_flap.bid_id
           AND block_number <= block_height
         ORDER BY flap_bid_tic.bid_id, block_number DESC
         LIMIT 1
     ),
     "end" AS (
         SELECT "end", bid_id
         FROM maker.flap_bid_end
         WHERE flap_bid_end.bid_id = get_flap.bid_id
           AND block_number <= block_height
         ORDER BY flap_bid_end.bid_id, block_number DESC
         LIMIT 1
     ),
     lot AS (
         SELECT lot, bid_id
         FROM maker.flap_bid_lot
         WHERE flap_bid_lot.bid_id = get_flap.bid_id
           AND block_number <= block_height
         ORDER BY flap_bid_lot.bid_id, block_number DESC
         LIMIT 1
     ),
     bid AS (
         SELECT bid, bid_id
         FROM maker.flap_bid_bid
         WHERE flap_bid_bid.bid_id = get_flap.bid_id
           AND block_number <= block_height
         ORDER BY flap_bid_bid.bid_id, block_number DESC
         LIMIT 1
     ),
     gal AS (
         SELECT gal, bid_id
         FROM maker.flap_bid_gal
         WHERE flap_bid_gal.bid_id = get_flap.bid_id
           AND block_number <= block_height
         ORDER BY flap_bid_gal.bid_id, block_number DESC
         LIMIT 1
     ),
     deal AS (
         SELECT deal, bid_id
         FROM maker.deal
                  LEFT JOIN public.headers ON deal.header_id = headers.id
         WHERE deal.bid_id = get_flap.bid_id
           AND deal.contract_address IN (SELECT * FROM address)
           AND headers.block_number <= block_height
         ORDER BY bid_id, block_number DESC
         LIMIT 1
     ),
     relevant_blocks AS (
         SELECT *
         FROM api.get_flap_blocks_before(bid_id, (SELECT * FROM address), get_flap.block_height)
     ),
     created AS (
         SELECT DISTINCT ON (relevant_blocks.bid_id, relevant_blocks.block_height) relevant_blocks.block_height,
                                                                                   relevant_blocks.block_hash,
                                                                                   relevant_blocks.bid_id,
                                                                                   api.epoch_to_datetime(headers.block_timestamp) AS datetime
         FROM relevant_blocks
                  LEFT JOIN public.headers AS headers on headers.hash = relevant_blocks.block_hash
         ORDER BY relevant_blocks.block_height ASC
         LIMIT 1
     ),
     updated AS (
         SELECT DISTINCT ON (relevant_blocks.bid_id, relevant_blocks.block_height) relevant_blocks.block_height,
                                                                                   relevant_blocks.block_hash,
                                                                                   relevant_blocks.bid_id,
                                                                                   api.epoch_to_datetime(headers.block_timestamp) AS datetime
         FROM relevant_blocks
                  LEFT JOIN public.headers AS headers on headers.hash = relevant_blocks.block_hash
         ORDER BY relevant_blocks.block_height DESC
         LIMIT 1
     )

SELECT get_flap.bid_id,
       guy.guy,
       tic.tic,
       "end"."end",
       lot.lot,
       bid.bid,
       gal.gal,
       CASE (SELECT COUNT(*) FROM deal)
           WHEN 0 THEN FALSE
           ELSE TRUE
           END AS dealt,
       created.datetime,
       updated.datetime
FROM guy
         LEFT JOIN tic ON tic.bid_id = guy.bid_id
         JOIN "end" ON "end".bid_id = guy.bid_id
         JOIN lot ON lot.bid_id = guy.bid_id
         JOIN bid ON bid.bid_id = guy.bid_id
         JOIN gal ON gal.bid_id = guy.bid_id
         JOIN created ON created.bid_id = guy.bid_id
         JOIN updated ON updated.bid_id = guy.bid_id
$$;


--
-- Name: get_flap_blocks_before(numeric, text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_flap_blocks_before(bid_id numeric, contract_address text, block_height bigint) RETURNS SETOF api.relevant_flap_block
    LANGUAGE sql STABLE
    AS $$
SELECT block_number AS block_height, block_hash, kicks AS bid_id
FROM maker.flap_kicks
WHERE block_number <= get_flap_blocks_before.block_height
  AND kicks = get_flap_blocks_before.bid_id
  AND flap_kicks.contract_address = get_flap_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flap_bid_bid.bid_id
FROM maker.flap_bid_bid
WHERE block_number <= get_flap_blocks_before.block_height
  AND flap_bid_bid.bid_id = get_flap_blocks_before.bid_id
  AND flap_bid_bid.contract_address = get_flap_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flap_bid_lot.bid_id
FROM maker.flap_bid_lot
WHERE block_number <= get_flap_blocks_before.block_height
  AND flap_bid_lot.bid_id = get_flap_blocks_before.bid_id
  AND flap_bid_lot.contract_address = get_flap_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flap_bid_guy.bid_id
FROM maker.flap_bid_guy
WHERE block_number <= get_flap_blocks_before.block_height
  AND flap_bid_guy.bid_id = get_flap_blocks_before.bid_id
  AND flap_bid_guy.contract_address = get_flap_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flap_bid_tic.bid_id
FROM maker.flap_bid_tic
WHERE block_number <= get_flap_blocks_before.block_height
  AND flap_bid_tic.bid_id = get_flap_blocks_before.bid_id
  AND flap_bid_tic.contract_address = get_flap_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flap_bid_end.bid_id
FROM maker.flap_bid_end
WHERE block_number <= get_flap_blocks_before.block_height
  AND flap_bid_end.bid_id = get_flap_blocks_before.bid_id
  AND flap_bid_end.contract_address = get_flap_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flap_bid_gal.bid_id
FROM maker.flap_bid_gal
WHERE block_number <= get_flap_blocks_before.block_height
  AND flap_bid_gal.bid_id = get_flap_blocks_before.bid_id
  AND flap_bid_gal.contract_address = get_flap_blocks_before.contract_address
ORDER BY block_height DESC
$$;


--
-- Name: get_flip(numeric, text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_flip(bid_id numeric, ilk text, block_height bigint DEFAULT api.max_block()) RETURNS api.flip_state
    LANGUAGE sql STABLE STRICT
    AS $$
WITH ilk_ids AS (SELECT id FROM maker.ilks WHERE ilks.identifier = get_flip.ilk),
     address AS (SELECT contract_address
                 FROM maker.flip_ilk
                 WHERE flip_ilk.ilk_id = (SELECT id FROM ilk_ids)
                   AND block_number <= block_height
                 LIMIT 1),
     kicks AS (SELECT usr
               FROM maker.flip_kick
               WHERE flip_kick.bid_id = get_flip.bid_id
                 AND contract_address = (SELECT * FROM address)
               LIMIT 1),
     urn_id AS (SELECT id
                FROM maker.urns
                WHERE urns.ilk_id = (SELECT id FROM ilk_ids)
                  AND urns.identifier = (SELECT usr FROM kicks)),
     guys AS (SELECT flip_bid_guy.bid_id, guy
              FROM maker.flip_bid_guy
              WHERE flip_bid_guy.bid_id = get_flip.bid_id
                AND contract_address = (SELECT * FROM address)
                AND block_number <= block_height
              ORDER BY block_number DESC
              LIMIT 1),
     tics AS (SELECT flip_bid_tic.bid_id, tic
              FROM maker.flip_bid_tic
              WHERE flip_bid_tic.bid_id = get_flip.bid_id
                AND contract_address = (SELECT * FROM address)
                AND block_number <= block_height
              ORDER BY block_number DESC
              LIMIT 1),
     ends AS (SELECT flip_bid_end.bid_id, "end"
              FROM maker.flip_bid_end
              WHERE flip_bid_end.bid_id = get_flip.bid_id
                AND contract_address = (SELECT * FROM address)
                AND block_number <= block_height
              ORDER BY block_number DESC
              LIMIT 1),
     lots AS (SELECT flip_bid_lot.bid_id, lot
              FROM maker.flip_bid_lot
              WHERE flip_bid_lot.bid_id = get_flip.bid_id
                AND contract_address = (SELECT * FROM address)
                AND block_number <= block_height
              ORDER BY block_number DESC
              LIMIT 1),
     bids AS (SELECT flip_bid_bid.bid_id, bid
              FROM maker.flip_bid_bid
              WHERE flip_bid_bid.bid_id = get_flip.bid_id
                AND contract_address = (SELECT * FROM address)
                AND block_number <= block_height
              ORDER BY block_number DESC
              LIMIT 1),
     gals AS (SELECT flip_bid_gal.bid_id, gal
              FROM maker.flip_bid_gal
              WHERE flip_bid_gal.bid_id = get_flip.bid_id
                AND contract_address = (SELECT * FROM address)
                AND block_number <= block_height
              ORDER BY block_number DESC
              LIMIT 1),
     tabs AS (SELECT flip_bid_tab.bid_id, tab
              FROM maker.flip_bid_tab
              WHERE flip_bid_tab.bid_id = get_flip.bid_id
                AND contract_address = (SELECT * FROM address)
                AND block_number <= block_height
              ORDER BY block_number DESC
              LIMIT 1),
     deals AS (SELECT deal.bid_id
               FROM maker.deal
                        LEFT JOIN public.headers ON deal.header_id = headers.id
               WHERE deal.bid_id = get_flip.bid_id
                 AND deal.contract_address = (SELECT * FROM address)
                 AND headers.block_number <= block_height),
     relevant_blocks AS (SELECT *
                         FROM api.get_flip_blocks_before(bid_id, (SELECT * FROM address), get_flip.block_height)),
     created AS (SELECT DISTINCT ON (relevant_blocks.bid_id, relevant_blocks.block_height) relevant_blocks.block_height,
                                                                                           relevant_blocks.block_hash,
                                                                                           relevant_blocks.bid_id,
                                                                                           api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM relevant_blocks
                          LEFT JOIN public.headers AS headers on headers.hash = relevant_blocks.block_hash
                 ORDER BY relevant_blocks.block_height ASC
                 LIMIT 1),
     updated AS (SELECT DISTINCT ON (relevant_blocks.bid_id, relevant_blocks.block_height) relevant_blocks.block_height,
                                                                                           relevant_blocks.block_hash,
                                                                                           relevant_blocks.bid_id,
                                                                                           api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM relevant_blocks
                          LEFT JOIN public.headers AS headers on headers.hash = relevant_blocks.block_hash
                 ORDER BY relevant_blocks.block_height DESC
                 LIMIT 1)
SELECT (get_flip.block_height,
        get_flip.bid_id,
        (SELECT id FROM ilk_ids),
        (SELECT id FROM urn_id),
        guys.guy,
        tics.tic,
        ends."end",
        lots.lot,
        bids.bid,
        gals.gal,
        CASE (SELECT COUNT(*) FROM deals)
            WHEN 0 THEN FALSE
            ELSE TRUE
            END,
        tabs.tab,
        created.datetime,
        updated.datetime)::api.flip_state
FROM guys
         LEFT JOIN tics ON tics.bid_id = guys.bid_id
         LEFT JOIN ends ON ends.bid_id = guys.bid_id
         LEFT JOIN lots ON lots.bid_id = guys.bid_id
         LEFT JOIN bids ON bids.bid_id = guys.bid_id
         LEFT JOIN gals ON gals.bid_id = guys.bid_id
         LEFT JOIN tabs ON tabs.bid_id = guys.bid_id
         LEFT JOIN created ON created.bid_id = guys.bid_id
         LEFT JOIN updated ON updated.bid_id = guys.bid_id
$$;


--
-- Name: get_flip_blocks_before(numeric, text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_flip_blocks_before(bid_id numeric, contract_address text, block_height bigint) RETURNS SETOF api.relevant_flip_block
    LANGUAGE sql STABLE
    AS $$
SELECT block_number AS block_height, block_hash, kicks AS bid_id
FROM maker.flip_kicks
WHERE block_number <= get_flip_blocks_before.block_height
  AND kicks = get_flip_blocks_before.bid_id
  AND flip_kicks.contract_address = get_flip_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flip_bid_bid.bid_id
FROM maker.flip_bid_bid
WHERE block_number <= get_flip_blocks_before.block_height
  AND flip_bid_bid.bid_id = get_flip_blocks_before.bid_id
  AND flip_bid_bid.contract_address = get_flip_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flip_bid_lot.bid_id
FROM maker.flip_bid_lot
WHERE block_number <= get_flip_blocks_before.block_height
  AND flip_bid_lot.bid_id = get_flip_blocks_before.bid_id
  AND flip_bid_lot.contract_address = get_flip_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flip_bid_guy.bid_id
FROM maker.flip_bid_guy
WHERE block_number <= get_flip_blocks_before.block_height
  AND flip_bid_guy.bid_id = get_flip_blocks_before.bid_id
  AND flip_bid_guy.contract_address = get_flip_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flip_bid_tic.bid_id
FROM maker.flip_bid_tic
WHERE block_number <= get_flip_blocks_before.block_height
  AND flip_bid_tic.bid_id = get_flip_blocks_before.bid_id
  AND flip_bid_tic.contract_address = get_flip_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flip_bid_end.bid_id
FROM maker.flip_bid_end
WHERE block_number <= get_flip_blocks_before.block_height
  AND flip_bid_end.bid_id = get_flip_blocks_before.bid_id
  AND flip_bid_end.contract_address = get_flip_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flip_bid_usr.bid_id
FROM maker.flip_bid_usr
WHERE block_number <= get_flip_blocks_before.block_height
  AND flip_bid_usr.bid_id = get_flip_blocks_before.bid_id
  AND flip_bid_usr.contract_address = get_flip_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flip_bid_gal.bid_id
FROM maker.flip_bid_gal
WHERE block_number <= get_flip_blocks_before.block_height
  AND flip_bid_gal.bid_id = get_flip_blocks_before.bid_id
  AND flip_bid_gal.contract_address = get_flip_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flip_bid_tab.bid_id
FROM maker.flip_bid_tab
WHERE block_number <= get_flip_blocks_before.block_height
  AND flip_bid_tab.bid_id = get_flip_blocks_before.bid_id
  AND flip_bid_tab.contract_address = get_flip_blocks_before.contract_address
ORDER BY block_height DESC
$$;


--
-- Name: FUNCTION get_flip_blocks_before(bid_id numeric, contract_address text, block_height bigint); Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON FUNCTION api.get_flip_blocks_before(bid_id numeric, contract_address text, block_height bigint) IS '@omit';


--
-- Name: get_flop(numeric, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_flop(bid_id numeric, block_height bigint DEFAULT api.max_block()) RETURNS api.flop
    LANGUAGE sql STABLE
    AS $$
WITH address AS (
    SELECT contract_address
    FROM maker.flop_bid_guy
    WHERE flop_bid_guy.bid_id = get_flop.bid_id
      AND block_number <= block_height
    LIMIT 1
),
     guy AS (
         SELECT guy, bid_id
         FROM maker.flop_bid_guy
         WHERE flop_bid_guy.bid_id = get_flop.bid_id
           AND block_number <= block_height
         ORDER BY flop_bid_guy.bid_id, block_number DESC
         LIMIT 1
     ),
     tic AS (
         SELECT tic, bid_id
         FROM maker.flop_bid_tic
         WHERE flop_bid_tic.bid_id = get_flop.bid_id
           AND block_number <= block_height
         ORDER BY flop_bid_tic.bid_id, block_number DESC
         LIMIT 1
     ),
     "end" AS (
         SELECT "end", bid_id
         FROM maker.flop_bid_end
         WHERE flop_bid_end.bid_id = get_flop.bid_id
           AND block_number <= block_height
         ORDER BY flop_bid_end.bid_id, block_number DESC
         LIMIT 1
     ),
     lot AS (
         SELECT lot, bid_id
         FROM maker.flop_bid_lot
         WHERE flop_bid_lot.bid_id = get_flop.bid_id
           AND block_number <= block_height
         ORDER BY flop_bid_lot.bid_id, block_number DESC
         LIMIT 1
     ),
     bid AS (
         SELECT bid, bid_id
         FROM maker.flop_bid_bid
         WHERE flop_bid_bid.bid_id = get_flop.bid_id
           AND block_number <= block_height
         ORDER BY flop_bid_bid.bid_id, block_number DESC
         LIMIT 1
     ),
     deal AS (
         SELECT deal.bid_id
         FROM maker.deal
                  LEFT JOIN public.headers ON deal.header_id = headers.id
         WHERE deal.bid_id = get_flop.bid_id
           AND deal.contract_address IN (SELECT * FROM address)
           AND headers.block_number <= block_height
         ORDER BY bid_id, block_number DESC
         LIMIT 1
     ),
     relevant_blocks AS (
         SELECT *
         FROM api.get_flop_blocks_before(bid_id, (SELECT * FROM address), get_flop.block_height)
     ),
     created AS (
         SELECT DISTINCT ON (relevant_blocks.bid_id, relevant_blocks.block_height) relevant_blocks.block_height,
                                                                                   relevant_blocks.block_hash,
                                                                                   relevant_blocks.bid_id,
                                                                                   api.epoch_to_datetime(headers.block_timestamp) AS datetime
         FROM relevant_blocks
                  LEFT JOIN public.headers AS headers on headers.hash = relevant_blocks.block_hash
         ORDER BY relevant_blocks.block_height ASC
         LIMIT 1
     ),
     updated AS (
         SELECT DISTINCT ON (relevant_blocks.bid_id, relevant_blocks.block_height) relevant_blocks.block_height,
                                                                                   relevant_blocks.block_hash,
                                                                                   relevant_blocks.bid_id,
                                                                                   api.epoch_to_datetime(headers.block_timestamp) AS datetime
         FROM relevant_blocks
                  LEFT JOIN public.headers AS headers on headers.hash = relevant_blocks.block_hash
         ORDER BY relevant_blocks.block_height DESC
         LIMIT 1
     )

SELECT get_flop.bid_id,
       guy.guy,
       tic.tic,
       "end"."end",
       lot.lot,
       bid.bid,
       CASE (SELECT COUNT(*) FROM deal)
           WHEN 0 THEN FALSE
           ELSE TRUE
           END AS dealt,
       created.datetime,
       updated.datetime
FROM lot
         LEFT JOIN guy ON guy.bid_id = lot.bid_id
         LEFT JOIN tic ON tic.bid_id = lot.bid_id
         LEFT JOIN "end" ON "end".bid_id = lot.bid_id
         LEFT JOIN bid ON bid.bid_id = lot.bid_id
         LEFT JOIN created on created.bid_id = lot.bid_id
         LEFT JOIN updated on updated.bid_id = lot.bid_id
$$;


--
-- Name: get_flop_blocks_before(numeric, text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_flop_blocks_before(bid_id numeric, contract_address text, block_height bigint) RETURNS SETOF api.relevant_flop_block
    LANGUAGE sql STABLE
    AS $$
SELECT block_number AS block_height, block_hash, kicks AS bid_id
FROM maker.flop_kicks
WHERE block_number <= get_flop_blocks_before.block_height
  AND kicks = get_flop_blocks_before.bid_id
  AND flop_kicks.contract_address = get_flop_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flop_bid_bid.bid_id
FROM maker.flop_bid_bid
WHERE block_number <= get_flop_blocks_before.block_height
  AND flop_bid_bid.bid_id = get_flop_blocks_before.bid_id
  AND flop_bid_bid.contract_address = get_flop_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flop_bid_lot.bid_id
FROM maker.flop_bid_lot
WHERE block_number <= get_flop_blocks_before.block_height
  AND flop_bid_lot.bid_id = get_flop_blocks_before.bid_id
  AND flop_bid_lot.contract_address = get_flop_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flop_bid_guy.bid_id
FROM maker.flop_bid_guy
WHERE block_number <= get_flop_blocks_before.block_height
  AND flop_bid_guy.bid_id = get_flop_blocks_before.bid_id
  AND flop_bid_guy.contract_address = get_flop_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flop_bid_tic.bid_id
FROM maker.flop_bid_tic
WHERE block_number <= get_flop_blocks_before.block_height
  AND flop_bid_tic.bid_id = get_flop_blocks_before.bid_id
  AND flop_bid_tic.contract_address = get_flop_blocks_before.contract_address
UNION
SELECT block_number AS block_height, block_hash, flop_bid_end.bid_id
FROM maker.flop_bid_end
WHERE block_number <= get_flop_blocks_before.block_height
  AND flop_bid_end.bid_id = get_flop_blocks_before.bid_id
  AND flop_bid_end.contract_address = get_flop_blocks_before.contract_address
ORDER BY block_height DESC
$$;


--
-- Name: get_ilk(text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_ilk(ilk_identifier text, block_height bigint DEFAULT api.max_block()) RETURNS api.ilk_state
    LANGUAGE sql STABLE STRICT
    AS $$
WITH ilk AS (SELECT id FROM maker.ilks WHERE identifier = ilk_identifier),
     rates AS (SELECT rate, ilk_id, block_hash
               FROM maker.vat_ilk_rate
               WHERE ilk_id = (SELECT id FROM ilk)
                 AND block_number <= get_ilk.block_height
               ORDER BY ilk_id, block_number DESC
               LIMIT 1),
     arts AS (SELECT art, ilk_id, block_hash
              FROM maker.vat_ilk_art
              WHERE ilk_id = (SELECT id FROM ilk)
                AND block_number <= get_ilk.block_height
              ORDER BY ilk_id, block_number DESC
              LIMIT 1),
     spots AS (SELECT spot, ilk_id, block_hash
               FROM maker.vat_ilk_spot
               WHERE ilk_id = (SELECT id FROM ilk)
                 AND block_number <= get_ilk.block_height
               ORDER BY ilk_id, block_number DESC
               LIMIT 1),
     lines AS (SELECT line, ilk_id, block_hash
               FROM maker.vat_ilk_line
               WHERE ilk_id = (SELECT id FROM ilk)
                 AND block_number <= get_ilk.block_height
               ORDER BY ilk_id, block_number DESC
               LIMIT 1),
     dusts AS (SELECT dust, ilk_id, block_hash
               FROM maker.vat_ilk_dust
               WHERE ilk_id = (SELECT id FROM ilk)
                 AND block_number <= get_ilk.block_height
               ORDER BY ilk_id, block_number DESC
               LIMIT 1),
     chops AS (SELECT chop, ilk_id, block_hash
               FROM maker.cat_ilk_chop
               WHERE ilk_id = (SELECT id FROM ilk)
                 AND block_number <= get_ilk.block_height
               ORDER BY ilk_id, block_number DESC
               LIMIT 1),
     lumps AS (SELECT lump, ilk_id, block_hash
               FROM maker.cat_ilk_lump
               WHERE ilk_id = (SELECT id FROM ilk)
                 AND block_number <= get_ilk.block_height
               ORDER BY ilk_id, block_number DESC
               LIMIT 1),
     flips AS (SELECT flip, ilk_id, block_hash
               FROM maker.cat_ilk_flip
               WHERE ilk_id = (SELECT id FROM ilk)
                 AND block_number <= get_ilk.block_height
               ORDER BY ilk_id, block_number DESC
               LIMIT 1),
     rhos AS (SELECT rho, ilk_id, block_hash
              FROM maker.jug_ilk_rho
              WHERE ilk_id = (SELECT id FROM ilk)
                AND block_number <= get_ilk.block_height
              ORDER BY ilk_id, block_number DESC
              LIMIT 1),
     duties AS (SELECT duty, ilk_id, block_hash
                FROM maker.jug_ilk_duty
                WHERE ilk_id = (SELECT id FROM ilk)
                  AND block_number <= get_ilk.block_height
                ORDER BY ilk_id, block_number DESC
                LIMIT 1),
     pips AS (SELECT pip, ilk_id, block_hash
              FROM maker.spot_ilk_pip
              WHERE ilk_id = (SELECT id FROM ilk)
                AND block_number <= get_ilk.block_height
              ORDER BY ilk_id, block_number DESC
              LIMIT 1),
     mats AS (SELECT mat, ilk_id, block_hash
              FROM maker.spot_ilk_mat
              WHERE ilk_id = (SELECT id FROM ilk)
                AND block_number <= get_ilk.block_height
              ORDER BY ilk_id, block_number DESC
              LIMIT 1),
     relevant_blocks AS (SELECT * FROM api.get_ilk_blocks_before(ilk_identifier, get_ilk.block_height)),
     created AS (SELECT DISTINCT ON (relevant_blocks.ilk_id,
         relevant_blocks.block_height) relevant_blocks.block_height,
                                       relevant_blocks.block_hash,
                                       relevant_blocks.ilk_id,
                                       api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM relevant_blocks
                          LEFT JOIN public.headers AS headers on headers.hash = relevant_blocks.block_hash
                 ORDER BY relevant_blocks.block_height ASC
                 LIMIT 1),
     updated AS (SELECT DISTINCT ON (relevant_blocks.ilk_id,
         relevant_blocks.block_height) relevant_blocks.block_height,
                                       relevant_blocks.block_hash,
                                       relevant_blocks.ilk_id,
                                       api.epoch_to_datetime(headers.block_timestamp) AS datetime
                 FROM relevant_blocks
                          LEFT JOIN public.headers AS headers on headers.hash = relevant_blocks.block_hash
                 ORDER BY relevant_blocks.block_height DESC
                 LIMIT 1)

SELECT ilks.identifier,
       get_ilk.block_height,
       rates.rate,
       arts.art,
       spots.spot,
       lines.line,
       dusts.dust,
       chops.chop,
       lumps.lump,
       flips.flip,
       rhos.rho,
       duties.duty,
       pips.pip,
       mats.mat,
       created.datetime,
       updated.datetime
FROM maker.ilks AS ilks
         LEFT JOIN rates ON rates.ilk_id = ilks.id
         LEFT JOIN arts ON arts.ilk_id = ilks.id
         LEFT JOIN spots ON spots.ilk_id = ilks.id
         LEFT JOIN lines ON lines.ilk_id = ilks.id
         LEFT JOIN dusts ON dusts.ilk_id = ilks.id
         LEFT JOIN chops ON chops.ilk_id = ilks.id
         LEFT JOIN lumps ON lumps.ilk_id = ilks.id
         LEFT JOIN flips ON flips.ilk_id = ilks.id
         LEFT JOIN rhos ON rhos.ilk_id = ilks.id
         LEFT JOIN duties ON duties.ilk_id = ilks.id
         LEFT JOIN pips ON pips.ilk_id = ilks.id
         LEFT JOIN mats ON mats.ilk_id = ilks.id
         LEFT JOIN created ON created.ilk_id = ilks.id
         LEFT JOIN updated ON updated.ilk_id = ilks.id
WHERE (
              rates.rate is not null OR
              arts.art is not null OR
              spots.spot is not null OR
              lines.line is not null OR
              dusts.dust is not null OR
              chops.chop is not null OR
              lumps.lump is not null OR
              flips.flip is not null OR
              rhos.rho is not null OR
              duties.duty is not null OR
              pips.pip is not null OR
              mats.mat is not null
          )
$$;


--
-- Name: get_ilk_blocks_before(text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_ilk_blocks_before(ilk_identifier text, block_height bigint) RETURNS SETOF api.relevant_block
    LANGUAGE sql STABLE
    AS $$
WITH ilk AS (SELECT id FROM maker.ilks WHERE identifier = ilk_identifier)
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.vat_ilk_rate
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.vat_ilk_art
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.vat_ilk_spot
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.vat_ilk_line
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.vat_ilk_dust
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.cat_ilk_chop
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.cat_ilk_lump
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.cat_ilk_flip
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.jug_ilk_rho
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
UNION
SELECT block_number AS block_height, block_hash, ilk_id
FROM maker.jug_ilk_duty
WHERE block_number <= get_ilk_blocks_before.block_height
  AND ilk_id = (SELECT id FROM ilk)
ORDER BY block_height DESC
$$;


--
-- Name: FUNCTION get_ilk_blocks_before(ilk_identifier text, block_height bigint); Type: COMMENT; Schema: api; Owner: -
--

COMMENT ON FUNCTION api.get_ilk_blocks_before(ilk_identifier text, block_height bigint) IS '@omit';


--
-- Name: get_queued_sin(numeric); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_queued_sin(era numeric) RETURNS api.queued_sin
    LANGUAGE sql STABLE STRICT
    AS $$
WITH created AS (SELECT era, vow_sin_mapping.block_number, api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM maker.vow_sin_mapping
                          LEFT JOIN public.headers h ON h.block_number = vow_sin_mapping.block_number
                 WHERE era = get_queued_sin.era
                 ORDER BY vow_sin_mapping.block_number ASC
                 LIMIT 1),
     updated AS (SELECT era, vow_sin_mapping.block_number, api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM maker.vow_sin_mapping
                          LEFT JOIN public.headers h ON h.block_number = vow_sin_mapping.block_number
                 WHERE era = get_queued_sin.era
                 ORDER BY vow_sin_mapping.block_number DESC
                 LIMIT 1)

SELECT get_queued_sin.era,
       tab,
       (SELECT EXISTS(SELECT id FROM maker.vow_flog WHERE vow_flog.era = get_queued_sin.era)) AS flogged,
       created.datetime,
       updated.datetime
FROM maker.vow_sin_mapping
         LEFT JOIN created ON created.era = vow_sin_mapping.era
         LEFT JOIN updated ON updated.era = vow_sin_mapping.era
WHERE vow_sin_mapping.era = get_queued_sin.era
ORDER BY vow_sin_mapping.block_number DESC
$$;


--
-- Name: get_urn(text, text, bigint); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.get_urn(ilk_identifier text, urn_identifier text, block_height bigint DEFAULT api.max_block()) RETURNS api.urn_state
    LANGUAGE sql STABLE STRICT
    AS $_$
WITH urn AS (SELECT urns.id AS urn_id, ilks.id AS ilk_id, ilks.ilk, urns.identifier
             FROM maker.urns urns
                      LEFT JOIN maker.ilks ilks ON urns.ilk_id = ilks.id
             WHERE ilks.identifier = ilk_identifier
               AND urns.identifier = urn_identifier),
     ink AS ( -- Latest ink
         SELECT DISTINCT ON (urn_id) urn_id, ink, block_number
         FROM maker.vat_urn_ink
         WHERE urn_id = (SELECT urn_id from urn where identifier = urn_identifier)
           AND block_number <= get_urn.block_height
         ORDER BY urn_id, block_number DESC),
     art AS ( -- Latest art
         SELECT DISTINCT ON (urn_id) urn_id, art, block_number
         FROM maker.vat_urn_art
         WHERE urn_id = (SELECT urn_id from urn where identifier = urn_identifier)
           AND block_number <= get_urn.block_height
         ORDER BY urn_id, block_number DESC),
     rate AS ( -- Latest rate for ilk
         SELECT DISTINCT ON (ilk_id) ilk_id, rate, block_number
         FROM maker.vat_ilk_rate
         WHERE ilk_id = (SELECT ilk_id FROM urn)
           AND block_number <= get_urn.block_height
         ORDER BY ilk_id, block_number DESC),
     spot AS ( -- Get latest price update for ilk. Problematic from update frequency, slow query?
         SELECT DISTINCT ON (ilk_id) ilk_id, spot, block_number
         FROM maker.vat_ilk_spot
         WHERE ilk_id = (SELECT ilk_id FROM urn)
           AND block_number <= get_urn.block_height
         ORDER BY ilk_id, block_number DESC),
     ratio_data AS (SELECT urn.ilk, urn.identifier, ink, spot, art, rate
                    FROM ink
                             JOIN urn ON ink.urn_id = urn.urn_id
                             JOIN art ON art.urn_id = ink.urn_id
                             JOIN spot ON spot.ilk_id = urn.ilk_id
                             JOIN rate ON rate.ilk_id = spot.ilk_id),
     ratio AS (SELECT ilk, identifier as urn_identifier, ((1.0 * ink * spot) / NULLIF(art * rate, 0)) AS ratio FROM ratio_data),
     safe AS (SELECT ilk, urn_identifier, (ratio >= 1) AS safe FROM ratio),
     created AS (SELECT urn_id, api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM (SELECT DISTINCT ON (urn_id) urn_id, block_hash
                       FROM maker.vat_urn_ink
                       WHERE urn_id = (SELECT urn_id from urn where identifier = urn_identifier)
                       ORDER BY urn_id, block_number ASC) earliest_blocks
                          LEFT JOIN public.headers ON hash = block_hash),
     updated AS (SELECT DISTINCT ON (urn_id) urn_id, api.epoch_to_datetime(block_timestamp) AS datetime
                 FROM (SELECT urn_id, block_number
                       FROM ink
                       UNION
                       SELECT urn_id, block_number
                       FROM art) last_blocks
                          LEFT JOIN public.headers ON headers.block_number = last_blocks.block_number
                 ORDER BY urn_id, block_timestamp DESC)

SELECT get_urn.urn_identifier,
       ilk_identifier,
       $3,
       ink.ink,
       art.art,
       ratio.ratio,
       COALESCE(safe.safe, art.art = 0),
       created.datetime,
       updated.datetime
FROM ink
         LEFT JOIN art ON art.urn_id = ink.urn_id
         LEFT JOIN urn ON urn.urn_id = ink.urn_id
         LEFT JOIN ratio ON ratio.ilk = urn.ilk AND ratio.urn_identifier = urn.identifier
         LEFT JOIN safe ON safe.ilk = ratio.ilk AND safe.urn_identifier = ratio.urn_identifier
         LEFT JOIN created ON created.urn_id = art.urn_id
         LEFT JOIN updated ON updated.urn_id = art.urn_id
WHERE ink.urn_id IS NOT NULL
$_$;


--
-- Name: ilk_file_event_ilk(api.ilk_file_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.ilk_file_event_ilk(event api.ilk_file_event) RETURNS SETOF api.ilk_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_ilk(event.ilk_identifier, event.block_height)
$$;


--
-- Name: ilk_file_event_tx(api.ilk_file_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.ilk_file_event_tx(event api.ilk_file_event) RETURNS api.tx
    LANGUAGE sql STABLE
    AS $$
SELECT txs.hash, txs.tx_index, headers.block_number, headers.hash, tx_from, tx_to
FROM public.header_sync_transactions txs
         LEFT JOIN headers ON txs.header_id = headers.id
WHERE block_number <= event.block_height
  AND txs.tx_index = event.tx_idx
ORDER BY block_number DESC
LIMIT 1
$$;


--
-- Name: ilk_state_bites(api.ilk_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.ilk_state_bites(state api.ilk_state) RETURNS SETOF api.bite_event
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.all_bites(state.ilk_identifier)
WHERE block_height <= state.block_height
$$;


--
-- Name: ilk_state_frobs(api.ilk_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.ilk_state_frobs(state api.ilk_state) RETURNS SETOF api.frob_event
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.all_frobs(state.ilk_identifier)
WHERE block_height <= state.block_height
$$;


--
-- Name: ilk_state_ilk_file_events(api.ilk_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.ilk_state_ilk_file_events(state api.ilk_state) RETURNS SETOF api.ilk_file_event
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.all_ilk_file_events(state.ilk_identifier)
WHERE block_height <= state.block_height
$$;


--
-- Name: poke_event_ilk(api.poke_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.poke_event_ilk(priceupdate api.poke_event) RETURNS api.ilk_state
    LANGUAGE sql STABLE
    AS $$
WITH raw_ilk AS (SELECT * FROM maker.ilks WHERE ilks.id = priceUpdate.ilk_id)

SELECT *
FROM api.get_ilk((SELECT identifier FROM raw_ilk), priceUpdate.block_height)
$$;


--
-- Name: poke_event_tx(api.poke_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.poke_event_tx(priceupdate api.poke_event) RETURNS api.tx
    LANGUAGE sql STABLE
    AS $$
SELECT txs.hash, txs.tx_index, headers.block_number, headers.hash, txs.tx_from, txs.tx_to
FROM public.header_sync_transactions txs
         LEFT JOIN headers ON txs.header_id = headers.id
WHERE headers.block_number = priceUpdate.block_height
  AND txs.tx_index = priceUpdate.tx_idx
ORDER BY headers.block_number DESC
$$;


--
-- Name: queued_sin_sin_queue_events(api.queued_sin); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.queued_sin_sin_queue_events(state api.queued_sin) RETURNS SETOF api.sin_queue_event
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.all_sin_queue_events(state.era)
$$;


--
-- Name: sin_queue_event_tx(api.sin_queue_event); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.sin_queue_event_tx(event api.sin_queue_event) RETURNS api.tx
    LANGUAGE sql STABLE
    AS $$
SELECT txs.hash, txs.tx_index, headers.block_number AS block_height, headers.hash, tx_from, tx_to
FROM public.header_sync_transactions txs
         LEFT JOIN headers ON txs.header_id = headers.id
WHERE block_number <= event.block_height
  AND txs.tx_index = event.tx_idx
ORDER BY block_height DESC
$$;


--
-- Name: tx_era(api.tx); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.tx_era(tx api.tx) RETURNS api.era
    LANGUAGE sql STABLE
    AS $$
SELECT block_timestamp :: BIGINT AS "epoch", api.epoch_to_datetime(block_timestamp) AS iso
FROM headers
WHERE block_number = tx.block_height
$$;


--
-- Name: urn_bites(text, text); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.urn_bites(ilk_identifier text, urn_identifier text) RETURNS SETOF api.bite_event
    LANGUAGE sql STABLE STRICT
    AS $$
WITH ilk AS (SELECT id FROM maker.ilks WHERE ilks.identifier = ilk_identifier),
     urn AS (SELECT id
             FROM maker.urns
             WHERE ilk_id = (SELECT id FROM ilk)
               AND identifier = urn_bites.urn_identifier)
SELECT ilk_identifier, urn_bites.urn_identifier, bite_identifier AS bid_id, ink, art, tab, block_number, tx_idx
FROM maker.bite
         LEFT JOIN headers ON bite.header_id = headers.id
WHERE bite.urn_id = (SELECT id FROM urn)
ORDER BY block_number DESC
$$;


--
-- Name: urn_frobs(text, text); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.urn_frobs(ilk_identifier text, urn_identifier text) RETURNS SETOF api.frob_event
    LANGUAGE sql STABLE STRICT
    AS $$
WITH ilk AS (SELECT id FROM maker.ilks WHERE ilks.identifier = ilk_identifier),
     urn AS (SELECT id
             FROM maker.urns
             WHERE ilk_id = (SELECT id FROM ilk)
               AND identifier = urn_identifier)

SELECT ilk_identifier, urn_identifier, dink, dart, block_number, tx_idx
FROM maker.vat_frob
         LEFT JOIN headers ON vat_frob.header_id = headers.id
WHERE vat_frob.urn_id = (SELECT id FROM urn)
ORDER BY block_number DESC
$$;


--
-- Name: urn_state_bites(api.urn_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.urn_state_bites(state api.urn_state) RETURNS SETOF api.bite_event
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.urn_bites(state.ilk_identifier, state.urn_identifier)
WHERE block_height <= state.block_height
$$;


--
-- Name: urn_state_frobs(api.urn_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.urn_state_frobs(state api.urn_state) RETURNS SETOF api.frob_event
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.urn_frobs(state.ilk_identifier, state.urn_identifier)
WHERE block_height <= state.block_height
$$;


--
-- Name: urn_state_ilk(api.urn_state); Type: FUNCTION; Schema: api; Owner: -
--

CREATE FUNCTION api.urn_state_ilk(state api.urn_state) RETURNS api.ilk_state
    LANGUAGE sql STABLE
    AS $$
SELECT *
FROM api.get_ilk(state.ilk_identifier, state.block_height)
$$;


--
-- Name: get_tx_data(bigint, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_tx_data(block_height bigint, tx_idx integer) RETURNS SETOF api.tx
    LANGUAGE sql STABLE
    AS $$
SELECT txs.hash, txs.tx_index, headers.block_number, headers.hash, tx_from, tx_to
FROM header_sync_transactions txs
         LEFT JOIN headers ON txs.header_id = headers.id
WHERE block_number <= block_height
  AND txs.tx_index <= tx_idx
ORDER BY block_number DESC
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bite; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.bite (
    id integer NOT NULL,
    header_id integer NOT NULL,
    urn_id integer NOT NULL,
    ink numeric,
    art numeric,
    tab numeric,
    flip text,
    bite_identifier numeric,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: TABLE bite; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.bite IS '@name raw_bites';


--
-- Name: COLUMN bite.id; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON COLUMN maker.bite.id IS '@omit';


--
-- Name: COLUMN bite.bite_identifier; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON COLUMN maker.bite.bite_identifier IS '@name id';


--
-- Name: bite_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.bite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bite_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.bite_id_seq OWNED BY maker.bite.id;


--
-- Name: cat_file_chop_lump; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_file_chop_lump (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    what text,
    data numeric,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: cat_file_chop_lump_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_file_chop_lump_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_file_chop_lump_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_file_chop_lump_id_seq OWNED BY maker.cat_file_chop_lump.id;


--
-- Name: cat_file_flip; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_file_flip (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    what text,
    flip text,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: cat_file_flip_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_file_flip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_file_flip_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_file_flip_id_seq OWNED BY maker.cat_file_flip.id;


--
-- Name: cat_file_vow; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_file_vow (
    id integer NOT NULL,
    header_id integer NOT NULL,
    what text,
    data text,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: cat_file_vow_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_file_vow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_file_vow_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_file_vow_id_seq OWNED BY maker.cat_file_vow.id;


--
-- Name: cat_ilk_chop; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_ilk_chop (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    chop numeric NOT NULL
);


--
-- Name: cat_ilk_chop_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_ilk_chop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_ilk_chop_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_ilk_chop_id_seq OWNED BY maker.cat_ilk_chop.id;


--
-- Name: cat_ilk_flip; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_ilk_flip (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    flip text
);


--
-- Name: cat_ilk_flip_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_ilk_flip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_ilk_flip_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_ilk_flip_id_seq OWNED BY maker.cat_ilk_flip.id;


--
-- Name: cat_ilk_lump; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_ilk_lump (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    lump numeric NOT NULL
);


--
-- Name: cat_ilk_lump_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_ilk_lump_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_ilk_lump_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_ilk_lump_id_seq OWNED BY maker.cat_ilk_lump.id;


--
-- Name: cat_live; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_live (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    live numeric NOT NULL
);


--
-- Name: cat_live_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_live_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_live_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_live_id_seq OWNED BY maker.cat_live.id;


--
-- Name: cat_vat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_vat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    vat text
);


--
-- Name: cat_vat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_vat_id_seq OWNED BY maker.cat_vat.id;


--
-- Name: cat_vow; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cat_vow (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    vow text
);


--
-- Name: cat_vow_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cat_vow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_vow_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cat_vow_id_seq OWNED BY maker.cat_vow.id;


--
-- Name: cdp_manager_cdpi; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_cdpi (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    cdpi numeric NOT NULL
);


--
-- Name: cdp_manager_cdpi_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_cdpi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_cdpi_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_cdpi_id_seq OWNED BY maker.cdp_manager_cdpi.id;


--
-- Name: cdp_manager_count; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_count (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    owner text,
    count numeric NOT NULL
);


--
-- Name: cdp_manager_count_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_count_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_count_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_count_id_seq OWNED BY maker.cdp_manager_count.id;


--
-- Name: cdp_manager_first; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_first (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    owner text,
    first numeric NOT NULL
);


--
-- Name: cdp_manager_first_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_first_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_first_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_first_id_seq OWNED BY maker.cdp_manager_first.id;


--
-- Name: cdp_manager_ilks; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_ilks (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    cdpi numeric NOT NULL,
    ilk_id integer NOT NULL
);


--
-- Name: cdp_manager_ilks_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_ilks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_ilks_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_ilks_id_seq OWNED BY maker.cdp_manager_ilks.id;


--
-- Name: cdp_manager_last; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_last (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    owner text,
    last numeric NOT NULL
);


--
-- Name: cdp_manager_last_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_last_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_last_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_last_id_seq OWNED BY maker.cdp_manager_last.id;


--
-- Name: cdp_manager_list_next; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_list_next (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    cdpi numeric NOT NULL,
    next numeric NOT NULL
);


--
-- Name: cdp_manager_list_next_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_list_next_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_list_next_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_list_next_id_seq OWNED BY maker.cdp_manager_list_next.id;


--
-- Name: cdp_manager_list_prev; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_list_prev (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    cdpi numeric NOT NULL,
    prev numeric NOT NULL
);


--
-- Name: cdp_manager_list_prev_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_list_prev_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_list_prev_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_list_prev_id_seq OWNED BY maker.cdp_manager_list_prev.id;


--
-- Name: cdp_manager_owns; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_owns (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    cdpi numeric NOT NULL,
    owner text
);


--
-- Name: cdp_manager_owns_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_owns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_owns_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_owns_id_seq OWNED BY maker.cdp_manager_owns.id;


--
-- Name: cdp_manager_urns; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_urns (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    cdpi numeric NOT NULL,
    urn text
);


--
-- Name: cdp_manager_urns_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_urns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_urns_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_urns_id_seq OWNED BY maker.cdp_manager_urns.id;


--
-- Name: cdp_manager_vat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.cdp_manager_vat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    vat text
);


--
-- Name: cdp_manager_vat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.cdp_manager_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cdp_manager_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.cdp_manager_vat_id_seq OWNED BY maker.cdp_manager_vat.id;


--
-- Name: deal; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.deal (
    id integer NOT NULL,
    header_id integer NOT NULL,
    bid_id numeric NOT NULL,
    contract_address text,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: deal_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.deal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deal_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.deal_id_seq OWNED BY maker.deal.id;


--
-- Name: dent; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.dent (
    id integer NOT NULL,
    header_id integer NOT NULL,
    bid_id numeric NOT NULL,
    lot numeric,
    bid numeric,
    contract_address text,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: dent_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.dent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dent_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.dent_id_seq OWNED BY maker.dent.id;


--
-- Name: flap_beg; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_beg (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    beg numeric NOT NULL
);


--
-- Name: flap_beg_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_beg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_beg_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_beg_id_seq OWNED BY maker.flap_beg.id;


--
-- Name: flap_bid_bid; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_bid_bid (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    bid numeric NOT NULL
);


--
-- Name: flap_bid_bid_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_bid_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_bid_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_bid_bid_id_seq OWNED BY maker.flap_bid_bid.id;


--
-- Name: flap_bid_end; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_bid_end (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    "end" bigint NOT NULL
);


--
-- Name: flap_bid_end_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_bid_end_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_bid_end_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_bid_end_id_seq OWNED BY maker.flap_bid_end.id;


--
-- Name: flap_bid_gal; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_bid_gal (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    gal text NOT NULL
);


--
-- Name: flap_bid_gal_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_bid_gal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_bid_gal_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_bid_gal_id_seq OWNED BY maker.flap_bid_gal.id;


--
-- Name: flap_bid_guy; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_bid_guy (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    guy text NOT NULL
);


--
-- Name: flap_bid_guy_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_bid_guy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_bid_guy_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_bid_guy_id_seq OWNED BY maker.flap_bid_guy.id;


--
-- Name: flap_bid_lot; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_bid_lot (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    lot numeric NOT NULL
);


--
-- Name: flap_bid_lot_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_bid_lot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_bid_lot_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_bid_lot_id_seq OWNED BY maker.flap_bid_lot.id;


--
-- Name: flap_bid_tic; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_bid_tic (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    tic bigint NOT NULL
);


--
-- Name: flap_bid_tic_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_bid_tic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_bid_tic_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_bid_tic_id_seq OWNED BY maker.flap_bid_tic.id;


--
-- Name: flap_gem; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_gem (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    gem text NOT NULL
);


--
-- Name: flap_gem_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_gem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_gem_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_gem_id_seq OWNED BY maker.flap_gem.id;


--
-- Name: flap_kick; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_kick (
    id integer NOT NULL,
    header_id integer NOT NULL,
    bid_id numeric NOT NULL,
    lot numeric NOT NULL,
    bid numeric NOT NULL,
    gal text,
    contract_address text,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: TABLE flap_kick; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.flap_kick IS '@name flapKickEvent';


--
-- Name: flap_kick_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_kick_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_kick_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_kick_id_seq OWNED BY maker.flap_kick.id;


--
-- Name: flap_kicks; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_kicks (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    kicks numeric NOT NULL
);


--
-- Name: TABLE flap_kicks; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.flap_kicks IS '@name flapKicksStorage';


--
-- Name: flap_kicks_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_kicks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_kicks_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_kicks_id_seq OWNED BY maker.flap_kicks.id;


--
-- Name: flap_live; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_live (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    live numeric NOT NULL
);


--
-- Name: flap_live_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_live_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_live_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_live_id_seq OWNED BY maker.flap_live.id;


--
-- Name: flap_tau; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_tau (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    tau integer NOT NULL
);


--
-- Name: flap_tau_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_tau_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_tau_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_tau_id_seq OWNED BY maker.flap_tau.id;


--
-- Name: flap_ttl; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_ttl (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    ttl integer NOT NULL
);


--
-- Name: flap_ttl_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_ttl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_ttl_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_ttl_id_seq OWNED BY maker.flap_ttl.id;


--
-- Name: flap_vat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flap_vat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    vat text NOT NULL
);


--
-- Name: flap_vat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flap_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flap_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flap_vat_id_seq OWNED BY maker.flap_vat.id;


--
-- Name: flip_beg; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_beg (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    beg numeric NOT NULL
);


--
-- Name: flip_beg_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_beg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_beg_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_beg_id_seq OWNED BY maker.flip_beg.id;


--
-- Name: flip_bid_bid; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_bid_bid (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    bid numeric NOT NULL
);


--
-- Name: flip_bid_bid_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_bid_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_bid_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_bid_bid_id_seq OWNED BY maker.flip_bid_bid.id;


--
-- Name: flip_bid_end; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_bid_end (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    "end" bigint NOT NULL
);


--
-- Name: flip_bid_end_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_bid_end_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_bid_end_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_bid_end_id_seq OWNED BY maker.flip_bid_end.id;


--
-- Name: flip_bid_gal; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_bid_gal (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    gal text
);


--
-- Name: flip_bid_gal_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_bid_gal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_bid_gal_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_bid_gal_id_seq OWNED BY maker.flip_bid_gal.id;


--
-- Name: flip_bid_guy; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_bid_guy (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    guy text
);


--
-- Name: flip_bid_guy_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_bid_guy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_bid_guy_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_bid_guy_id_seq OWNED BY maker.flip_bid_guy.id;


--
-- Name: flip_bid_lot; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_bid_lot (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    lot numeric NOT NULL
);


--
-- Name: flip_bid_lot_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_bid_lot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_bid_lot_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_bid_lot_id_seq OWNED BY maker.flip_bid_lot.id;


--
-- Name: flip_bid_tab; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_bid_tab (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    tab numeric NOT NULL
);


--
-- Name: flip_bid_tab_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_bid_tab_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_bid_tab_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_bid_tab_id_seq OWNED BY maker.flip_bid_tab.id;


--
-- Name: flip_bid_tic; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_bid_tic (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    tic bigint NOT NULL
);


--
-- Name: flip_bid_tic_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_bid_tic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_bid_tic_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_bid_tic_id_seq OWNED BY maker.flip_bid_tic.id;


--
-- Name: flip_bid_usr; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_bid_usr (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    usr text
);


--
-- Name: flip_bid_usr_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_bid_usr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_bid_usr_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_bid_usr_id_seq OWNED BY maker.flip_bid_usr.id;


--
-- Name: flip_ilk; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_ilk (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    ilk_id integer NOT NULL
);


--
-- Name: flip_ilk_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_ilk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_ilk_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_ilk_id_seq OWNED BY maker.flip_ilk.id;


--
-- Name: flip_kick; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_kick (
    id integer NOT NULL,
    header_id integer NOT NULL,
    bid_id numeric NOT NULL,
    lot numeric,
    bid numeric,
    tab numeric,
    usr text,
    gal text,
    contract_address text,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: TABLE flip_kick; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.flip_kick IS '@name flipKickEvent';


--
-- Name: flip_kick_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_kick_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_kick_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_kick_id_seq OWNED BY maker.flip_kick.id;


--
-- Name: flip_kicks; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_kicks (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    kicks numeric NOT NULL
);


--
-- Name: TABLE flip_kicks; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.flip_kicks IS '@name flipKicksStorage';


--
-- Name: flip_kicks_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_kicks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_kicks_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_kicks_id_seq OWNED BY maker.flip_kicks.id;


--
-- Name: flip_tau; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_tau (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    tau numeric NOT NULL
);


--
-- Name: flip_tau_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_tau_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_tau_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_tau_id_seq OWNED BY maker.flip_tau.id;


--
-- Name: flip_tick; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_tick (
    id integer NOT NULL,
    header_id integer NOT NULL,
    bid_id numeric NOT NULL,
    contract_address text,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: flip_tick_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_tick_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_tick_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_tick_id_seq OWNED BY maker.flip_tick.id;


--
-- Name: flip_ttl; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_ttl (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    ttl numeric NOT NULL
);


--
-- Name: flip_ttl_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_ttl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_ttl_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_ttl_id_seq OWNED BY maker.flip_ttl.id;


--
-- Name: flip_vat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flip_vat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    vat text
);


--
-- Name: flip_vat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flip_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flip_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flip_vat_id_seq OWNED BY maker.flip_vat.id;


--
-- Name: flop_beg; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_beg (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    beg numeric NOT NULL
);


--
-- Name: flop_beg_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_beg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_beg_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_beg_id_seq OWNED BY maker.flop_beg.id;


--
-- Name: flop_bid_bid; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_bid_bid (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    bid numeric NOT NULL
);


--
-- Name: flop_bid_bid_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_bid_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_bid_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_bid_bid_id_seq OWNED BY maker.flop_bid_bid.id;


--
-- Name: flop_bid_end; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_bid_end (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    "end" bigint NOT NULL
);


--
-- Name: flop_bid_end_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_bid_end_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_bid_end_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_bid_end_id_seq OWNED BY maker.flop_bid_end.id;


--
-- Name: flop_bid_guy; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_bid_guy (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    guy text
);


--
-- Name: flop_bid_guy_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_bid_guy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_bid_guy_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_bid_guy_id_seq OWNED BY maker.flop_bid_guy.id;


--
-- Name: flop_bid_lot; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_bid_lot (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    lot numeric NOT NULL
);


--
-- Name: flop_bid_lot_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_bid_lot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_bid_lot_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_bid_lot_id_seq OWNED BY maker.flop_bid_lot.id;


--
-- Name: flop_bid_tic; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_bid_tic (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    bid_id numeric NOT NULL,
    tic bigint NOT NULL
);


--
-- Name: flop_bid_tic_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_bid_tic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_bid_tic_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_bid_tic_id_seq OWNED BY maker.flop_bid_tic.id;


--
-- Name: flop_gem; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_gem (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    gem text
);


--
-- Name: flop_gem_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_gem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_gem_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_gem_id_seq OWNED BY maker.flop_gem.id;


--
-- Name: flop_kick; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_kick (
    id integer NOT NULL,
    header_id integer NOT NULL,
    bid_id numeric NOT NULL,
    lot numeric NOT NULL,
    bid numeric NOT NULL,
    gal text,
    contract_address text,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: TABLE flop_kick; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.flop_kick IS '@name flopKickEvent';


--
-- Name: flop_kick_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_kick_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_kick_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_kick_id_seq OWNED BY maker.flop_kick.id;


--
-- Name: flop_kicks; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_kicks (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    kicks numeric NOT NULL
);


--
-- Name: TABLE flop_kicks; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.flop_kicks IS '@name flopKicksStorage';


--
-- Name: flop_kicks_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_kicks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_kicks_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_kicks_id_seq OWNED BY maker.flop_kicks.id;


--
-- Name: flop_live; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_live (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    live numeric NOT NULL
);


--
-- Name: flop_live_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_live_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_live_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_live_id_seq OWNED BY maker.flop_live.id;


--
-- Name: flop_tau; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_tau (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    tau numeric NOT NULL
);


--
-- Name: flop_tau_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_tau_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_tau_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_tau_id_seq OWNED BY maker.flop_tau.id;


--
-- Name: flop_ttl; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_ttl (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    ttl numeric NOT NULL
);


--
-- Name: flop_ttl_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_ttl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_ttl_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_ttl_id_seq OWNED BY maker.flop_ttl.id;


--
-- Name: flop_vat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.flop_vat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    contract_address text,
    vat text
);


--
-- Name: flop_vat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.flop_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flop_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.flop_vat_id_seq OWNED BY maker.flop_vat.id;


--
-- Name: ilks; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.ilks (
    id integer NOT NULL,
    ilk text NOT NULL,
    identifier text NOT NULL
);


--
-- Name: TABLE ilks; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.ilks IS '@name raw_ilks';


--
-- Name: ilks_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.ilks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ilks_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.ilks_id_seq OWNED BY maker.ilks.id;


--
-- Name: jug_base; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_base (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    base text
);


--
-- Name: jug_base_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_base_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_base_id_seq OWNED BY maker.jug_base.id;


--
-- Name: jug_drip; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_drip (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: jug_drip_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_drip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_drip_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_drip_id_seq OWNED BY maker.jug_drip.id;


--
-- Name: jug_file_base; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_file_base (
    id integer NOT NULL,
    header_id integer NOT NULL,
    what text,
    data numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: jug_file_base_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_file_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_file_base_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_file_base_id_seq OWNED BY maker.jug_file_base.id;


--
-- Name: jug_file_ilk; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_file_ilk (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    what text,
    data numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: jug_file_ilk_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_file_ilk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_file_ilk_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_file_ilk_id_seq OWNED BY maker.jug_file_ilk.id;


--
-- Name: jug_file_vow; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_file_vow (
    id integer NOT NULL,
    header_id integer NOT NULL,
    what text,
    data text,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: jug_file_vow_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_file_vow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_file_vow_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_file_vow_id_seq OWNED BY maker.jug_file_vow.id;


--
-- Name: jug_ilk_duty; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_ilk_duty (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    duty numeric NOT NULL
);


--
-- Name: jug_ilk_duty_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_ilk_duty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_ilk_duty_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_ilk_duty_id_seq OWNED BY maker.jug_ilk_duty.id;


--
-- Name: jug_ilk_rho; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_ilk_rho (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    rho numeric NOT NULL
);


--
-- Name: jug_ilk_rho_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_ilk_rho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_ilk_rho_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_ilk_rho_id_seq OWNED BY maker.jug_ilk_rho.id;


--
-- Name: jug_init; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_init (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: jug_init_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_init_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_init_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_init_id_seq OWNED BY maker.jug_init.id;


--
-- Name: jug_vat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_vat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    vat text
);


--
-- Name: jug_vat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_vat_id_seq OWNED BY maker.jug_vat.id;


--
-- Name: jug_vow; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.jug_vow (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    vow text
);


--
-- Name: jug_vow_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.jug_vow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jug_vow_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.jug_vow_id_seq OWNED BY maker.jug_vow.id;


--
-- Name: spot_file_mat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.spot_file_mat (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    what text,
    data numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: spot_file_mat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.spot_file_mat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spot_file_mat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.spot_file_mat_id_seq OWNED BY maker.spot_file_mat.id;


--
-- Name: spot_file_pip; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.spot_file_pip (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    pip text,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: spot_file_pip_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.spot_file_pip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spot_file_pip_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.spot_file_pip_id_seq OWNED BY maker.spot_file_pip.id;


--
-- Name: spot_ilk_mat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.spot_ilk_mat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    mat numeric NOT NULL
);


--
-- Name: spot_ilk_mat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.spot_ilk_mat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spot_ilk_mat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.spot_ilk_mat_id_seq OWNED BY maker.spot_ilk_mat.id;


--
-- Name: spot_ilk_pip; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.spot_ilk_pip (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    pip text
);


--
-- Name: spot_ilk_pip_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.spot_ilk_pip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spot_ilk_pip_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.spot_ilk_pip_id_seq OWNED BY maker.spot_ilk_pip.id;


--
-- Name: spot_par; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.spot_par (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    par numeric NOT NULL
);


--
-- Name: spot_par_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.spot_par_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spot_par_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.spot_par_id_seq OWNED BY maker.spot_par.id;


--
-- Name: spot_poke; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.spot_poke (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    value numeric,
    spot numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: spot_poke_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.spot_poke_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spot_poke_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.spot_poke_id_seq OWNED BY maker.spot_poke.id;


--
-- Name: spot_vat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.spot_vat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    vat text
);


--
-- Name: spot_vat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.spot_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spot_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.spot_vat_id_seq OWNED BY maker.spot_vat.id;


--
-- Name: tend; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.tend (
    id integer NOT NULL,
    header_id integer NOT NULL,
    bid_id numeric NOT NULL,
    lot numeric,
    bid numeric,
    contract_address text,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: tend_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.tend_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tend_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.tend_id_seq OWNED BY maker.tend.id;


--
-- Name: urns; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.urns (
    id integer NOT NULL,
    ilk_id integer NOT NULL,
    identifier public.citext
);


--
-- Name: TABLE urns; Type: COMMENT; Schema: maker; Owner: -
--

COMMENT ON TABLE maker.urns IS '@name raw_urns';


--
-- Name: urns_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.urns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urns_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.urns_id_seq OWNED BY maker.urns.id;


--
-- Name: vat_dai; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_dai (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    guy text,
    dai numeric NOT NULL
);


--
-- Name: vat_dai_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_dai_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_dai_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_dai_id_seq OWNED BY maker.vat_dai.id;


--
-- Name: vat_debt; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_debt (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    debt numeric NOT NULL
);


--
-- Name: vat_debt_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_debt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_debt_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_debt_id_seq OWNED BY maker.vat_debt.id;


--
-- Name: vat_file_debt_ceiling; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_file_debt_ceiling (
    id integer NOT NULL,
    header_id integer NOT NULL,
    what text,
    data numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_file_debt_ceiling_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_file_debt_ceiling_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_file_debt_ceiling_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_file_debt_ceiling_id_seq OWNED BY maker.vat_file_debt_ceiling.id;


--
-- Name: vat_file_ilk; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_file_ilk (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    what text,
    data numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_file_ilk_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_file_ilk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_file_ilk_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_file_ilk_id_seq OWNED BY maker.vat_file_ilk.id;


--
-- Name: vat_flux; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_flux (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    src text,
    dst text,
    wad numeric,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_flux_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_flux_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_flux_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_flux_id_seq OWNED BY maker.vat_flux.id;


--
-- Name: vat_fold; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_fold (
    id integer NOT NULL,
    header_id integer NOT NULL,
    urn_id integer NOT NULL,
    rate numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_fold_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_fold_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_fold_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_fold_id_seq OWNED BY maker.vat_fold.id;


--
-- Name: vat_fork; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_fork (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    src text,
    dst text,
    dink numeric,
    dart numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_fork_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_fork_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_fork_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_fork_id_seq OWNED BY maker.vat_fork.id;


--
-- Name: vat_frob; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_frob (
    id integer NOT NULL,
    header_id integer NOT NULL,
    urn_id integer NOT NULL,
    v text,
    w text,
    dink numeric,
    dart numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_frob_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_frob_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_frob_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_frob_id_seq OWNED BY maker.vat_frob.id;


--
-- Name: vat_gem; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_gem (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    guy text,
    gem numeric NOT NULL
);


--
-- Name: vat_gem_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_gem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_gem_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_gem_id_seq OWNED BY maker.vat_gem.id;


--
-- Name: vat_grab; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_grab (
    id integer NOT NULL,
    header_id integer NOT NULL,
    urn_id integer NOT NULL,
    v text,
    w text,
    dink numeric,
    dart numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_grab_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_grab_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_grab_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_grab_id_seq OWNED BY maker.vat_grab.id;


--
-- Name: vat_heal; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_heal (
    id integer NOT NULL,
    header_id integer NOT NULL,
    rad numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_heal_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_heal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_heal_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_heal_id_seq OWNED BY maker.vat_heal.id;


--
-- Name: vat_ilk_art; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_ilk_art (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    art numeric NOT NULL
);


--
-- Name: vat_ilk_art_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_ilk_art_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_ilk_art_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_ilk_art_id_seq OWNED BY maker.vat_ilk_art.id;


--
-- Name: vat_ilk_dust; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_ilk_dust (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    dust numeric NOT NULL
);


--
-- Name: vat_ilk_dust_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_ilk_dust_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_ilk_dust_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_ilk_dust_id_seq OWNED BY maker.vat_ilk_dust.id;


--
-- Name: vat_ilk_line; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_ilk_line (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    line numeric NOT NULL
);


--
-- Name: vat_ilk_line_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_ilk_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_ilk_line_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_ilk_line_id_seq OWNED BY maker.vat_ilk_line.id;


--
-- Name: vat_ilk_rate; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_ilk_rate (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    rate numeric NOT NULL
);


--
-- Name: vat_ilk_rate_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_ilk_rate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_ilk_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_ilk_rate_id_seq OWNED BY maker.vat_ilk_rate.id;


--
-- Name: vat_ilk_spot; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_ilk_spot (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ilk_id integer NOT NULL,
    spot numeric NOT NULL
);


--
-- Name: vat_ilk_spot_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_ilk_spot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_ilk_spot_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_ilk_spot_id_seq OWNED BY maker.vat_ilk_spot.id;


--
-- Name: vat_init; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_init (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_init_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_init_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_init_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_init_id_seq OWNED BY maker.vat_init.id;


--
-- Name: vat_line; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_line (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    line numeric NOT NULL
);


--
-- Name: vat_line_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_line_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_line_id_seq OWNED BY maker.vat_line.id;


--
-- Name: vat_live; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_live (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    live numeric NOT NULL
);


--
-- Name: vat_live_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_live_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_live_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_live_id_seq OWNED BY maker.vat_live.id;


--
-- Name: vat_move; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_move (
    id integer NOT NULL,
    header_id integer NOT NULL,
    src text NOT NULL,
    dst text NOT NULL,
    rad numeric NOT NULL,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_move_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_move_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_move_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_move_id_seq OWNED BY maker.vat_move.id;


--
-- Name: vat_sin; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_sin (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    guy text,
    sin numeric NOT NULL
);


--
-- Name: vat_sin_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_sin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_sin_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_sin_id_seq OWNED BY maker.vat_sin.id;


--
-- Name: vat_slip; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_slip (
    id integer NOT NULL,
    header_id integer NOT NULL,
    ilk_id integer NOT NULL,
    usr text,
    wad numeric,
    tx_idx integer NOT NULL,
    log_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_slip_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_slip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_slip_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_slip_id_seq OWNED BY maker.vat_slip.id;


--
-- Name: vat_suck; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_suck (
    id integer NOT NULL,
    header_id integer NOT NULL,
    u text,
    v text,
    rad numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vat_suck_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_suck_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_suck_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_suck_id_seq OWNED BY maker.vat_suck.id;


--
-- Name: vat_urn_art; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_urn_art (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    urn_id integer NOT NULL,
    art numeric NOT NULL
);


--
-- Name: vat_urn_art_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_urn_art_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_urn_art_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_urn_art_id_seq OWNED BY maker.vat_urn_art.id;


--
-- Name: vat_urn_ink; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_urn_ink (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    urn_id integer NOT NULL,
    ink numeric NOT NULL
);


--
-- Name: vat_urn_ink_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_urn_ink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_urn_ink_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_urn_ink_id_seq OWNED BY maker.vat_urn_ink.id;


--
-- Name: vat_vice; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vat_vice (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    vice numeric NOT NULL
);


--
-- Name: vat_vice_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vat_vice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_vice_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vat_vice_id_seq OWNED BY maker.vat_vice.id;


--
-- Name: vow_ash; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_ash (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    ash numeric
);


--
-- Name: vow_ash_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_ash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_ash_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_ash_id_seq OWNED BY maker.vow_ash.id;


--
-- Name: vow_bump; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_bump (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    bump numeric
);


--
-- Name: vow_bump_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_bump_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_bump_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_bump_id_seq OWNED BY maker.vow_bump.id;


--
-- Name: vow_fess; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_fess (
    id integer NOT NULL,
    header_id integer NOT NULL,
    tab numeric NOT NULL,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vow_fess_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_fess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_fess_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_fess_id_seq OWNED BY maker.vow_fess.id;


--
-- Name: vow_file; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_file (
    id integer NOT NULL,
    header_id integer NOT NULL,
    what text,
    data numeric,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vow_file_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_file_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_file_id_seq OWNED BY maker.vow_file.id;


--
-- Name: vow_flapper; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_flapper (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    flapper text
);


--
-- Name: vow_flapper_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_flapper_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_flapper_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_flapper_id_seq OWNED BY maker.vow_flapper.id;


--
-- Name: vow_flog; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_flog (
    id integer NOT NULL,
    header_id integer NOT NULL,
    era integer NOT NULL,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: vow_flog_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_flog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_flog_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_flog_id_seq OWNED BY maker.vow_flog.id;


--
-- Name: vow_flopper; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_flopper (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    flopper text
);


--
-- Name: vow_flopper_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_flopper_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_flopper_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_flopper_id_seq OWNED BY maker.vow_flopper.id;


--
-- Name: vow_hump; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_hump (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    hump numeric
);


--
-- Name: vow_hump_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_hump_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_hump_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_hump_id_seq OWNED BY maker.vow_hump.id;


--
-- Name: vow_sin_integer; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_sin_integer (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    sin numeric
);


--
-- Name: vow_sin_integer_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_sin_integer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_sin_integer_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_sin_integer_id_seq OWNED BY maker.vow_sin_integer.id;


--
-- Name: vow_sin_mapping; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_sin_mapping (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    era numeric,
    tab numeric
);


--
-- Name: vow_sin_mapping_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_sin_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_sin_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_sin_mapping_id_seq OWNED BY maker.vow_sin_mapping.id;


--
-- Name: vow_sump; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_sump (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    sump numeric
);


--
-- Name: vow_sump_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_sump_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_sump_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_sump_id_seq OWNED BY maker.vow_sump.id;


--
-- Name: vow_vat; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_vat (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    vat text
);


--
-- Name: vow_vat_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_vat_id_seq OWNED BY maker.vow_vat.id;


--
-- Name: vow_wait; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.vow_wait (
    id integer NOT NULL,
    block_number bigint,
    block_hash text,
    wait numeric
);


--
-- Name: vow_wait_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.vow_wait_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vow_wait_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.vow_wait_id_seq OWNED BY maker.vow_wait.id;


--
-- Name: yank; Type: TABLE; Schema: maker; Owner: -
--

CREATE TABLE maker.yank (
    id integer NOT NULL,
    header_id integer NOT NULL,
    bid_id numeric NOT NULL,
    contract_address text,
    log_idx integer NOT NULL,
    tx_idx integer NOT NULL,
    raw_log jsonb
);


--
-- Name: yank_id_seq; Type: SEQUENCE; Schema: maker; Owner: -
--

CREATE SEQUENCE maker.yank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: yank_id_seq; Type: SEQUENCE OWNED BY; Schema: maker; Owner: -
--

ALTER SEQUENCE maker.yank_id_seq OWNED BY maker.yank.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    block_number bigint,
    address character varying(66),
    tx_hash character varying(66),
    index bigint,
    topic0 character varying(66),
    topic1 character varying(66),
    topic2 character varying(66),
    topic3 character varying(66),
    data text,
    receipt_id integer
);


--
-- Name: block_stats; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.block_stats AS
 SELECT max(logs.block_number) AS max_block,
    min(logs.block_number) AS min_block
   FROM public.logs;


--
-- Name: blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blocks (
    id integer NOT NULL,
    difficulty bigint,
    extra_data character varying,
    gas_limit bigint,
    gas_used bigint,
    hash character varying(66),
    miner character varying(42),
    nonce character varying(20),
    number bigint,
    parent_hash character varying(66),
    reward numeric,
    uncles_reward numeric,
    size character varying,
    "time" bigint,
    is_final boolean,
    uncle_hash character varying(66),
    eth_node_id integer NOT NULL,
    eth_node_fingerprint character varying(128) NOT NULL
);


--
-- Name: blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blocks_id_seq OWNED BY public.blocks.id;


--
-- Name: checked_headers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.checked_headers (
    id integer NOT NULL,
    header_id integer NOT NULL,
    flip_kick integer DEFAULT 0 NOT NULL,
    vat_frob integer DEFAULT 0 NOT NULL,
    tend integer DEFAULT 0 NOT NULL,
    bite integer DEFAULT 0 NOT NULL,
    dent integer DEFAULT 0 NOT NULL,
    vat_file_debt_ceiling integer DEFAULT 0 NOT NULL,
    vat_file_ilk integer DEFAULT 0 NOT NULL,
    vat_init integer DEFAULT 0 NOT NULL,
    jug_file_base integer DEFAULT 0 NOT NULL,
    jug_file_ilk integer DEFAULT 0 NOT NULL,
    jug_file_vow integer DEFAULT 0 NOT NULL,
    deal integer DEFAULT 0 NOT NULL,
    jug_drip integer DEFAULT 0 NOT NULL,
    cat_file_chop_lump integer DEFAULT 0 NOT NULL,
    cat_file_flip integer DEFAULT 0 NOT NULL,
    cat_file_vow integer DEFAULT 0 NOT NULL,
    flop_kick integer DEFAULT 0 NOT NULL,
    vat_move integer DEFAULT 0 NOT NULL,
    vat_fold integer DEFAULT 0 NOT NULL,
    vat_heal integer DEFAULT 0 NOT NULL,
    vat_grab integer DEFAULT 0 NOT NULL,
    vat_flux integer DEFAULT 0 NOT NULL,
    vat_slip integer DEFAULT 0 NOT NULL,
    vow_flog integer DEFAULT 0 NOT NULL,
    flap_kick integer DEFAULT 0 NOT NULL,
    vow_fess integer DEFAULT 0 NOT NULL,
    spot_file_mat integer DEFAULT 0 NOT NULL,
    spot_file_pip integer DEFAULT 0 NOT NULL,
    spot_poke integer DEFAULT 0 NOT NULL,
    vow_file integer DEFAULT 0 NOT NULL,
    vat_suck integer DEFAULT 0 NOT NULL,
    vat_fork integer DEFAULT 0 NOT NULL,
    jug_init integer DEFAULT 0 NOT NULL,
    yank integer DEFAULT 0 NOT NULL,
    flip_tick integer DEFAULT 0 NOT NULL
);


--
-- Name: checked_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.checked_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: checked_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.checked_headers_id_seq OWNED BY public.checked_headers.id;


--
-- Name: eth_nodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eth_nodes (
    id integer NOT NULL,
    client_name character varying,
    genesis_block character varying(66),
    network_id numeric,
    eth_node_id character varying(128)
);


--
-- Name: full_sync_receipts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.full_sync_receipts (
    id integer NOT NULL,
    contract_address character varying(42),
    cumulative_gas_used numeric,
    gas_used numeric,
    state_root character varying(66),
    status integer,
    tx_hash character varying(66),
    block_id integer NOT NULL
);


--
-- Name: full_sync_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.full_sync_receipts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: full_sync_receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.full_sync_receipts_id_seq OWNED BY public.full_sync_receipts.id;


--
-- Name: full_sync_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.full_sync_transactions (
    id integer NOT NULL,
    block_id integer NOT NULL,
    gas_limit numeric,
    gas_price numeric,
    hash character varying(66),
    input_data bytea,
    nonce numeric,
    raw bytea,
    tx_from character varying(66),
    tx_index integer,
    tx_to character varying(66),
    value numeric
);


--
-- Name: full_sync_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.full_sync_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: full_sync_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.full_sync_transactions_id_seq OWNED BY public.full_sync_transactions.id;


--
-- Name: goose_db_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goose_db_version (
    id integer NOT NULL,
    version_id bigint NOT NULL,
    is_applied boolean NOT NULL,
    tstamp timestamp without time zone DEFAULT now()
);


--
-- Name: goose_db_version_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.goose_db_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: goose_db_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.goose_db_version_id_seq OWNED BY public.goose_db_version.id;


--
-- Name: header_sync_receipts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.header_sync_receipts (
    id integer NOT NULL,
    transaction_id integer NOT NULL,
    header_id integer NOT NULL,
    contract_address character varying(42),
    cumulative_gas_used numeric,
    gas_used numeric,
    state_root character varying(66),
    status integer,
    tx_hash character varying(66),
    rlp bytea
);


--
-- Name: header_sync_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.header_sync_receipts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_sync_receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.header_sync_receipts_id_seq OWNED BY public.header_sync_receipts.id;


--
-- Name: header_sync_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.header_sync_transactions (
    id integer NOT NULL,
    header_id integer NOT NULL,
    hash character varying(66),
    gas_limit numeric,
    gas_price numeric,
    input_data bytea,
    nonce numeric,
    raw bytea,
    tx_from character varying(44),
    tx_index integer,
    tx_to character varying(44),
    value numeric
);


--
-- Name: header_sync_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.header_sync_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_sync_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.header_sync_transactions_id_seq OWNED BY public.header_sync_transactions.id;


--
-- Name: headers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.headers (
    id integer NOT NULL,
    hash character varying(66),
    block_number bigint,
    raw jsonb,
    block_timestamp numeric,
    eth_node_id integer NOT NULL,
    eth_node_fingerprint character varying(128)
);


--
-- Name: headers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.headers_id_seq OWNED BY public.headers.id;


--
-- Name: log_filters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.log_filters (
    id integer NOT NULL,
    name character varying NOT NULL,
    from_block bigint,
    to_block bigint,
    address character varying(66),
    topic0 character varying(66),
    topic1 character varying(66),
    topic2 character varying(66),
    topic3 character varying(66),
    CONSTRAINT log_filters_from_block_check CHECK ((from_block >= 0)),
    CONSTRAINT log_filters_name_check CHECK (((name)::text <> ''::text)),
    CONSTRAINT log_filters_to_block_check CHECK ((to_block >= 0))
);


--
-- Name: log_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.log_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: log_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.log_filters_id_seq OWNED BY public.log_filters.id;


--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nodes_id_seq OWNED BY public.eth_nodes.id;


--
-- Name: queued_storage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.queued_storage (
    id integer NOT NULL,
    block_height bigint,
    block_hash bytea,
    contract bytea,
    storage_key bytea,
    storage_value bytea
);


--
-- Name: queued_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.queued_storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: queued_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.queued_storage_id_seq OWNED BY public.queued_storage.id;


--
-- Name: uncles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.uncles (
    id integer NOT NULL,
    hash character varying(66) NOT NULL,
    block_id integer NOT NULL,
    reward numeric NOT NULL,
    miner character varying(42) NOT NULL,
    raw jsonb,
    block_timestamp numeric,
    eth_node_id integer NOT NULL,
    eth_node_fingerprint character varying(128)
);


--
-- Name: uncles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.uncles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uncles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.uncles_id_seq OWNED BY public.uncles.id;


--
-- Name: watched_contracts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.watched_contracts (
    contract_id integer NOT NULL,
    contract_abi json,
    contract_hash character varying(66)
);


--
-- Name: watched_contracts_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.watched_contracts_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: watched_contracts_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.watched_contracts_contract_id_seq OWNED BY public.watched_contracts.contract_id;


--
-- Name: watched_event_logs; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.watched_event_logs AS
 SELECT log_filters.name,
    logs.id,
    logs.block_number,
    logs.address,
    logs.tx_hash,
    logs.index,
    logs.topic0,
    logs.topic1,
    logs.topic2,
    logs.topic3,
    logs.data,
    logs.receipt_id
   FROM ((public.log_filters
     CROSS JOIN public.block_stats)
     JOIN public.logs ON ((((logs.address)::text = (log_filters.address)::text) AND (logs.block_number >= COALESCE(log_filters.from_block, block_stats.min_block)) AND (logs.block_number <= COALESCE(log_filters.to_block, block_stats.max_block)))))
  WHERE ((((log_filters.topic0)::text = (logs.topic0)::text) OR (log_filters.topic0 IS NULL)) AND (((log_filters.topic1)::text = (logs.topic1)::text) OR (log_filters.topic1 IS NULL)) AND (((log_filters.topic2)::text = (logs.topic2)::text) OR (log_filters.topic2 IS NULL)) AND (((log_filters.topic3)::text = (logs.topic3)::text) OR (log_filters.topic3 IS NULL)));


--
-- Name: bite id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.bite ALTER COLUMN id SET DEFAULT nextval('maker.bite_id_seq'::regclass);


--
-- Name: cat_file_chop_lump id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_chop_lump ALTER COLUMN id SET DEFAULT nextval('maker.cat_file_chop_lump_id_seq'::regclass);


--
-- Name: cat_file_flip id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_flip ALTER COLUMN id SET DEFAULT nextval('maker.cat_file_flip_id_seq'::regclass);


--
-- Name: cat_file_vow id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_vow ALTER COLUMN id SET DEFAULT nextval('maker.cat_file_vow_id_seq'::regclass);


--
-- Name: cat_ilk_chop id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_chop ALTER COLUMN id SET DEFAULT nextval('maker.cat_ilk_chop_id_seq'::regclass);


--
-- Name: cat_ilk_flip id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_flip ALTER COLUMN id SET DEFAULT nextval('maker.cat_ilk_flip_id_seq'::regclass);


--
-- Name: cat_ilk_lump id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_lump ALTER COLUMN id SET DEFAULT nextval('maker.cat_ilk_lump_id_seq'::regclass);


--
-- Name: cat_live id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_live ALTER COLUMN id SET DEFAULT nextval('maker.cat_live_id_seq'::regclass);


--
-- Name: cat_vat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_vat ALTER COLUMN id SET DEFAULT nextval('maker.cat_vat_id_seq'::regclass);


--
-- Name: cat_vow id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_vow ALTER COLUMN id SET DEFAULT nextval('maker.cat_vow_id_seq'::regclass);


--
-- Name: cdp_manager_cdpi id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_cdpi ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_cdpi_id_seq'::regclass);


--
-- Name: cdp_manager_count id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_count ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_count_id_seq'::regclass);


--
-- Name: cdp_manager_first id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_first ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_first_id_seq'::regclass);


--
-- Name: cdp_manager_ilks id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_ilks ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_ilks_id_seq'::regclass);


--
-- Name: cdp_manager_last id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_last ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_last_id_seq'::regclass);


--
-- Name: cdp_manager_list_next id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_list_next ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_list_next_id_seq'::regclass);


--
-- Name: cdp_manager_list_prev id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_list_prev ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_list_prev_id_seq'::regclass);


--
-- Name: cdp_manager_owns id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_owns ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_owns_id_seq'::regclass);


--
-- Name: cdp_manager_urns id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_urns ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_urns_id_seq'::regclass);


--
-- Name: cdp_manager_vat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_vat ALTER COLUMN id SET DEFAULT nextval('maker.cdp_manager_vat_id_seq'::regclass);


--
-- Name: deal id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.deal ALTER COLUMN id SET DEFAULT nextval('maker.deal_id_seq'::regclass);


--
-- Name: dent id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.dent ALTER COLUMN id SET DEFAULT nextval('maker.dent_id_seq'::regclass);


--
-- Name: flap_beg id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_beg ALTER COLUMN id SET DEFAULT nextval('maker.flap_beg_id_seq'::regclass);


--
-- Name: flap_bid_bid id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_bid ALTER COLUMN id SET DEFAULT nextval('maker.flap_bid_bid_id_seq'::regclass);


--
-- Name: flap_bid_end id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_end ALTER COLUMN id SET DEFAULT nextval('maker.flap_bid_end_id_seq'::regclass);


--
-- Name: flap_bid_gal id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_gal ALTER COLUMN id SET DEFAULT nextval('maker.flap_bid_gal_id_seq'::regclass);


--
-- Name: flap_bid_guy id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_guy ALTER COLUMN id SET DEFAULT nextval('maker.flap_bid_guy_id_seq'::regclass);


--
-- Name: flap_bid_lot id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_lot ALTER COLUMN id SET DEFAULT nextval('maker.flap_bid_lot_id_seq'::regclass);


--
-- Name: flap_bid_tic id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_tic ALTER COLUMN id SET DEFAULT nextval('maker.flap_bid_tic_id_seq'::regclass);


--
-- Name: flap_gem id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_gem ALTER COLUMN id SET DEFAULT nextval('maker.flap_gem_id_seq'::regclass);


--
-- Name: flap_kick id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_kick ALTER COLUMN id SET DEFAULT nextval('maker.flap_kick_id_seq'::regclass);


--
-- Name: flap_kicks id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_kicks ALTER COLUMN id SET DEFAULT nextval('maker.flap_kicks_id_seq'::regclass);


--
-- Name: flap_live id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_live ALTER COLUMN id SET DEFAULT nextval('maker.flap_live_id_seq'::regclass);


--
-- Name: flap_tau id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_tau ALTER COLUMN id SET DEFAULT nextval('maker.flap_tau_id_seq'::regclass);


--
-- Name: flap_ttl id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_ttl ALTER COLUMN id SET DEFAULT nextval('maker.flap_ttl_id_seq'::regclass);


--
-- Name: flap_vat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_vat ALTER COLUMN id SET DEFAULT nextval('maker.flap_vat_id_seq'::regclass);


--
-- Name: flip_beg id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_beg ALTER COLUMN id SET DEFAULT nextval('maker.flip_beg_id_seq'::regclass);


--
-- Name: flip_bid_bid id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_bid ALTER COLUMN id SET DEFAULT nextval('maker.flip_bid_bid_id_seq'::regclass);


--
-- Name: flip_bid_end id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_end ALTER COLUMN id SET DEFAULT nextval('maker.flip_bid_end_id_seq'::regclass);


--
-- Name: flip_bid_gal id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_gal ALTER COLUMN id SET DEFAULT nextval('maker.flip_bid_gal_id_seq'::regclass);


--
-- Name: flip_bid_guy id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_guy ALTER COLUMN id SET DEFAULT nextval('maker.flip_bid_guy_id_seq'::regclass);


--
-- Name: flip_bid_lot id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_lot ALTER COLUMN id SET DEFAULT nextval('maker.flip_bid_lot_id_seq'::regclass);


--
-- Name: flip_bid_tab id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_tab ALTER COLUMN id SET DEFAULT nextval('maker.flip_bid_tab_id_seq'::regclass);


--
-- Name: flip_bid_tic id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_tic ALTER COLUMN id SET DEFAULT nextval('maker.flip_bid_tic_id_seq'::regclass);


--
-- Name: flip_bid_usr id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_usr ALTER COLUMN id SET DEFAULT nextval('maker.flip_bid_usr_id_seq'::regclass);


--
-- Name: flip_ilk id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_ilk ALTER COLUMN id SET DEFAULT nextval('maker.flip_ilk_id_seq'::regclass);


--
-- Name: flip_kick id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_kick ALTER COLUMN id SET DEFAULT nextval('maker.flip_kick_id_seq'::regclass);


--
-- Name: flip_kicks id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_kicks ALTER COLUMN id SET DEFAULT nextval('maker.flip_kicks_id_seq'::regclass);


--
-- Name: flip_tau id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_tau ALTER COLUMN id SET DEFAULT nextval('maker.flip_tau_id_seq'::regclass);


--
-- Name: flip_tick id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_tick ALTER COLUMN id SET DEFAULT nextval('maker.flip_tick_id_seq'::regclass);


--
-- Name: flip_ttl id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_ttl ALTER COLUMN id SET DEFAULT nextval('maker.flip_ttl_id_seq'::regclass);


--
-- Name: flip_vat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_vat ALTER COLUMN id SET DEFAULT nextval('maker.flip_vat_id_seq'::regclass);


--
-- Name: flop_beg id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_beg ALTER COLUMN id SET DEFAULT nextval('maker.flop_beg_id_seq'::regclass);


--
-- Name: flop_bid_bid id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_bid ALTER COLUMN id SET DEFAULT nextval('maker.flop_bid_bid_id_seq'::regclass);


--
-- Name: flop_bid_end id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_end ALTER COLUMN id SET DEFAULT nextval('maker.flop_bid_end_id_seq'::regclass);


--
-- Name: flop_bid_guy id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_guy ALTER COLUMN id SET DEFAULT nextval('maker.flop_bid_guy_id_seq'::regclass);


--
-- Name: flop_bid_lot id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_lot ALTER COLUMN id SET DEFAULT nextval('maker.flop_bid_lot_id_seq'::regclass);


--
-- Name: flop_bid_tic id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_tic ALTER COLUMN id SET DEFAULT nextval('maker.flop_bid_tic_id_seq'::regclass);


--
-- Name: flop_gem id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_gem ALTER COLUMN id SET DEFAULT nextval('maker.flop_gem_id_seq'::regclass);


--
-- Name: flop_kick id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_kick ALTER COLUMN id SET DEFAULT nextval('maker.flop_kick_id_seq'::regclass);


--
-- Name: flop_kicks id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_kicks ALTER COLUMN id SET DEFAULT nextval('maker.flop_kicks_id_seq'::regclass);


--
-- Name: flop_live id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_live ALTER COLUMN id SET DEFAULT nextval('maker.flop_live_id_seq'::regclass);


--
-- Name: flop_tau id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_tau ALTER COLUMN id SET DEFAULT nextval('maker.flop_tau_id_seq'::regclass);


--
-- Name: flop_ttl id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_ttl ALTER COLUMN id SET DEFAULT nextval('maker.flop_ttl_id_seq'::regclass);


--
-- Name: flop_vat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_vat ALTER COLUMN id SET DEFAULT nextval('maker.flop_vat_id_seq'::regclass);


--
-- Name: ilks id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.ilks ALTER COLUMN id SET DEFAULT nextval('maker.ilks_id_seq'::regclass);


--
-- Name: jug_base id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_base ALTER COLUMN id SET DEFAULT nextval('maker.jug_base_id_seq'::regclass);


--
-- Name: jug_drip id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_drip ALTER COLUMN id SET DEFAULT nextval('maker.jug_drip_id_seq'::regclass);


--
-- Name: jug_file_base id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_base ALTER COLUMN id SET DEFAULT nextval('maker.jug_file_base_id_seq'::regclass);


--
-- Name: jug_file_ilk id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_ilk ALTER COLUMN id SET DEFAULT nextval('maker.jug_file_ilk_id_seq'::regclass);


--
-- Name: jug_file_vow id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_vow ALTER COLUMN id SET DEFAULT nextval('maker.jug_file_vow_id_seq'::regclass);


--
-- Name: jug_ilk_duty id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_ilk_duty ALTER COLUMN id SET DEFAULT nextval('maker.jug_ilk_duty_id_seq'::regclass);


--
-- Name: jug_ilk_rho id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_ilk_rho ALTER COLUMN id SET DEFAULT nextval('maker.jug_ilk_rho_id_seq'::regclass);


--
-- Name: jug_init id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_init ALTER COLUMN id SET DEFAULT nextval('maker.jug_init_id_seq'::regclass);


--
-- Name: jug_vat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_vat ALTER COLUMN id SET DEFAULT nextval('maker.jug_vat_id_seq'::regclass);


--
-- Name: jug_vow id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_vow ALTER COLUMN id SET DEFAULT nextval('maker.jug_vow_id_seq'::regclass);


--
-- Name: spot_file_mat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_mat ALTER COLUMN id SET DEFAULT nextval('maker.spot_file_mat_id_seq'::regclass);


--
-- Name: spot_file_pip id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_pip ALTER COLUMN id SET DEFAULT nextval('maker.spot_file_pip_id_seq'::regclass);


--
-- Name: spot_ilk_mat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_ilk_mat ALTER COLUMN id SET DEFAULT nextval('maker.spot_ilk_mat_id_seq'::regclass);


--
-- Name: spot_ilk_pip id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_ilk_pip ALTER COLUMN id SET DEFAULT nextval('maker.spot_ilk_pip_id_seq'::regclass);


--
-- Name: spot_par id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_par ALTER COLUMN id SET DEFAULT nextval('maker.spot_par_id_seq'::regclass);


--
-- Name: spot_poke id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_poke ALTER COLUMN id SET DEFAULT nextval('maker.spot_poke_id_seq'::regclass);


--
-- Name: spot_vat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_vat ALTER COLUMN id SET DEFAULT nextval('maker.spot_vat_id_seq'::regclass);


--
-- Name: tend id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.tend ALTER COLUMN id SET DEFAULT nextval('maker.tend_id_seq'::regclass);


--
-- Name: urns id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.urns ALTER COLUMN id SET DEFAULT nextval('maker.urns_id_seq'::regclass);


--
-- Name: vat_dai id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_dai ALTER COLUMN id SET DEFAULT nextval('maker.vat_dai_id_seq'::regclass);


--
-- Name: vat_debt id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_debt ALTER COLUMN id SET DEFAULT nextval('maker.vat_debt_id_seq'::regclass);


--
-- Name: vat_file_debt_ceiling id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_debt_ceiling ALTER COLUMN id SET DEFAULT nextval('maker.vat_file_debt_ceiling_id_seq'::regclass);


--
-- Name: vat_file_ilk id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_ilk ALTER COLUMN id SET DEFAULT nextval('maker.vat_file_ilk_id_seq'::regclass);


--
-- Name: vat_flux id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_flux ALTER COLUMN id SET DEFAULT nextval('maker.vat_flux_id_seq'::regclass);


--
-- Name: vat_fold id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fold ALTER COLUMN id SET DEFAULT nextval('maker.vat_fold_id_seq'::regclass);


--
-- Name: vat_fork id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fork ALTER COLUMN id SET DEFAULT nextval('maker.vat_fork_id_seq'::regclass);


--
-- Name: vat_frob id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_frob ALTER COLUMN id SET DEFAULT nextval('maker.vat_frob_id_seq'::regclass);


--
-- Name: vat_gem id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_gem ALTER COLUMN id SET DEFAULT nextval('maker.vat_gem_id_seq'::regclass);


--
-- Name: vat_grab id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_grab ALTER COLUMN id SET DEFAULT nextval('maker.vat_grab_id_seq'::regclass);


--
-- Name: vat_heal id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_heal ALTER COLUMN id SET DEFAULT nextval('maker.vat_heal_id_seq'::regclass);


--
-- Name: vat_ilk_art id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_art ALTER COLUMN id SET DEFAULT nextval('maker.vat_ilk_art_id_seq'::regclass);


--
-- Name: vat_ilk_dust id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_dust ALTER COLUMN id SET DEFAULT nextval('maker.vat_ilk_dust_id_seq'::regclass);


--
-- Name: vat_ilk_line id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_line ALTER COLUMN id SET DEFAULT nextval('maker.vat_ilk_line_id_seq'::regclass);


--
-- Name: vat_ilk_rate id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_rate ALTER COLUMN id SET DEFAULT nextval('maker.vat_ilk_rate_id_seq'::regclass);


--
-- Name: vat_ilk_spot id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_spot ALTER COLUMN id SET DEFAULT nextval('maker.vat_ilk_spot_id_seq'::regclass);


--
-- Name: vat_init id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_init ALTER COLUMN id SET DEFAULT nextval('maker.vat_init_id_seq'::regclass);


--
-- Name: vat_line id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_line ALTER COLUMN id SET DEFAULT nextval('maker.vat_line_id_seq'::regclass);


--
-- Name: vat_live id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_live ALTER COLUMN id SET DEFAULT nextval('maker.vat_live_id_seq'::regclass);


--
-- Name: vat_move id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_move ALTER COLUMN id SET DEFAULT nextval('maker.vat_move_id_seq'::regclass);


--
-- Name: vat_sin id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_sin ALTER COLUMN id SET DEFAULT nextval('maker.vat_sin_id_seq'::regclass);


--
-- Name: vat_slip id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_slip ALTER COLUMN id SET DEFAULT nextval('maker.vat_slip_id_seq'::regclass);


--
-- Name: vat_suck id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_suck ALTER COLUMN id SET DEFAULT nextval('maker.vat_suck_id_seq'::regclass);


--
-- Name: vat_urn_art id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_urn_art ALTER COLUMN id SET DEFAULT nextval('maker.vat_urn_art_id_seq'::regclass);


--
-- Name: vat_urn_ink id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_urn_ink ALTER COLUMN id SET DEFAULT nextval('maker.vat_urn_ink_id_seq'::regclass);


--
-- Name: vat_vice id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_vice ALTER COLUMN id SET DEFAULT nextval('maker.vat_vice_id_seq'::regclass);


--
-- Name: vow_ash id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_ash ALTER COLUMN id SET DEFAULT nextval('maker.vow_ash_id_seq'::regclass);


--
-- Name: vow_bump id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_bump ALTER COLUMN id SET DEFAULT nextval('maker.vow_bump_id_seq'::regclass);


--
-- Name: vow_fess id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_fess ALTER COLUMN id SET DEFAULT nextval('maker.vow_fess_id_seq'::regclass);


--
-- Name: vow_file id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_file ALTER COLUMN id SET DEFAULT nextval('maker.vow_file_id_seq'::regclass);


--
-- Name: vow_flapper id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flapper ALTER COLUMN id SET DEFAULT nextval('maker.vow_flapper_id_seq'::regclass);


--
-- Name: vow_flog id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flog ALTER COLUMN id SET DEFAULT nextval('maker.vow_flog_id_seq'::regclass);


--
-- Name: vow_flopper id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flopper ALTER COLUMN id SET DEFAULT nextval('maker.vow_flopper_id_seq'::regclass);


--
-- Name: vow_hump id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_hump ALTER COLUMN id SET DEFAULT nextval('maker.vow_hump_id_seq'::regclass);


--
-- Name: vow_sin_integer id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sin_integer ALTER COLUMN id SET DEFAULT nextval('maker.vow_sin_integer_id_seq'::regclass);


--
-- Name: vow_sin_mapping id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sin_mapping ALTER COLUMN id SET DEFAULT nextval('maker.vow_sin_mapping_id_seq'::regclass);


--
-- Name: vow_sump id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sump ALTER COLUMN id SET DEFAULT nextval('maker.vow_sump_id_seq'::regclass);


--
-- Name: vow_vat id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_vat ALTER COLUMN id SET DEFAULT nextval('maker.vow_vat_id_seq'::regclass);


--
-- Name: vow_wait id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_wait ALTER COLUMN id SET DEFAULT nextval('maker.vow_wait_id_seq'::regclass);


--
-- Name: yank id; Type: DEFAULT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.yank ALTER COLUMN id SET DEFAULT nextval('maker.yank_id_seq'::regclass);


--
-- Name: blocks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocks ALTER COLUMN id SET DEFAULT nextval('public.blocks_id_seq'::regclass);


--
-- Name: checked_headers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.checked_headers ALTER COLUMN id SET DEFAULT nextval('public.checked_headers_id_seq'::regclass);


--
-- Name: eth_nodes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eth_nodes ALTER COLUMN id SET DEFAULT nextval('public.nodes_id_seq'::regclass);


--
-- Name: full_sync_receipts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.full_sync_receipts ALTER COLUMN id SET DEFAULT nextval('public.full_sync_receipts_id_seq'::regclass);


--
-- Name: full_sync_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.full_sync_transactions ALTER COLUMN id SET DEFAULT nextval('public.full_sync_transactions_id_seq'::regclass);


--
-- Name: goose_db_version id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goose_db_version ALTER COLUMN id SET DEFAULT nextval('public.goose_db_version_id_seq'::regclass);


--
-- Name: header_sync_receipts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_receipts ALTER COLUMN id SET DEFAULT nextval('public.header_sync_receipts_id_seq'::regclass);


--
-- Name: header_sync_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_transactions ALTER COLUMN id SET DEFAULT nextval('public.header_sync_transactions_id_seq'::regclass);


--
-- Name: headers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.headers ALTER COLUMN id SET DEFAULT nextval('public.headers_id_seq'::regclass);


--
-- Name: log_filters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.log_filters ALTER COLUMN id SET DEFAULT nextval('public.log_filters_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: queued_storage id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queued_storage ALTER COLUMN id SET DEFAULT nextval('public.queued_storage_id_seq'::regclass);


--
-- Name: uncles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uncles ALTER COLUMN id SET DEFAULT nextval('public.uncles_id_seq'::regclass);


--
-- Name: watched_contracts contract_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watched_contracts ALTER COLUMN contract_id SET DEFAULT nextval('public.watched_contracts_contract_id_seq'::regclass);


--
-- Name: bite bite_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.bite
    ADD CONSTRAINT bite_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: bite bite_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.bite
    ADD CONSTRAINT bite_pkey PRIMARY KEY (id);


--
-- Name: cat_file_chop_lump cat_file_chop_lump_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_chop_lump
    ADD CONSTRAINT cat_file_chop_lump_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: cat_file_chop_lump cat_file_chop_lump_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_chop_lump
    ADD CONSTRAINT cat_file_chop_lump_pkey PRIMARY KEY (id);


--
-- Name: cat_file_flip cat_file_flip_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_flip
    ADD CONSTRAINT cat_file_flip_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: cat_file_flip cat_file_flip_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_flip
    ADD CONSTRAINT cat_file_flip_pkey PRIMARY KEY (id);


--
-- Name: cat_file_vow cat_file_vow_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_vow
    ADD CONSTRAINT cat_file_vow_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: cat_file_vow cat_file_vow_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_vow
    ADD CONSTRAINT cat_file_vow_pkey PRIMARY KEY (id);


--
-- Name: cat_ilk_chop cat_ilk_chop_block_number_block_hash_ilk_id_chop_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_chop
    ADD CONSTRAINT cat_ilk_chop_block_number_block_hash_ilk_id_chop_key UNIQUE (block_number, block_hash, ilk_id, chop);


--
-- Name: cat_ilk_chop cat_ilk_chop_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_chop
    ADD CONSTRAINT cat_ilk_chop_pkey PRIMARY KEY (id);


--
-- Name: cat_ilk_flip cat_ilk_flip_block_number_block_hash_ilk_id_flip_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_flip
    ADD CONSTRAINT cat_ilk_flip_block_number_block_hash_ilk_id_flip_key UNIQUE (block_number, block_hash, ilk_id, flip);


--
-- Name: cat_ilk_flip cat_ilk_flip_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_flip
    ADD CONSTRAINT cat_ilk_flip_pkey PRIMARY KEY (id);


--
-- Name: cat_ilk_lump cat_ilk_lump_block_number_block_hash_ilk_id_lump_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_lump
    ADD CONSTRAINT cat_ilk_lump_block_number_block_hash_ilk_id_lump_key UNIQUE (block_number, block_hash, ilk_id, lump);


--
-- Name: cat_ilk_lump cat_ilk_lump_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_lump
    ADD CONSTRAINT cat_ilk_lump_pkey PRIMARY KEY (id);


--
-- Name: cat_live cat_live_block_number_block_hash_live_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_live
    ADD CONSTRAINT cat_live_block_number_block_hash_live_key UNIQUE (block_number, block_hash, live);


--
-- Name: cat_live cat_live_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_live
    ADD CONSTRAINT cat_live_pkey PRIMARY KEY (id);


--
-- Name: cat_vat cat_vat_block_number_block_hash_vat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_vat
    ADD CONSTRAINT cat_vat_block_number_block_hash_vat_key UNIQUE (block_number, block_hash, vat);


--
-- Name: cat_vat cat_vat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_vat
    ADD CONSTRAINT cat_vat_pkey PRIMARY KEY (id);


--
-- Name: cat_vow cat_vow_block_number_block_hash_vow_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_vow
    ADD CONSTRAINT cat_vow_block_number_block_hash_vow_key UNIQUE (block_number, block_hash, vow);


--
-- Name: cat_vow cat_vow_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_vow
    ADD CONSTRAINT cat_vow_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_cdpi cdp_manager_cdpi_block_number_block_hash_cdpi_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_cdpi
    ADD CONSTRAINT cdp_manager_cdpi_block_number_block_hash_cdpi_key UNIQUE (block_number, block_hash, cdpi);


--
-- Name: cdp_manager_cdpi cdp_manager_cdpi_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_cdpi
    ADD CONSTRAINT cdp_manager_cdpi_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_count cdp_manager_count_block_number_block_hash_owner_count_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_count
    ADD CONSTRAINT cdp_manager_count_block_number_block_hash_owner_count_key UNIQUE (block_number, block_hash, owner, count);


--
-- Name: cdp_manager_count cdp_manager_count_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_count
    ADD CONSTRAINT cdp_manager_count_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_first cdp_manager_first_block_number_block_hash_owner_first_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_first
    ADD CONSTRAINT cdp_manager_first_block_number_block_hash_owner_first_key UNIQUE (block_number, block_hash, owner, first);


--
-- Name: cdp_manager_first cdp_manager_first_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_first
    ADD CONSTRAINT cdp_manager_first_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_ilks cdp_manager_ilks_block_number_block_hash_cdpi_ilk_id_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_ilks
    ADD CONSTRAINT cdp_manager_ilks_block_number_block_hash_cdpi_ilk_id_key UNIQUE (block_number, block_hash, cdpi, ilk_id);


--
-- Name: cdp_manager_ilks cdp_manager_ilks_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_ilks
    ADD CONSTRAINT cdp_manager_ilks_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_last cdp_manager_last_block_number_block_hash_owner_last_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_last
    ADD CONSTRAINT cdp_manager_last_block_number_block_hash_owner_last_key UNIQUE (block_number, block_hash, owner, last);


--
-- Name: cdp_manager_last cdp_manager_last_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_last
    ADD CONSTRAINT cdp_manager_last_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_list_next cdp_manager_list_next_block_number_block_hash_cdpi_next_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_list_next
    ADD CONSTRAINT cdp_manager_list_next_block_number_block_hash_cdpi_next_key UNIQUE (block_number, block_hash, cdpi, next);


--
-- Name: cdp_manager_list_next cdp_manager_list_next_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_list_next
    ADD CONSTRAINT cdp_manager_list_next_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_list_prev cdp_manager_list_prev_block_number_block_hash_cdpi_prev_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_list_prev
    ADD CONSTRAINT cdp_manager_list_prev_block_number_block_hash_cdpi_prev_key UNIQUE (block_number, block_hash, cdpi, prev);


--
-- Name: cdp_manager_list_prev cdp_manager_list_prev_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_list_prev
    ADD CONSTRAINT cdp_manager_list_prev_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_owns cdp_manager_owns_block_number_block_hash_cdpi_owner_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_owns
    ADD CONSTRAINT cdp_manager_owns_block_number_block_hash_cdpi_owner_key UNIQUE (block_number, block_hash, cdpi, owner);


--
-- Name: cdp_manager_owns cdp_manager_owns_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_owns
    ADD CONSTRAINT cdp_manager_owns_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_urns cdp_manager_urns_block_number_block_hash_cdpi_urn_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_urns
    ADD CONSTRAINT cdp_manager_urns_block_number_block_hash_cdpi_urn_key UNIQUE (block_number, block_hash, cdpi, urn);


--
-- Name: cdp_manager_urns cdp_manager_urns_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_urns
    ADD CONSTRAINT cdp_manager_urns_pkey PRIMARY KEY (id);


--
-- Name: cdp_manager_vat cdp_manager_vat_block_number_block_hash_vat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_vat
    ADD CONSTRAINT cdp_manager_vat_block_number_block_hash_vat_key UNIQUE (block_number, block_hash, vat);


--
-- Name: cdp_manager_vat cdp_manager_vat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_vat
    ADD CONSTRAINT cdp_manager_vat_pkey PRIMARY KEY (id);


--
-- Name: deal deal_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.deal
    ADD CONSTRAINT deal_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: deal deal_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.deal
    ADD CONSTRAINT deal_pkey PRIMARY KEY (id);


--
-- Name: dent dent_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.dent
    ADD CONSTRAINT dent_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: dent dent_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.dent
    ADD CONSTRAINT dent_pkey PRIMARY KEY (id);


--
-- Name: flap_beg flap_beg_block_number_block_hash_contract_address_beg_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_beg
    ADD CONSTRAINT flap_beg_block_number_block_hash_contract_address_beg_key UNIQUE (block_number, block_hash, contract_address, beg);


--
-- Name: flap_beg flap_beg_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_beg
    ADD CONSTRAINT flap_beg_pkey PRIMARY KEY (id);


--
-- Name: flap_bid_bid flap_bid_bid_block_number_block_hash_contract_address_bid_i_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_bid
    ADD CONSTRAINT flap_bid_bid_block_number_block_hash_contract_address_bid_i_key UNIQUE (block_number, block_hash, contract_address, bid_id, bid);


--
-- Name: flap_bid_bid flap_bid_bid_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_bid
    ADD CONSTRAINT flap_bid_bid_pkey PRIMARY KEY (id);


--
-- Name: flap_bid_end flap_bid_end_block_number_block_hash_contract_address_bid_i_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_end
    ADD CONSTRAINT flap_bid_end_block_number_block_hash_contract_address_bid_i_key UNIQUE (block_number, block_hash, contract_address, bid_id, "end");


--
-- Name: flap_bid_end flap_bid_end_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_end
    ADD CONSTRAINT flap_bid_end_pkey PRIMARY KEY (id);


--
-- Name: flap_bid_gal flap_bid_gal_block_number_block_hash_contract_address_bid_i_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_gal
    ADD CONSTRAINT flap_bid_gal_block_number_block_hash_contract_address_bid_i_key UNIQUE (block_number, block_hash, contract_address, bid_id, gal);


--
-- Name: flap_bid_gal flap_bid_gal_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_gal
    ADD CONSTRAINT flap_bid_gal_pkey PRIMARY KEY (id);


--
-- Name: flap_bid_guy flap_bid_guy_block_number_block_hash_contract_address_bid_i_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_guy
    ADD CONSTRAINT flap_bid_guy_block_number_block_hash_contract_address_bid_i_key UNIQUE (block_number, block_hash, contract_address, bid_id, guy);


--
-- Name: flap_bid_guy flap_bid_guy_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_guy
    ADD CONSTRAINT flap_bid_guy_pkey PRIMARY KEY (id);


--
-- Name: flap_bid_lot flap_bid_lot_block_number_block_hash_contract_address_bid_i_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_lot
    ADD CONSTRAINT flap_bid_lot_block_number_block_hash_contract_address_bid_i_key UNIQUE (block_number, block_hash, contract_address, bid_id, lot);


--
-- Name: flap_bid_lot flap_bid_lot_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_lot
    ADD CONSTRAINT flap_bid_lot_pkey PRIMARY KEY (id);


--
-- Name: flap_bid_tic flap_bid_tic_block_number_block_hash_contract_address_bid_i_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_tic
    ADD CONSTRAINT flap_bid_tic_block_number_block_hash_contract_address_bid_i_key UNIQUE (block_number, block_hash, contract_address, bid_id, tic);


--
-- Name: flap_bid_tic flap_bid_tic_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_bid_tic
    ADD CONSTRAINT flap_bid_tic_pkey PRIMARY KEY (id);


--
-- Name: flap_gem flap_gem_block_number_block_hash_contract_address_gem_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_gem
    ADD CONSTRAINT flap_gem_block_number_block_hash_contract_address_gem_key UNIQUE (block_number, block_hash, contract_address, gem);


--
-- Name: flap_gem flap_gem_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_gem
    ADD CONSTRAINT flap_gem_pkey PRIMARY KEY (id);


--
-- Name: flap_kick flap_kick_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_kick
    ADD CONSTRAINT flap_kick_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: flap_kick flap_kick_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_kick
    ADD CONSTRAINT flap_kick_pkey PRIMARY KEY (id);


--
-- Name: flap_kicks flap_kicks_block_number_block_hash_contract_address_kicks_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_kicks
    ADD CONSTRAINT flap_kicks_block_number_block_hash_contract_address_kicks_key UNIQUE (block_number, block_hash, contract_address, kicks);


--
-- Name: flap_kicks flap_kicks_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_kicks
    ADD CONSTRAINT flap_kicks_pkey PRIMARY KEY (id);


--
-- Name: flap_live flap_live_block_number_block_hash_contract_address_live_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_live
    ADD CONSTRAINT flap_live_block_number_block_hash_contract_address_live_key UNIQUE (block_number, block_hash, contract_address, live);


--
-- Name: flap_live flap_live_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_live
    ADD CONSTRAINT flap_live_pkey PRIMARY KEY (id);


--
-- Name: flap_tau flap_tau_block_number_block_hash_contract_address_tau_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_tau
    ADD CONSTRAINT flap_tau_block_number_block_hash_contract_address_tau_key UNIQUE (block_number, block_hash, contract_address, tau);


--
-- Name: flap_tau flap_tau_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_tau
    ADD CONSTRAINT flap_tau_pkey PRIMARY KEY (id);


--
-- Name: flap_ttl flap_ttl_block_number_block_hash_contract_address_ttl_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_ttl
    ADD CONSTRAINT flap_ttl_block_number_block_hash_contract_address_ttl_key UNIQUE (block_number, block_hash, contract_address, ttl);


--
-- Name: flap_ttl flap_ttl_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_ttl
    ADD CONSTRAINT flap_ttl_pkey PRIMARY KEY (id);


--
-- Name: flap_vat flap_vat_block_number_block_hash_contract_address_vat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_vat
    ADD CONSTRAINT flap_vat_block_number_block_hash_contract_address_vat_key UNIQUE (block_number, block_hash, contract_address, vat);


--
-- Name: flap_vat flap_vat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_vat
    ADD CONSTRAINT flap_vat_pkey PRIMARY KEY (id);


--
-- Name: flip_beg flip_beg_block_number_block_hash_contract_address_beg_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_beg
    ADD CONSTRAINT flip_beg_block_number_block_hash_contract_address_beg_key UNIQUE (block_number, block_hash, contract_address, beg);


--
-- Name: flip_beg flip_beg_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_beg
    ADD CONSTRAINT flip_beg_pkey PRIMARY KEY (id);


--
-- Name: flip_bid_bid flip_bid_bid_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_bid
    ADD CONSTRAINT flip_bid_bid_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, bid);


--
-- Name: flip_bid_bid flip_bid_bid_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_bid
    ADD CONSTRAINT flip_bid_bid_pkey PRIMARY KEY (id);


--
-- Name: flip_bid_end flip_bid_end_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_end
    ADD CONSTRAINT flip_bid_end_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, "end");


--
-- Name: flip_bid_end flip_bid_end_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_end
    ADD CONSTRAINT flip_bid_end_pkey PRIMARY KEY (id);


--
-- Name: flip_bid_gal flip_bid_gal_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_gal
    ADD CONSTRAINT flip_bid_gal_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, gal);


--
-- Name: flip_bid_gal flip_bid_gal_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_gal
    ADD CONSTRAINT flip_bid_gal_pkey PRIMARY KEY (id);


--
-- Name: flip_bid_guy flip_bid_guy_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_guy
    ADD CONSTRAINT flip_bid_guy_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, guy);


--
-- Name: flip_bid_guy flip_bid_guy_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_guy
    ADD CONSTRAINT flip_bid_guy_pkey PRIMARY KEY (id);


--
-- Name: flip_bid_lot flip_bid_lot_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_lot
    ADD CONSTRAINT flip_bid_lot_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, lot);


--
-- Name: flip_bid_lot flip_bid_lot_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_lot
    ADD CONSTRAINT flip_bid_lot_pkey PRIMARY KEY (id);


--
-- Name: flip_bid_tab flip_bid_tab_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_tab
    ADD CONSTRAINT flip_bid_tab_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, tab);


--
-- Name: flip_bid_tab flip_bid_tab_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_tab
    ADD CONSTRAINT flip_bid_tab_pkey PRIMARY KEY (id);


--
-- Name: flip_bid_tic flip_bid_tic_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_tic
    ADD CONSTRAINT flip_bid_tic_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, tic);


--
-- Name: flip_bid_tic flip_bid_tic_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_tic
    ADD CONSTRAINT flip_bid_tic_pkey PRIMARY KEY (id);


--
-- Name: flip_bid_usr flip_bid_usr_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_usr
    ADD CONSTRAINT flip_bid_usr_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, usr);


--
-- Name: flip_bid_usr flip_bid_usr_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_bid_usr
    ADD CONSTRAINT flip_bid_usr_pkey PRIMARY KEY (id);


--
-- Name: flip_ilk flip_ilk_block_number_block_hash_contract_address_ilk_id_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_ilk
    ADD CONSTRAINT flip_ilk_block_number_block_hash_contract_address_ilk_id_key UNIQUE (block_number, block_hash, contract_address, ilk_id);


--
-- Name: flip_ilk flip_ilk_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_ilk
    ADD CONSTRAINT flip_ilk_pkey PRIMARY KEY (id);


--
-- Name: flip_kick flip_kick_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_kick
    ADD CONSTRAINT flip_kick_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: flip_kick flip_kick_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_kick
    ADD CONSTRAINT flip_kick_pkey PRIMARY KEY (id);


--
-- Name: flip_kicks flip_kicks_block_number_block_hash_contract_address_kicks_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_kicks
    ADD CONSTRAINT flip_kicks_block_number_block_hash_contract_address_kicks_key UNIQUE (block_number, block_hash, contract_address, kicks);


--
-- Name: flip_kicks flip_kicks_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_kicks
    ADD CONSTRAINT flip_kicks_pkey PRIMARY KEY (id);


--
-- Name: flip_tau flip_tau_block_number_block_hash_contract_address_tau_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_tau
    ADD CONSTRAINT flip_tau_block_number_block_hash_contract_address_tau_key UNIQUE (block_number, block_hash, contract_address, tau);


--
-- Name: flip_tau flip_tau_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_tau
    ADD CONSTRAINT flip_tau_pkey PRIMARY KEY (id);


--
-- Name: flip_tick flip_tick_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_tick
    ADD CONSTRAINT flip_tick_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: flip_tick flip_tick_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_tick
    ADD CONSTRAINT flip_tick_pkey PRIMARY KEY (id);


--
-- Name: flip_ttl flip_ttl_block_number_block_hash_contract_address_ttl_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_ttl
    ADD CONSTRAINT flip_ttl_block_number_block_hash_contract_address_ttl_key UNIQUE (block_number, block_hash, contract_address, ttl);


--
-- Name: flip_ttl flip_ttl_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_ttl
    ADD CONSTRAINT flip_ttl_pkey PRIMARY KEY (id);


--
-- Name: flip_vat flip_vat_block_number_block_hash_contract_address_vat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_vat
    ADD CONSTRAINT flip_vat_block_number_block_hash_contract_address_vat_key UNIQUE (block_number, block_hash, contract_address, vat);


--
-- Name: flip_vat flip_vat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_vat
    ADD CONSTRAINT flip_vat_pkey PRIMARY KEY (id);


--
-- Name: flop_beg flop_beg_block_number_block_hash_contract_address_beg_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_beg
    ADD CONSTRAINT flop_beg_block_number_block_hash_contract_address_beg_key UNIQUE (block_number, block_hash, contract_address, beg);


--
-- Name: flop_beg flop_beg_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_beg
    ADD CONSTRAINT flop_beg_pkey PRIMARY KEY (id);


--
-- Name: flop_bid_bid flop_bid_bid_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_bid
    ADD CONSTRAINT flop_bid_bid_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, bid);


--
-- Name: flop_bid_bid flop_bid_bid_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_bid
    ADD CONSTRAINT flop_bid_bid_pkey PRIMARY KEY (id);


--
-- Name: flop_bid_end flop_bid_end_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_end
    ADD CONSTRAINT flop_bid_end_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, "end");


--
-- Name: flop_bid_end flop_bid_end_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_end
    ADD CONSTRAINT flop_bid_end_pkey PRIMARY KEY (id);


--
-- Name: flop_bid_guy flop_bid_guy_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_guy
    ADD CONSTRAINT flop_bid_guy_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, guy);


--
-- Name: flop_bid_guy flop_bid_guy_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_guy
    ADD CONSTRAINT flop_bid_guy_pkey PRIMARY KEY (id);


--
-- Name: flop_bid_lot flop_bid_lot_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_lot
    ADD CONSTRAINT flop_bid_lot_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, lot);


--
-- Name: flop_bid_lot flop_bid_lot_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_lot
    ADD CONSTRAINT flop_bid_lot_pkey PRIMARY KEY (id);


--
-- Name: flop_bid_tic flop_bid_tic_block_number_block_hash_bid_id_contract_addres_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_tic
    ADD CONSTRAINT flop_bid_tic_block_number_block_hash_bid_id_contract_addres_key UNIQUE (block_number, block_hash, bid_id, contract_address, tic);


--
-- Name: flop_bid_tic flop_bid_tic_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_bid_tic
    ADD CONSTRAINT flop_bid_tic_pkey PRIMARY KEY (id);


--
-- Name: flop_gem flop_gem_block_number_block_hash_contract_address_gem_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_gem
    ADD CONSTRAINT flop_gem_block_number_block_hash_contract_address_gem_key UNIQUE (block_number, block_hash, contract_address, gem);


--
-- Name: flop_gem flop_gem_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_gem
    ADD CONSTRAINT flop_gem_pkey PRIMARY KEY (id);


--
-- Name: flop_kick flop_kick_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_kick
    ADD CONSTRAINT flop_kick_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: flop_kick flop_kick_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_kick
    ADD CONSTRAINT flop_kick_pkey PRIMARY KEY (id);


--
-- Name: flop_kicks flop_kicks_block_number_block_hash_contract_address_kicks_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_kicks
    ADD CONSTRAINT flop_kicks_block_number_block_hash_contract_address_kicks_key UNIQUE (block_number, block_hash, contract_address, kicks);


--
-- Name: flop_kicks flop_kicks_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_kicks
    ADD CONSTRAINT flop_kicks_pkey PRIMARY KEY (id);


--
-- Name: flop_live flop_live_block_number_block_hash_contract_address_live_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_live
    ADD CONSTRAINT flop_live_block_number_block_hash_contract_address_live_key UNIQUE (block_number, block_hash, contract_address, live);


--
-- Name: flop_live flop_live_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_live
    ADD CONSTRAINT flop_live_pkey PRIMARY KEY (id);


--
-- Name: flop_tau flop_tau_block_number_block_hash_contract_address_tau_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_tau
    ADD CONSTRAINT flop_tau_block_number_block_hash_contract_address_tau_key UNIQUE (block_number, block_hash, contract_address, tau);


--
-- Name: flop_tau flop_tau_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_tau
    ADD CONSTRAINT flop_tau_pkey PRIMARY KEY (id);


--
-- Name: flop_ttl flop_ttl_block_number_block_hash_contract_address_ttl_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_ttl
    ADD CONSTRAINT flop_ttl_block_number_block_hash_contract_address_ttl_key UNIQUE (block_number, block_hash, contract_address, ttl);


--
-- Name: flop_ttl flop_ttl_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_ttl
    ADD CONSTRAINT flop_ttl_pkey PRIMARY KEY (id);


--
-- Name: flop_vat flop_vat_block_number_block_hash_contract_address_vat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_vat
    ADD CONSTRAINT flop_vat_block_number_block_hash_contract_address_vat_key UNIQUE (block_number, block_hash, contract_address, vat);


--
-- Name: flop_vat flop_vat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_vat
    ADD CONSTRAINT flop_vat_pkey PRIMARY KEY (id);


--
-- Name: ilks ilks_identifier_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.ilks
    ADD CONSTRAINT ilks_identifier_key UNIQUE (identifier);


--
-- Name: ilks ilks_ilk_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.ilks
    ADD CONSTRAINT ilks_ilk_key UNIQUE (ilk);


--
-- Name: ilks ilks_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.ilks
    ADD CONSTRAINT ilks_pkey PRIMARY KEY (id);


--
-- Name: jug_base jug_base_block_number_block_hash_base_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_base
    ADD CONSTRAINT jug_base_block_number_block_hash_base_key UNIQUE (block_number, block_hash, base);


--
-- Name: jug_base jug_base_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_base
    ADD CONSTRAINT jug_base_pkey PRIMARY KEY (id);


--
-- Name: jug_drip jug_drip_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_drip
    ADD CONSTRAINT jug_drip_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: jug_drip jug_drip_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_drip
    ADD CONSTRAINT jug_drip_pkey PRIMARY KEY (id);


--
-- Name: jug_file_base jug_file_base_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_base
    ADD CONSTRAINT jug_file_base_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: jug_file_base jug_file_base_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_base
    ADD CONSTRAINT jug_file_base_pkey PRIMARY KEY (id);


--
-- Name: jug_file_ilk jug_file_ilk_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_ilk
    ADD CONSTRAINT jug_file_ilk_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: jug_file_ilk jug_file_ilk_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_ilk
    ADD CONSTRAINT jug_file_ilk_pkey PRIMARY KEY (id);


--
-- Name: jug_file_vow jug_file_vow_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_vow
    ADD CONSTRAINT jug_file_vow_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: jug_file_vow jug_file_vow_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_vow
    ADD CONSTRAINT jug_file_vow_pkey PRIMARY KEY (id);


--
-- Name: jug_ilk_duty jug_ilk_duty_block_number_block_hash_ilk_id_duty_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_ilk_duty
    ADD CONSTRAINT jug_ilk_duty_block_number_block_hash_ilk_id_duty_key UNIQUE (block_number, block_hash, ilk_id, duty);


--
-- Name: jug_ilk_duty jug_ilk_duty_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_ilk_duty
    ADD CONSTRAINT jug_ilk_duty_pkey PRIMARY KEY (id);


--
-- Name: jug_ilk_rho jug_ilk_rho_block_number_block_hash_ilk_id_rho_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_ilk_rho
    ADD CONSTRAINT jug_ilk_rho_block_number_block_hash_ilk_id_rho_key UNIQUE (block_number, block_hash, ilk_id, rho);


--
-- Name: jug_ilk_rho jug_ilk_rho_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_ilk_rho
    ADD CONSTRAINT jug_ilk_rho_pkey PRIMARY KEY (id);


--
-- Name: jug_init jug_init_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_init
    ADD CONSTRAINT jug_init_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: jug_init jug_init_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_init
    ADD CONSTRAINT jug_init_pkey PRIMARY KEY (id);


--
-- Name: jug_vat jug_vat_block_number_block_hash_vat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_vat
    ADD CONSTRAINT jug_vat_block_number_block_hash_vat_key UNIQUE (block_number, block_hash, vat);


--
-- Name: jug_vat jug_vat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_vat
    ADD CONSTRAINT jug_vat_pkey PRIMARY KEY (id);


--
-- Name: jug_vow jug_vow_block_number_block_hash_vow_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_vow
    ADD CONSTRAINT jug_vow_block_number_block_hash_vow_key UNIQUE (block_number, block_hash, vow);


--
-- Name: jug_vow jug_vow_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_vow
    ADD CONSTRAINT jug_vow_pkey PRIMARY KEY (id);


--
-- Name: spot_file_mat spot_file_mat_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_mat
    ADD CONSTRAINT spot_file_mat_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: spot_file_mat spot_file_mat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_mat
    ADD CONSTRAINT spot_file_mat_pkey PRIMARY KEY (id);


--
-- Name: spot_file_pip spot_file_pip_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_pip
    ADD CONSTRAINT spot_file_pip_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: spot_file_pip spot_file_pip_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_pip
    ADD CONSTRAINT spot_file_pip_pkey PRIMARY KEY (id);


--
-- Name: spot_ilk_mat spot_ilk_mat_block_number_block_hash_ilk_id_mat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_ilk_mat
    ADD CONSTRAINT spot_ilk_mat_block_number_block_hash_ilk_id_mat_key UNIQUE (block_number, block_hash, ilk_id, mat);


--
-- Name: spot_ilk_mat spot_ilk_mat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_ilk_mat
    ADD CONSTRAINT spot_ilk_mat_pkey PRIMARY KEY (id);


--
-- Name: spot_ilk_pip spot_ilk_pip_block_number_block_hash_ilk_id_pip_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_ilk_pip
    ADD CONSTRAINT spot_ilk_pip_block_number_block_hash_ilk_id_pip_key UNIQUE (block_number, block_hash, ilk_id, pip);


--
-- Name: spot_ilk_pip spot_ilk_pip_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_ilk_pip
    ADD CONSTRAINT spot_ilk_pip_pkey PRIMARY KEY (id);


--
-- Name: spot_par spot_par_block_number_block_hash_par_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_par
    ADD CONSTRAINT spot_par_block_number_block_hash_par_key UNIQUE (block_number, block_hash, par);


--
-- Name: spot_par spot_par_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_par
    ADD CONSTRAINT spot_par_pkey PRIMARY KEY (id);


--
-- Name: spot_poke spot_poke_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_poke
    ADD CONSTRAINT spot_poke_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: spot_poke spot_poke_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_poke
    ADD CONSTRAINT spot_poke_pkey PRIMARY KEY (id);


--
-- Name: spot_vat spot_vat_block_number_block_hash_vat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_vat
    ADD CONSTRAINT spot_vat_block_number_block_hash_vat_key UNIQUE (block_number, block_hash, vat);


--
-- Name: spot_vat spot_vat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_vat
    ADD CONSTRAINT spot_vat_pkey PRIMARY KEY (id);


--
-- Name: tend tend_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.tend
    ADD CONSTRAINT tend_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: tend tend_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.tend
    ADD CONSTRAINT tend_pkey PRIMARY KEY (id);


--
-- Name: urns urns_ilk_id_identifier_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.urns
    ADD CONSTRAINT urns_ilk_id_identifier_key UNIQUE (ilk_id, identifier);


--
-- Name: urns urns_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.urns
    ADD CONSTRAINT urns_pkey PRIMARY KEY (id);


--
-- Name: vat_dai vat_dai_block_number_block_hash_guy_dai_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_dai
    ADD CONSTRAINT vat_dai_block_number_block_hash_guy_dai_key UNIQUE (block_number, block_hash, guy, dai);


--
-- Name: vat_dai vat_dai_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_dai
    ADD CONSTRAINT vat_dai_pkey PRIMARY KEY (id);


--
-- Name: vat_debt vat_debt_block_number_block_hash_debt_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_debt
    ADD CONSTRAINT vat_debt_block_number_block_hash_debt_key UNIQUE (block_number, block_hash, debt);


--
-- Name: vat_debt vat_debt_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_debt
    ADD CONSTRAINT vat_debt_pkey PRIMARY KEY (id);


--
-- Name: vat_file_debt_ceiling vat_file_debt_ceiling_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_debt_ceiling
    ADD CONSTRAINT vat_file_debt_ceiling_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_file_debt_ceiling vat_file_debt_ceiling_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_debt_ceiling
    ADD CONSTRAINT vat_file_debt_ceiling_pkey PRIMARY KEY (id);


--
-- Name: vat_file_ilk vat_file_ilk_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_ilk
    ADD CONSTRAINT vat_file_ilk_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_file_ilk vat_file_ilk_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_ilk
    ADD CONSTRAINT vat_file_ilk_pkey PRIMARY KEY (id);


--
-- Name: vat_flux vat_flux_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_flux
    ADD CONSTRAINT vat_flux_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_flux vat_flux_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_flux
    ADD CONSTRAINT vat_flux_pkey PRIMARY KEY (id);


--
-- Name: vat_fold vat_fold_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fold
    ADD CONSTRAINT vat_fold_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_fold vat_fold_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fold
    ADD CONSTRAINT vat_fold_pkey PRIMARY KEY (id);


--
-- Name: vat_fork vat_fork_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fork
    ADD CONSTRAINT vat_fork_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_fork vat_fork_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fork
    ADD CONSTRAINT vat_fork_pkey PRIMARY KEY (id);


--
-- Name: vat_frob vat_frob_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_frob
    ADD CONSTRAINT vat_frob_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_frob vat_frob_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_frob
    ADD CONSTRAINT vat_frob_pkey PRIMARY KEY (id);


--
-- Name: vat_gem vat_gem_block_number_block_hash_ilk_id_guy_gem_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_gem
    ADD CONSTRAINT vat_gem_block_number_block_hash_ilk_id_guy_gem_key UNIQUE (block_number, block_hash, ilk_id, guy, gem);


--
-- Name: vat_gem vat_gem_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_gem
    ADD CONSTRAINT vat_gem_pkey PRIMARY KEY (id);


--
-- Name: vat_grab vat_grab_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_grab
    ADD CONSTRAINT vat_grab_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_grab vat_grab_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_grab
    ADD CONSTRAINT vat_grab_pkey PRIMARY KEY (id);


--
-- Name: vat_heal vat_heal_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_heal
    ADD CONSTRAINT vat_heal_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_heal vat_heal_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_heal
    ADD CONSTRAINT vat_heal_pkey PRIMARY KEY (id);


--
-- Name: vat_ilk_art vat_ilk_art_block_number_block_hash_ilk_id_art_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_art
    ADD CONSTRAINT vat_ilk_art_block_number_block_hash_ilk_id_art_key UNIQUE (block_number, block_hash, ilk_id, art);


--
-- Name: vat_ilk_art vat_ilk_art_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_art
    ADD CONSTRAINT vat_ilk_art_pkey PRIMARY KEY (id);


--
-- Name: vat_ilk_dust vat_ilk_dust_block_number_block_hash_ilk_id_dust_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_dust
    ADD CONSTRAINT vat_ilk_dust_block_number_block_hash_ilk_id_dust_key UNIQUE (block_number, block_hash, ilk_id, dust);


--
-- Name: vat_ilk_dust vat_ilk_dust_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_dust
    ADD CONSTRAINT vat_ilk_dust_pkey PRIMARY KEY (id);


--
-- Name: vat_ilk_line vat_ilk_line_block_number_block_hash_ilk_id_line_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_line
    ADD CONSTRAINT vat_ilk_line_block_number_block_hash_ilk_id_line_key UNIQUE (block_number, block_hash, ilk_id, line);


--
-- Name: vat_ilk_line vat_ilk_line_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_line
    ADD CONSTRAINT vat_ilk_line_pkey PRIMARY KEY (id);


--
-- Name: vat_ilk_rate vat_ilk_rate_block_number_block_hash_ilk_id_rate_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_rate
    ADD CONSTRAINT vat_ilk_rate_block_number_block_hash_ilk_id_rate_key UNIQUE (block_number, block_hash, ilk_id, rate);


--
-- Name: vat_ilk_rate vat_ilk_rate_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_rate
    ADD CONSTRAINT vat_ilk_rate_pkey PRIMARY KEY (id);


--
-- Name: vat_ilk_spot vat_ilk_spot_block_number_block_hash_ilk_id_spot_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_spot
    ADD CONSTRAINT vat_ilk_spot_block_number_block_hash_ilk_id_spot_key UNIQUE (block_number, block_hash, ilk_id, spot);


--
-- Name: vat_ilk_spot vat_ilk_spot_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_spot
    ADD CONSTRAINT vat_ilk_spot_pkey PRIMARY KEY (id);


--
-- Name: vat_init vat_init_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_init
    ADD CONSTRAINT vat_init_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_init vat_init_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_init
    ADD CONSTRAINT vat_init_pkey PRIMARY KEY (id);


--
-- Name: vat_line vat_line_block_number_block_hash_line_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_line
    ADD CONSTRAINT vat_line_block_number_block_hash_line_key UNIQUE (block_number, block_hash, line);


--
-- Name: vat_line vat_line_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_line
    ADD CONSTRAINT vat_line_pkey PRIMARY KEY (id);


--
-- Name: vat_live vat_live_block_number_block_hash_live_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_live
    ADD CONSTRAINT vat_live_block_number_block_hash_live_key UNIQUE (block_number, block_hash, live);


--
-- Name: vat_live vat_live_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_live
    ADD CONSTRAINT vat_live_pkey PRIMARY KEY (id);


--
-- Name: vat_move vat_move_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_move
    ADD CONSTRAINT vat_move_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_move vat_move_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_move
    ADD CONSTRAINT vat_move_pkey PRIMARY KEY (id);


--
-- Name: vat_sin vat_sin_block_number_block_hash_guy_sin_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_sin
    ADD CONSTRAINT vat_sin_block_number_block_hash_guy_sin_key UNIQUE (block_number, block_hash, guy, sin);


--
-- Name: vat_sin vat_sin_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_sin
    ADD CONSTRAINT vat_sin_pkey PRIMARY KEY (id);


--
-- Name: vat_slip vat_slip_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_slip
    ADD CONSTRAINT vat_slip_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_slip vat_slip_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_slip
    ADD CONSTRAINT vat_slip_pkey PRIMARY KEY (id);


--
-- Name: vat_suck vat_suck_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_suck
    ADD CONSTRAINT vat_suck_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vat_suck vat_suck_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_suck
    ADD CONSTRAINT vat_suck_pkey PRIMARY KEY (id);


--
-- Name: vat_urn_art vat_urn_art_block_number_block_hash_urn_id_art_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_urn_art
    ADD CONSTRAINT vat_urn_art_block_number_block_hash_urn_id_art_key UNIQUE (block_number, block_hash, urn_id, art);


--
-- Name: vat_urn_art vat_urn_art_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_urn_art
    ADD CONSTRAINT vat_urn_art_pkey PRIMARY KEY (id);


--
-- Name: vat_urn_ink vat_urn_ink_block_number_block_hash_urn_id_ink_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_urn_ink
    ADD CONSTRAINT vat_urn_ink_block_number_block_hash_urn_id_ink_key UNIQUE (block_number, block_hash, urn_id, ink);


--
-- Name: vat_urn_ink vat_urn_ink_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_urn_ink
    ADD CONSTRAINT vat_urn_ink_pkey PRIMARY KEY (id);


--
-- Name: vat_vice vat_vice_block_number_block_hash_vice_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_vice
    ADD CONSTRAINT vat_vice_block_number_block_hash_vice_key UNIQUE (block_number, block_hash, vice);


--
-- Name: vat_vice vat_vice_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_vice
    ADD CONSTRAINT vat_vice_pkey PRIMARY KEY (id);


--
-- Name: vow_ash vow_ash_block_number_block_hash_ash_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_ash
    ADD CONSTRAINT vow_ash_block_number_block_hash_ash_key UNIQUE (block_number, block_hash, ash);


--
-- Name: vow_ash vow_ash_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_ash
    ADD CONSTRAINT vow_ash_pkey PRIMARY KEY (id);


--
-- Name: vow_bump vow_bump_block_number_block_hash_bump_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_bump
    ADD CONSTRAINT vow_bump_block_number_block_hash_bump_key UNIQUE (block_number, block_hash, bump);


--
-- Name: vow_bump vow_bump_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_bump
    ADD CONSTRAINT vow_bump_pkey PRIMARY KEY (id);


--
-- Name: vow_fess vow_fess_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_fess
    ADD CONSTRAINT vow_fess_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vow_fess vow_fess_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_fess
    ADD CONSTRAINT vow_fess_pkey PRIMARY KEY (id);


--
-- Name: vow_file vow_file_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_file
    ADD CONSTRAINT vow_file_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vow_file vow_file_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_file
    ADD CONSTRAINT vow_file_pkey PRIMARY KEY (id);


--
-- Name: vow_flapper vow_flapper_block_number_block_hash_flapper_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flapper
    ADD CONSTRAINT vow_flapper_block_number_block_hash_flapper_key UNIQUE (block_number, block_hash, flapper);


--
-- Name: vow_flapper vow_flapper_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flapper
    ADD CONSTRAINT vow_flapper_pkey PRIMARY KEY (id);


--
-- Name: vow_flog vow_flog_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flog
    ADD CONSTRAINT vow_flog_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: vow_flog vow_flog_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flog
    ADD CONSTRAINT vow_flog_pkey PRIMARY KEY (id);


--
-- Name: vow_flopper vow_flopper_block_number_block_hash_flopper_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flopper
    ADD CONSTRAINT vow_flopper_block_number_block_hash_flopper_key UNIQUE (block_number, block_hash, flopper);


--
-- Name: vow_flopper vow_flopper_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flopper
    ADD CONSTRAINT vow_flopper_pkey PRIMARY KEY (id);


--
-- Name: vow_hump vow_hump_block_number_block_hash_hump_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_hump
    ADD CONSTRAINT vow_hump_block_number_block_hash_hump_key UNIQUE (block_number, block_hash, hump);


--
-- Name: vow_hump vow_hump_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_hump
    ADD CONSTRAINT vow_hump_pkey PRIMARY KEY (id);


--
-- Name: vow_sin_integer vow_sin_integer_block_number_block_hash_sin_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sin_integer
    ADD CONSTRAINT vow_sin_integer_block_number_block_hash_sin_key UNIQUE (block_number, block_hash, sin);


--
-- Name: vow_sin_integer vow_sin_integer_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sin_integer
    ADD CONSTRAINT vow_sin_integer_pkey PRIMARY KEY (id);


--
-- Name: vow_sin_mapping vow_sin_mapping_block_number_block_hash_era_tab_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sin_mapping
    ADD CONSTRAINT vow_sin_mapping_block_number_block_hash_era_tab_key UNIQUE (block_number, block_hash, era, tab);


--
-- Name: vow_sin_mapping vow_sin_mapping_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sin_mapping
    ADD CONSTRAINT vow_sin_mapping_pkey PRIMARY KEY (id);


--
-- Name: vow_sump vow_sump_block_number_block_hash_sump_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sump
    ADD CONSTRAINT vow_sump_block_number_block_hash_sump_key UNIQUE (block_number, block_hash, sump);


--
-- Name: vow_sump vow_sump_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_sump
    ADD CONSTRAINT vow_sump_pkey PRIMARY KEY (id);


--
-- Name: vow_vat vow_vat_block_number_block_hash_vat_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_vat
    ADD CONSTRAINT vow_vat_block_number_block_hash_vat_key UNIQUE (block_number, block_hash, vat);


--
-- Name: vow_vat vow_vat_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_vat
    ADD CONSTRAINT vow_vat_pkey PRIMARY KEY (id);


--
-- Name: vow_wait vow_wait_block_number_block_hash_wait_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_wait
    ADD CONSTRAINT vow_wait_block_number_block_hash_wait_key UNIQUE (block_number, block_hash, wait);


--
-- Name: vow_wait vow_wait_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_wait
    ADD CONSTRAINT vow_wait_pkey PRIMARY KEY (id);


--
-- Name: yank yank_header_id_tx_idx_log_idx_key; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.yank
    ADD CONSTRAINT yank_header_id_tx_idx_log_idx_key UNIQUE (header_id, tx_idx, log_idx);


--
-- Name: yank yank_pkey; Type: CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.yank
    ADD CONSTRAINT yank_pkey PRIMARY KEY (id);


--
-- Name: blocks blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (id);


--
-- Name: checked_headers checked_headers_header_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.checked_headers
    ADD CONSTRAINT checked_headers_header_id_key UNIQUE (header_id);


--
-- Name: checked_headers checked_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.checked_headers
    ADD CONSTRAINT checked_headers_pkey PRIMARY KEY (id);


--
-- Name: blocks eth_node_id_block_number_uc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT eth_node_id_block_number_uc UNIQUE (number, eth_node_id);


--
-- Name: eth_nodes eth_node_uc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eth_nodes
    ADD CONSTRAINT eth_node_uc UNIQUE (genesis_block, network_id, eth_node_id);


--
-- Name: full_sync_receipts full_sync_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.full_sync_receipts
    ADD CONSTRAINT full_sync_receipts_pkey PRIMARY KEY (id);


--
-- Name: full_sync_transactions full_sync_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.full_sync_transactions
    ADD CONSTRAINT full_sync_transactions_pkey PRIMARY KEY (id);


--
-- Name: goose_db_version goose_db_version_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goose_db_version
    ADD CONSTRAINT goose_db_version_pkey PRIMARY KEY (id);


--
-- Name: header_sync_receipts header_sync_receipts_header_id_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_receipts
    ADD CONSTRAINT header_sync_receipts_header_id_transaction_id_key UNIQUE (header_id, transaction_id);


--
-- Name: header_sync_receipts header_sync_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_receipts
    ADD CONSTRAINT header_sync_receipts_pkey PRIMARY KEY (id);


--
-- Name: header_sync_transactions header_sync_transactions_header_id_hash_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_transactions
    ADD CONSTRAINT header_sync_transactions_header_id_hash_key UNIQUE (header_id, hash);


--
-- Name: header_sync_transactions header_sync_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_transactions
    ADD CONSTRAINT header_sync_transactions_pkey PRIMARY KEY (id);


--
-- Name: headers headers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.headers
    ADD CONSTRAINT headers_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: log_filters name_uc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.log_filters
    ADD CONSTRAINT name_uc UNIQUE (name);


--
-- Name: eth_nodes nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eth_nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- Name: queued_storage queued_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queued_storage
    ADD CONSTRAINT queued_storage_pkey PRIMARY KEY (id);


--
-- Name: uncles uncles_block_id_hash_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uncles
    ADD CONSTRAINT uncles_block_id_hash_key UNIQUE (block_id, hash);


--
-- Name: uncles uncles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uncles
    ADD CONSTRAINT uncles_pkey PRIMARY KEY (id);


--
-- Name: watched_contracts watched_contracts_contract_hash_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watched_contracts
    ADD CONSTRAINT watched_contracts_contract_hash_key UNIQUE (contract_hash);


--
-- Name: watched_contracts watched_contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watched_contracts
    ADD CONSTRAINT watched_contracts_pkey PRIMARY KEY (contract_id);


--
-- Name: bite_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX bite_header_index ON maker.bite USING btree (header_id);


--
-- Name: bite_urn_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX bite_urn_index ON maker.bite USING btree (urn_id);


--
-- Name: cat_file_chop_lump_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_file_chop_lump_header_index ON maker.cat_file_chop_lump USING btree (header_id);


--
-- Name: cat_file_chop_lump_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_file_chop_lump_ilk_index ON maker.cat_file_chop_lump USING btree (ilk_id);


--
-- Name: cat_file_flip_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_file_flip_header_index ON maker.cat_file_flip USING btree (header_id);


--
-- Name: cat_file_flip_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_file_flip_ilk_index ON maker.cat_file_flip USING btree (ilk_id);


--
-- Name: cat_file_vow_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_file_vow_header_index ON maker.cat_file_vow USING btree (header_id);


--
-- Name: cat_ilk_chop_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_ilk_chop_block_number_index ON maker.cat_ilk_chop USING btree (block_number);


--
-- Name: cat_ilk_chop_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_ilk_chop_ilk_index ON maker.cat_ilk_chop USING btree (ilk_id);


--
-- Name: cat_ilk_flip_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_ilk_flip_block_number_index ON maker.cat_ilk_flip USING btree (block_number);


--
-- Name: cat_ilk_flip_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_ilk_flip_ilk_index ON maker.cat_ilk_flip USING btree (ilk_id);


--
-- Name: cat_ilk_lump_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_ilk_lump_block_number_index ON maker.cat_ilk_lump USING btree (block_number);


--
-- Name: cat_ilk_lump_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX cat_ilk_lump_ilk_index ON maker.cat_ilk_lump USING btree (ilk_id);


--
-- Name: deal_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX deal_bid_id_index ON maker.deal USING btree (bid_id);


--
-- Name: deal_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX deal_contract_address_index ON maker.deal USING btree (contract_address);


--
-- Name: deal_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX deal_header_index ON maker.deal USING btree (header_id);


--
-- Name: dent_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX dent_header_index ON maker.dent USING btree (header_id);


--
-- Name: flap_bid_bid_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_bid_bid_id_index ON maker.flap_bid_bid USING btree (bid_id);


--
-- Name: flap_bid_bid_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_bid_block_number_index ON maker.flap_bid_bid USING btree (block_number);


--
-- Name: flap_bid_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_bid_contract_address_index ON maker.flap_bid_bid USING btree (contract_address);


--
-- Name: flap_bid_end_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_end_bid_contract_address_index ON maker.flap_bid_end USING btree (contract_address);


--
-- Name: flap_bid_end_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_end_bid_id_index ON maker.flap_bid_end USING btree (bid_id);


--
-- Name: flap_bid_end_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_end_block_number_index ON maker.flap_bid_end USING btree (block_number);


--
-- Name: flap_bid_gal_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_gal_bid_contract_address_index ON maker.flap_bid_gal USING btree (contract_address);


--
-- Name: flap_bid_gal_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_gal_bid_id_index ON maker.flap_bid_gal USING btree (bid_id);


--
-- Name: flap_bid_gal_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_gal_block_number_index ON maker.flap_bid_gal USING btree (block_number);


--
-- Name: flap_bid_guy_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_guy_bid_contract_address_index ON maker.flap_bid_guy USING btree (contract_address);


--
-- Name: flap_bid_guy_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_guy_bid_id_index ON maker.flap_bid_guy USING btree (bid_id);


--
-- Name: flap_bid_guy_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_guy_block_number_index ON maker.flap_bid_guy USING btree (block_number);


--
-- Name: flap_bid_lot_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_lot_bid_contract_address_index ON maker.flap_bid_lot USING btree (contract_address);


--
-- Name: flap_bid_lot_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_lot_bid_id_index ON maker.flap_bid_lot USING btree (bid_id);


--
-- Name: flap_bid_lot_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_lot_block_number_index ON maker.flap_bid_lot USING btree (block_number);


--
-- Name: flap_bid_tic_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_tic_bid_contract_address_index ON maker.flap_bid_tic USING btree (contract_address);


--
-- Name: flap_bid_tic_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_tic_bid_id_index ON maker.flap_bid_tic USING btree (bid_id);


--
-- Name: flap_bid_tic_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_bid_tic_block_number_index ON maker.flap_bid_tic USING btree (block_number);


--
-- Name: flap_kick_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_kick_header_index ON maker.flap_kick USING btree (header_id);


--
-- Name: flap_kicks_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_kicks_block_number_index ON maker.flap_kicks USING btree (block_number);


--
-- Name: flap_kicks_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_kicks_contract_address_index ON maker.flap_kicks USING btree (contract_address);


--
-- Name: flap_kicks_kicks_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flap_kicks_kicks_index ON maker.flap_kicks USING btree (kicks);


--
-- Name: flip_bid_bid_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_bid_bid_id_index ON maker.flip_bid_bid USING btree (bid_id);


--
-- Name: flip_bid_bid_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_bid_block_number_index ON maker.flip_bid_bid USING btree (block_number);


--
-- Name: flip_bid_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_bid_contract_address_index ON maker.flip_bid_bid USING btree (contract_address);


--
-- Name: flip_bid_end_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_end_bid_id_index ON maker.flip_bid_end USING btree (bid_id);


--
-- Name: flip_bid_end_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_end_block_number_index ON maker.flip_bid_end USING btree (block_number);


--
-- Name: flip_bid_end_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_end_contract_address_index ON maker.flip_bid_end USING btree (contract_address);


--
-- Name: flip_bid_gal_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_gal_bid_id_index ON maker.flip_bid_gal USING btree (bid_id);


--
-- Name: flip_bid_gal_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_gal_block_number_index ON maker.flip_bid_gal USING btree (block_number);


--
-- Name: flip_bid_gal_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_gal_contract_address_index ON maker.flip_bid_gal USING btree (contract_address);


--
-- Name: flip_bid_guy_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_guy_bid_id_index ON maker.flip_bid_guy USING btree (bid_id);


--
-- Name: flip_bid_guy_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_guy_block_number_index ON maker.flip_bid_guy USING btree (block_number);


--
-- Name: flip_bid_guy_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_guy_contract_address_index ON maker.flip_bid_guy USING btree (contract_address);


--
-- Name: flip_bid_lot_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_lot_bid_id_index ON maker.flip_bid_lot USING btree (bid_id);


--
-- Name: flip_bid_lot_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_lot_block_number_index ON maker.flip_bid_lot USING btree (block_number);


--
-- Name: flip_bid_lot_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_lot_contract_address_index ON maker.flip_bid_lot USING btree (contract_address);


--
-- Name: flip_bid_tab_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_tab_bid_id_index ON maker.flip_bid_tab USING btree (bid_id);


--
-- Name: flip_bid_tab_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_tab_block_number_index ON maker.flip_bid_tab USING btree (block_number);


--
-- Name: flip_bid_tab_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_tab_contract_address_index ON maker.flip_bid_tab USING btree (contract_address);


--
-- Name: flip_bid_tic_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_tic_bid_id_index ON maker.flip_bid_tic USING btree (bid_id);


--
-- Name: flip_bid_tic_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_tic_block_number_index ON maker.flip_bid_tic USING btree (block_number);


--
-- Name: flip_bid_tic_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_tic_contract_address_index ON maker.flip_bid_tic USING btree (contract_address);


--
-- Name: flip_bid_usr_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_usr_bid_id_index ON maker.flip_bid_usr USING btree (bid_id);


--
-- Name: flip_bid_usr_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_usr_block_number_index ON maker.flip_bid_usr USING btree (block_number);


--
-- Name: flip_bid_usr_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_bid_usr_contract_address_index ON maker.flip_bid_usr USING btree (contract_address);


--
-- Name: flip_ilk_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_ilk_block_number_index ON maker.flip_ilk USING btree (block_number);


--
-- Name: flip_ilk_ilk_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_ilk_ilk_id_index ON maker.flip_ilk USING btree (ilk_id);


--
-- Name: flip_kick_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_kick_bid_id_index ON maker.flip_kick USING btree (bid_id);


--
-- Name: flip_kick_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_kick_contract_address_index ON maker.flip_kick USING btree (contract_address);


--
-- Name: flip_kick_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_kick_header_index ON maker.flip_kick USING btree (header_id);


--
-- Name: flip_kicks_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_kicks_block_number_index ON maker.flip_kicks USING btree (block_number);


--
-- Name: flip_kicks_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_kicks_contract_address_index ON maker.flip_kicks USING btree (contract_address);


--
-- Name: flip_kicks_kicks_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_kicks_kicks_index ON maker.flip_kicks USING btree (kicks);


--
-- Name: flip_tick_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_tick_bid_id_index ON maker.flip_tick USING btree (bid_id);


--
-- Name: flip_tick_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flip_tick_header_index ON maker.flip_tick USING btree (header_id);


--
-- Name: flop_bid_bid_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_bid_bid_id_index ON maker.flop_bid_bid USING btree (bid_id);


--
-- Name: flop_bid_bid_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_bid_block_number_index ON maker.flop_bid_bid USING btree (block_number);


--
-- Name: flop_bid_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_bid_contract_address_index ON maker.flop_bid_bid USING btree (contract_address);


--
-- Name: flop_bid_end_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_end_bid_contract_address_index ON maker.flop_bid_end USING btree (contract_address);


--
-- Name: flop_bid_end_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_end_bid_id_index ON maker.flop_bid_end USING btree (bid_id);


--
-- Name: flop_bid_end_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_end_block_number_index ON maker.flop_bid_end USING btree (block_number);


--
-- Name: flop_bid_guy_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_guy_bid_contract_address_index ON maker.flop_bid_guy USING btree (contract_address);


--
-- Name: flop_bid_guy_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_guy_bid_id_index ON maker.flop_bid_guy USING btree (bid_id);


--
-- Name: flop_bid_guy_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_guy_block_number_index ON maker.flop_bid_guy USING btree (block_number);


--
-- Name: flop_bid_lot_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_lot_bid_contract_address_index ON maker.flop_bid_lot USING btree (contract_address);


--
-- Name: flop_bid_lot_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_lot_bid_id_index ON maker.flop_bid_lot USING btree (bid_id);


--
-- Name: flop_bid_lot_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_lot_block_number_index ON maker.flop_bid_lot USING btree (block_number);


--
-- Name: flop_bid_tic_bid_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_tic_bid_contract_address_index ON maker.flop_bid_tic USING btree (contract_address);


--
-- Name: flop_bid_tic_bid_id_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_tic_bid_id_index ON maker.flop_bid_tic USING btree (bid_id);


--
-- Name: flop_bid_tic_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_bid_tic_block_number_index ON maker.flop_bid_tic USING btree (block_number);


--
-- Name: flop_kick_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_kick_header_index ON maker.flop_kick USING btree (header_id);


--
-- Name: flop_kicks_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_kicks_block_number_index ON maker.flop_kicks USING btree (block_number);


--
-- Name: flop_kicks_contract_address_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_kicks_contract_address_index ON maker.flop_kicks USING btree (contract_address);


--
-- Name: flop_kicks_kicks_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX flop_kicks_kicks_index ON maker.flop_kicks USING btree (kicks);


--
-- Name: jug_drip_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_drip_header_index ON maker.jug_drip USING btree (header_id);


--
-- Name: jug_drip_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_drip_ilk_index ON maker.jug_drip USING btree (ilk_id);


--
-- Name: jug_file_base_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_file_base_header_index ON maker.jug_file_base USING btree (header_id);


--
-- Name: jug_file_ilk_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_file_ilk_header_index ON maker.jug_file_ilk USING btree (header_id);


--
-- Name: jug_file_ilk_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_file_ilk_ilk_index ON maker.jug_file_ilk USING btree (ilk_id);


--
-- Name: jug_file_vow_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_file_vow_header_index ON maker.jug_file_vow USING btree (header_id);


--
-- Name: jug_ilk_duty_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_ilk_duty_block_number_index ON maker.jug_ilk_duty USING btree (block_number);


--
-- Name: jug_ilk_duty_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_ilk_duty_ilk_index ON maker.jug_ilk_duty USING btree (ilk_id);


--
-- Name: jug_ilk_rho_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_ilk_rho_block_number_index ON maker.jug_ilk_rho USING btree (block_number);


--
-- Name: jug_ilk_rho_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_ilk_rho_ilk_index ON maker.jug_ilk_rho USING btree (ilk_id);


--
-- Name: jug_init_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_init_header_index ON maker.jug_init USING btree (header_id);


--
-- Name: jug_init_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX jug_init_ilk_index ON maker.jug_init USING btree (ilk_id);


--
-- Name: spot_file_mat_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_file_mat_header_index ON maker.spot_file_mat USING btree (header_id);


--
-- Name: spot_file_mat_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_file_mat_ilk_index ON maker.spot_file_mat USING btree (ilk_id);


--
-- Name: spot_file_pip_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_file_pip_header_index ON maker.spot_file_pip USING btree (header_id);


--
-- Name: spot_file_pip_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_file_pip_ilk_index ON maker.spot_file_pip USING btree (ilk_id);


--
-- Name: spot_ilk_mat_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_ilk_mat_block_number_index ON maker.spot_ilk_mat USING btree (block_number);


--
-- Name: spot_ilk_mat_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_ilk_mat_ilk_index ON maker.spot_ilk_mat USING btree (ilk_id);


--
-- Name: spot_ilk_pip_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_ilk_pip_block_number_index ON maker.spot_ilk_pip USING btree (block_number);


--
-- Name: spot_ilk_pip_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_ilk_pip_ilk_index ON maker.spot_ilk_pip USING btree (ilk_id);


--
-- Name: spot_poke_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_poke_header_index ON maker.spot_poke USING btree (header_id);


--
-- Name: spot_poke_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX spot_poke_ilk_index ON maker.spot_poke USING btree (ilk_id);


--
-- Name: tend_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX tend_header_index ON maker.tend USING btree (header_id);


--
-- Name: urn_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX urn_ilk_index ON maker.urns USING btree (ilk_id);


--
-- Name: vat_file_debt_ceiling_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_file_debt_ceiling_header_index ON maker.vat_file_debt_ceiling USING btree (header_id);


--
-- Name: vat_file_ilk_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_file_ilk_header_index ON maker.vat_file_ilk USING btree (header_id);


--
-- Name: vat_file_ilk_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_file_ilk_ilk_index ON maker.vat_file_ilk USING btree (ilk_id);


--
-- Name: vat_flux_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_flux_header_index ON maker.vat_flux USING btree (header_id);


--
-- Name: vat_flux_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_flux_ilk_index ON maker.vat_flux USING btree (ilk_id);


--
-- Name: vat_fold_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_fold_header_index ON maker.vat_fold USING btree (header_id);


--
-- Name: vat_fold_urn_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_fold_urn_index ON maker.vat_fold USING btree (urn_id);


--
-- Name: vat_fork_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_fork_header_index ON maker.vat_fork USING btree (header_id);


--
-- Name: vat_fork_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_fork_ilk_index ON maker.vat_fork USING btree (ilk_id);


--
-- Name: vat_frob_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_frob_header_index ON maker.vat_frob USING btree (header_id);


--
-- Name: vat_frob_urn_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_frob_urn_index ON maker.vat_frob USING btree (urn_id);


--
-- Name: vat_gem_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_gem_ilk_index ON maker.vat_gem USING btree (ilk_id);


--
-- Name: vat_grab_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_grab_header_index ON maker.vat_grab USING btree (header_id);


--
-- Name: vat_grab_urn_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_grab_urn_index ON maker.vat_grab USING btree (urn_id);


--
-- Name: vat_heal_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_heal_header_index ON maker.vat_heal USING btree (header_id);


--
-- Name: vat_ilk_art_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_art_block_number_index ON maker.vat_ilk_art USING btree (block_number);


--
-- Name: vat_ilk_art_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_art_ilk_index ON maker.vat_ilk_art USING btree (ilk_id);


--
-- Name: vat_ilk_dust_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_dust_block_number_index ON maker.vat_ilk_dust USING btree (block_number);


--
-- Name: vat_ilk_dust_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_dust_ilk_index ON maker.vat_ilk_dust USING btree (ilk_id);


--
-- Name: vat_ilk_line_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_line_block_number_index ON maker.vat_ilk_line USING btree (block_number);


--
-- Name: vat_ilk_line_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_line_ilk_index ON maker.vat_ilk_line USING btree (ilk_id);


--
-- Name: vat_ilk_rate_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_rate_block_number_index ON maker.vat_ilk_rate USING btree (block_number);


--
-- Name: vat_ilk_rate_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_rate_ilk_index ON maker.vat_ilk_rate USING btree (ilk_id);


--
-- Name: vat_ilk_spot_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_spot_block_number_index ON maker.vat_ilk_spot USING btree (block_number);


--
-- Name: vat_ilk_spot_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_ilk_spot_ilk_index ON maker.vat_ilk_spot USING btree (ilk_id);


--
-- Name: vat_init_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_init_header_index ON maker.vat_init USING btree (header_id);


--
-- Name: vat_init_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_init_ilk_index ON maker.vat_init USING btree (ilk_id);


--
-- Name: vat_move_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_move_header_index ON maker.vat_move USING btree (header_id);


--
-- Name: vat_slip_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_slip_header_index ON maker.vat_slip USING btree (header_id);


--
-- Name: vat_slip_ilk_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_slip_ilk_index ON maker.vat_slip USING btree (ilk_id);


--
-- Name: vat_suck_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_suck_header_index ON maker.vat_suck USING btree (header_id);


--
-- Name: vat_urn_art_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_urn_art_block_number_index ON maker.vat_urn_art USING btree (block_number);


--
-- Name: vat_urn_art_urn_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_urn_art_urn_index ON maker.vat_urn_art USING btree (urn_id);


--
-- Name: vat_urn_ink_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_urn_ink_block_number_index ON maker.vat_urn_ink USING btree (block_number);


--
-- Name: vat_urn_ink_urn_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vat_urn_ink_urn_index ON maker.vat_urn_ink USING btree (urn_id);


--
-- Name: vow_fess_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vow_fess_header_index ON maker.vow_fess USING btree (header_id);


--
-- Name: vow_file_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vow_file_header_index ON maker.vow_file USING btree (header_id);


--
-- Name: vow_flog_era_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vow_flog_era_index ON maker.vow_flog USING btree (era);


--
-- Name: vow_flog_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vow_flog_header_index ON maker.vow_flog USING btree (header_id);


--
-- Name: vow_sin_mapping_block_number_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vow_sin_mapping_block_number_index ON maker.vow_sin_mapping USING btree (block_number);


--
-- Name: vow_sin_mapping_era_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX vow_sin_mapping_era_index ON maker.vow_sin_mapping USING btree (era);


--
-- Name: yank_header_index; Type: INDEX; Schema: maker; Owner: -
--

CREATE INDEX yank_header_index ON maker.yank USING btree (header_id);


--
-- Name: block_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX block_id_index ON public.full_sync_transactions USING btree (block_id);


--
-- Name: headers_block_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX headers_block_number ON public.headers USING btree (block_number);


--
-- Name: node_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX node_id_index ON public.blocks USING btree (eth_node_id);


--
-- Name: number_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX number_index ON public.blocks USING btree (number);


--
-- Name: tx_from_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tx_from_index ON public.full_sync_transactions USING btree (tx_from);


--
-- Name: tx_to_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tx_to_index ON public.full_sync_transactions USING btree (tx_to);


--
-- Name: bite bite_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.bite
    ADD CONSTRAINT bite_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: bite bite_urn_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.bite
    ADD CONSTRAINT bite_urn_id_fkey FOREIGN KEY (urn_id) REFERENCES maker.urns(id) ON DELETE CASCADE;


--
-- Name: cat_file_chop_lump cat_file_chop_lump_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_chop_lump
    ADD CONSTRAINT cat_file_chop_lump_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: cat_file_chop_lump cat_file_chop_lump_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_chop_lump
    ADD CONSTRAINT cat_file_chop_lump_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: cat_file_flip cat_file_flip_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_flip
    ADD CONSTRAINT cat_file_flip_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: cat_file_flip cat_file_flip_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_flip
    ADD CONSTRAINT cat_file_flip_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: cat_file_vow cat_file_vow_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_file_vow
    ADD CONSTRAINT cat_file_vow_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: cat_ilk_chop cat_ilk_chop_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_chop
    ADD CONSTRAINT cat_ilk_chop_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: cat_ilk_flip cat_ilk_flip_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_flip
    ADD CONSTRAINT cat_ilk_flip_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: cat_ilk_lump cat_ilk_lump_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cat_ilk_lump
    ADD CONSTRAINT cat_ilk_lump_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: cdp_manager_ilks cdp_manager_ilks_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.cdp_manager_ilks
    ADD CONSTRAINT cdp_manager_ilks_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: deal deal_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.deal
    ADD CONSTRAINT deal_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: dent dent_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.dent
    ADD CONSTRAINT dent_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: flap_kick flap_kick_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flap_kick
    ADD CONSTRAINT flap_kick_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: flip_ilk flip_ilk_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_ilk
    ADD CONSTRAINT flip_ilk_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: flip_kick flip_kick_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_kick
    ADD CONSTRAINT flip_kick_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: flip_tick flip_tick_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flip_tick
    ADD CONSTRAINT flip_tick_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: flop_kick flop_kick_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.flop_kick
    ADD CONSTRAINT flop_kick_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: jug_drip jug_drip_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_drip
    ADD CONSTRAINT jug_drip_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: jug_drip jug_drip_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_drip
    ADD CONSTRAINT jug_drip_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: jug_file_base jug_file_base_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_base
    ADD CONSTRAINT jug_file_base_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: jug_file_ilk jug_file_ilk_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_ilk
    ADD CONSTRAINT jug_file_ilk_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: jug_file_ilk jug_file_ilk_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_ilk
    ADD CONSTRAINT jug_file_ilk_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: jug_file_vow jug_file_vow_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_file_vow
    ADD CONSTRAINT jug_file_vow_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: jug_ilk_duty jug_ilk_duty_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_ilk_duty
    ADD CONSTRAINT jug_ilk_duty_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: jug_ilk_rho jug_ilk_rho_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_ilk_rho
    ADD CONSTRAINT jug_ilk_rho_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: jug_init jug_init_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_init
    ADD CONSTRAINT jug_init_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: jug_init jug_init_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.jug_init
    ADD CONSTRAINT jug_init_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: spot_file_mat spot_file_mat_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_mat
    ADD CONSTRAINT spot_file_mat_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: spot_file_mat spot_file_mat_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_mat
    ADD CONSTRAINT spot_file_mat_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: spot_file_pip spot_file_pip_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_pip
    ADD CONSTRAINT spot_file_pip_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: spot_file_pip spot_file_pip_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_file_pip
    ADD CONSTRAINT spot_file_pip_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: spot_ilk_mat spot_ilk_mat_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_ilk_mat
    ADD CONSTRAINT spot_ilk_mat_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: spot_ilk_pip spot_ilk_pip_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_ilk_pip
    ADD CONSTRAINT spot_ilk_pip_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: spot_poke spot_poke_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_poke
    ADD CONSTRAINT spot_poke_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: spot_poke spot_poke_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.spot_poke
    ADD CONSTRAINT spot_poke_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: tend tend_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.tend
    ADD CONSTRAINT tend_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: urns urns_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.urns
    ADD CONSTRAINT urns_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_file_debt_ceiling vat_file_debt_ceiling_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_debt_ceiling
    ADD CONSTRAINT vat_file_debt_ceiling_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_file_ilk vat_file_ilk_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_ilk
    ADD CONSTRAINT vat_file_ilk_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_file_ilk vat_file_ilk_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_file_ilk
    ADD CONSTRAINT vat_file_ilk_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_flux vat_flux_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_flux
    ADD CONSTRAINT vat_flux_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_flux vat_flux_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_flux
    ADD CONSTRAINT vat_flux_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_fold vat_fold_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fold
    ADD CONSTRAINT vat_fold_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_fold vat_fold_urn_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fold
    ADD CONSTRAINT vat_fold_urn_id_fkey FOREIGN KEY (urn_id) REFERENCES maker.urns(id) ON DELETE CASCADE;


--
-- Name: vat_fork vat_fork_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fork
    ADD CONSTRAINT vat_fork_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_fork vat_fork_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_fork
    ADD CONSTRAINT vat_fork_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_frob vat_frob_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_frob
    ADD CONSTRAINT vat_frob_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_frob vat_frob_urn_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_frob
    ADD CONSTRAINT vat_frob_urn_id_fkey FOREIGN KEY (urn_id) REFERENCES maker.urns(id) ON DELETE CASCADE;


--
-- Name: vat_gem vat_gem_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_gem
    ADD CONSTRAINT vat_gem_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_grab vat_grab_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_grab
    ADD CONSTRAINT vat_grab_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_grab vat_grab_urn_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_grab
    ADD CONSTRAINT vat_grab_urn_id_fkey FOREIGN KEY (urn_id) REFERENCES maker.urns(id) ON DELETE CASCADE;


--
-- Name: vat_heal vat_heal_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_heal
    ADD CONSTRAINT vat_heal_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_ilk_art vat_ilk_art_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_art
    ADD CONSTRAINT vat_ilk_art_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_ilk_dust vat_ilk_dust_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_dust
    ADD CONSTRAINT vat_ilk_dust_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_ilk_line vat_ilk_line_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_line
    ADD CONSTRAINT vat_ilk_line_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_ilk_rate vat_ilk_rate_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_rate
    ADD CONSTRAINT vat_ilk_rate_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_ilk_spot vat_ilk_spot_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_ilk_spot
    ADD CONSTRAINT vat_ilk_spot_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_init vat_init_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_init
    ADD CONSTRAINT vat_init_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_init vat_init_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_init
    ADD CONSTRAINT vat_init_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_move vat_move_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_move
    ADD CONSTRAINT vat_move_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_slip vat_slip_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_slip
    ADD CONSTRAINT vat_slip_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_slip vat_slip_ilk_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_slip
    ADD CONSTRAINT vat_slip_ilk_id_fkey FOREIGN KEY (ilk_id) REFERENCES maker.ilks(id) ON DELETE CASCADE;


--
-- Name: vat_suck vat_suck_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_suck
    ADD CONSTRAINT vat_suck_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vat_urn_art vat_urn_art_urn_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_urn_art
    ADD CONSTRAINT vat_urn_art_urn_id_fkey FOREIGN KEY (urn_id) REFERENCES maker.urns(id) ON DELETE CASCADE;


--
-- Name: vat_urn_ink vat_urn_ink_urn_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vat_urn_ink
    ADD CONSTRAINT vat_urn_ink_urn_id_fkey FOREIGN KEY (urn_id) REFERENCES maker.urns(id) ON DELETE CASCADE;


--
-- Name: vow_fess vow_fess_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_fess
    ADD CONSTRAINT vow_fess_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vow_file vow_file_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_file
    ADD CONSTRAINT vow_file_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: vow_flog vow_flog_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.vow_flog
    ADD CONSTRAINT vow_flog_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: yank yank_header_id_fkey; Type: FK CONSTRAINT; Schema: maker; Owner: -
--

ALTER TABLE ONLY maker.yank
    ADD CONSTRAINT yank_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: full_sync_receipts blocks_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.full_sync_receipts
    ADD CONSTRAINT blocks_fk FOREIGN KEY (block_id) REFERENCES public.blocks(id) ON DELETE CASCADE;


--
-- Name: checked_headers checked_headers_header_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.checked_headers
    ADD CONSTRAINT checked_headers_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: full_sync_transactions full_sync_transactions_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.full_sync_transactions
    ADD CONSTRAINT full_sync_transactions_block_id_fkey FOREIGN KEY (block_id) REFERENCES public.blocks(id) ON DELETE CASCADE;


--
-- Name: header_sync_receipts header_sync_receipts_header_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_receipts
    ADD CONSTRAINT header_sync_receipts_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: header_sync_receipts header_sync_receipts_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_receipts
    ADD CONSTRAINT header_sync_receipts_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.header_sync_transactions(id) ON DELETE CASCADE;


--
-- Name: header_sync_transactions header_sync_transactions_header_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.header_sync_transactions
    ADD CONSTRAINT header_sync_transactions_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.headers(id) ON DELETE CASCADE;


--
-- Name: headers headers_eth_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.headers
    ADD CONSTRAINT headers_eth_node_id_fkey FOREIGN KEY (eth_node_id) REFERENCES public.eth_nodes(id) ON DELETE CASCADE;


--
-- Name: blocks node_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT node_fk FOREIGN KEY (eth_node_id) REFERENCES public.eth_nodes(id) ON DELETE CASCADE;


--
-- Name: logs receipts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT receipts_fk FOREIGN KEY (receipt_id) REFERENCES public.full_sync_receipts(id) ON DELETE CASCADE;


--
-- Name: uncles uncles_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uncles
    ADD CONSTRAINT uncles_block_id_fkey FOREIGN KEY (block_id) REFERENCES public.blocks(id) ON DELETE CASCADE;


--
-- Name: uncles uncles_eth_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uncles
    ADD CONSTRAINT uncles_eth_node_id_fkey FOREIGN KEY (eth_node_id) REFERENCES public.eth_nodes(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

