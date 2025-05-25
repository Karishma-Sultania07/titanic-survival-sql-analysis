/*
-- Script: 05_feature_engineering.sql
-- Objective: Create new features (4 new dimensions) using existing ones

-- Steps covered:
-- 1. Create AgeGroup using Age column and update table
-- 2. Create FareRange using quartiles for Fare column and update table
-- 3. Create IsAlone column
-- 4. Create FamilySize column
*/

-- Take backup of titanic dataset to be safe
CREATE TABLE titanic_backup AS (SELECT * FROM titanic);

# Safe update mode off
SET SQL_SAFE_UPDATES = 0;

-- ---------- AgeGroup ----------
ALTER TABLE titanic 
ADD COLUMN AgeGroup TEXT;

UPDATE titanic 
SET AgeGroup = 
  CASE 
    WHEN Age <= 2  THEN '1_infant'
    WHEN Age <= 12 THEN '2_child'
    WHEN Age <= 19 THEN '3_teenager'
    WHEN Age <= 35 THEN '4_young_adult'
    WHEN Age <= 59 THEN '5_adult'
    ELSE 'senior'
  END;

-- ---------- FareRange ----------
ALTER TABLE titanic 
ADD COLUMN FareRange TEXT;

UPDATE titanic 
SET FareRange = 
  CASE 
    WHEN Fare<=8.05 THEN '1_low_fare' 
    WHEN Fare<=33.0 THEN '2_mid_fare'
    WHEN Fare<=70.4 THEN '3_high_fare'
    ELSE 'very_high_fare'
  END;
  
-- ---------- IsAlone ----------
ALTER TABLE titanic 
ADD COLUMN IsAlone TINYINT;

UPDATE titanic 
SET IsAlone = 
  CASE 
    WHEN SibSp+Parch = 0 THEN 1
    ELSE 0
  END;

-- ---------- FamilySize ----------
ALTER TABLE titanic 
ADD COLUMN FamilySize INT;

UPDATE titanic 
SET FamilySize = SibSp+Parch;

# Safe update mode on
SET SQL_SAFE_UPDATES = 1;
