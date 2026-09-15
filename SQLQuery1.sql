--Creating Data Base MarketPulse
CREATE DATABASE MarketPulse;
-- Creating tables(assets,price_history) in the data base
USE MarketPulse;

CREATE TABLE assets (
    asset_id INT IDENTITY(1,1) PRIMARY KEY,
    symbol VARCHAR(10) UNIQUE
);

CREATE TABLE price_history (
    id INT IDENTITY(1,1) PRIMARY KEY,
    symbol VARCHAR(10),
    price_date DATE,
    close_price DECIMAL(18,2),
    volume BIGINT
);
--View tables
SELECT * FROM assets;
SELECT * FROM price_history;
--After doing all steps in python Clean data and load it into sql server then run below code
SELECT * FROM price_history;
SELECT DISTINCT symbol FROM price_history;
--Fill the assets Table
INSERT INTO assets (symbol)
SELECT DISTINCT symbol FROM price_history
WHERE symbol NOT IN (SELECT symbol FROM assets);
SELECT * FROM assets;
--Run Simple Analysis Queries in SSMS
-- Average price per stock
SELECT symbol, AVG(close_price) AS avg_price
FROM price_history
GROUP BY symbol;

-- Highest price per stock
SELECT symbol, MAX(close_price) AS highest_price
FROM price_history
GROUP BY symbol;