/*
-- Script: 02_data_cleaning.sql
-- Objective: Data cleaning

-- Steps covered:
-- 1. Drop unnecessary columns
-- 2. Imputing missing values in Embarked with mode
*/

-- Create new table to be safe 
CREATE TABLE titanic AS (SELECT * FROM titanic_raw_dataset);

-- Drop PassengerId, Name, Ticket, Cabin
ALTER TABLE titanic
  DROP COLUMN PassengerId,
  DROP COLUMN Name,
  DROP COLUMN Ticket,
  DROP COLUMN Cabin;

-- Find Mode of Embarked
SELECT Embarked, COUNT(*) AS emb_count
FROM titanic
GROUP BY Embarked
ORDER BY emb_count DESC
LIMIT 1;

-- Safe update mode off
SET SQL_SAFE_UPDATES = 0;

-- Mode is S, so impute null with S
UPDATE titanic 
SET Embarked = 'S'
WHERE Embarked is null or Embarked = '';

-- Check null or empty
select count(*) 
from titanic 
where Embarked is null or Embarked = '';

-- Safe update mode on
SET SQL_SAFE_UPDATES = 1;



