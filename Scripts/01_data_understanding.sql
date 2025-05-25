/*
-- Script: 01_data_understanding.sql
-- Objective: Initial data exploration and cleaning plan for Titanic dataset

-- Steps covered:
-- 1. Create and use database
-- 2. Duplicate row check
-- 3. Basic row and column stats (count distincts, nulls)
-- 4. Insights
*/

-- Create database and use it
CREATE DATABASE IF NOT EXISTS TITANIC_DB;
USE TITANIC_DB;

-- Download titanic dataset from kaggle as csv
-- Import the table via Table Data Import Wizard as titanic_raw_dataset 

-- Check columns and data types
DESCRIBE titanic_raw_dataset;

-- Get total number of rows for percentage calculations
SET @total_rows = (SELECT COUNT(*) FROM titanic_raw_dataset);

-- Check total rows
SELECT @total_rows AS total_rows;

-- View first 5 records for quick inspection
SELECT * FROM titanic_raw_dataset LIMIT 5;

-- Check for duplicate rows
SELECT *
FROM titanic_raw_dataset
GROUP BY PassengerId, Survived, Pclass, Name, Sex, Age, SibSp, Parch, Ticket, Fare, Cabin, Embarked
HAVING count(*) > 1;

-- Check number of distinct values per column
SELECT 
    COUNT(DISTINCT PassengerId) AS unique_pid_count,
    COUNT(DISTINCT Survived) AS unique_survived_count,
    COUNT(DISTINCT Pclass) AS unique_pclass_count,
    COUNT(DISTINCT Name) AS unique_name_count,
    COUNT(DISTINCT Sex) AS unique_sex_count,
    COUNT(DISTINCT Age) AS unique_age_count,
    COUNT(DISTINCT SibSp) AS unique_sibsp_count,
    COUNT(DISTINCT Parch) AS unique_parch_count,
    COUNT(DISTINCT Ticket) AS unique_ticket_count,
    COUNT(DISTINCT Fare) AS unique_fare_count,
    COUNT(DISTINCT Cabin) AS unique_cabin_count,
    COUNT(DISTINCT Embarked) AS unique_embarked_count
FROM titanic_raw_dataset;

-- Check % of null or empty values in each column
SELECT 
    SUM(CASE WHEN PassengerId IS NULL THEN 1 ELSE 0 END)*100/@total_rows AS null_pid_pct,
    SUM(CASE WHEN Survived IS NULL THEN 1 ELSE 0 END)*100/@total_rows AS null_survived_pct,
    SUM(CASE WHEN Pclass IS NULL THEN 1 ELSE 0 END)*100/@total_rows AS null_pclass_pct,
    SUM(CASE WHEN Name IS NULL OR Name = '' THEN 1 ELSE 0 END)*100/@total_rows AS null_name_pct,
    SUM(CASE WHEN Sex IS NULL OR Sex = '' THEN 1 ELSE 0 END)*100/@total_rows AS null_sex_pct,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END)*100/@total_rows AS null_age_pct,
    SUM(CASE WHEN SibSp IS NULL THEN 1 ELSE 0 END)*100/@total_rows AS null_sibsp_pct,
    SUM(CASE WHEN Parch IS NULL THEN 1 ELSE 0 END)*100/@total_rows AS null_parch_pct,
    SUM(CASE WHEN Ticket IS NULL THEN 1 ELSE 0 END)*100/@total_rows AS null_ticket_pct,
    SUM(CASE WHEN Fare IS NULL THEN 1 ELSE 0 END)*100/@total_rows AS null_fare_pct,
    SUM(CASE WHEN Cabin IS NULL OR Cabin = '' THEN 1 ELSE 0 END)*100/@total_rows AS null_cabin_pct,
    SUM(CASE WHEN Embarked IS NULL OR Embarked = '' THEN 1 ELSE 0 END)*100/@total_rows AS null_embarked_pct
FROM titanic_raw_dataset;


/*

--------INSIGHTS--------

# No duplicate rows found.

# Cabin column has 74% null values, drop it.

# Embarked column has 0.2% null values, impute it with mode.

# Columns to drop as they are less useful or identifiers: PassengerId, Name, Ticket, Cabin.

# Measures: Age (years), Fare (currency assumed pounds)

# Dimensions: Survived (target variable), Pclass, Sex, Embarked, SibSp (siblings/spouses aboard), Parch (parents/children aboard).


*/

