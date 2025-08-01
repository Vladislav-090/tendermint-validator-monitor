-- +goose Up
CREATE TABLE validators (
    id SERIAL PRIMARY KEY,
    address VARCHAR(128) NOT NULL,
    name VARCHAR(128),
    status VARCHAR(32) NOT NULL,
    network VARCHAR(32) NOT NULL,
    commission FLOAT,
    uptime FLOAT,
    last_seen TIMESTAMP
);

CREATE TABLE blocks (
    id SERIAL PRIMARY KEY,
    height INTEGER NOT NULL,
    hash VARCHAR(128) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    network VARCHAR(32) NOT NULL
);

CREATE TABLE validator_rewards (
    id SERIAL PRIMARY KEY,
    validator_id INTEGER REFERENCES validators(id),
    amount FLOAT NOT NULL,
    currency VARCHAR(32) NOT NULL,
    amount_usdt FLOAT,
    timestamp TIMESTAMP NOT NULL,
    network VARCHAR(32) NOT NULL
);

-- +goose Down
DROP TABLE IF EXISTS validator_rewards;
DROP TABLE IF EXISTS blocks;
DROP TABLE IF EXISTS validators;
