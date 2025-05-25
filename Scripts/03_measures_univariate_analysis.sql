/*
-- Script: 03_measures_univariate_analysis.sql
-- Objective: Check descriptive statistics of continuous measures (Age, Fare)
-- Approximate quartiles using row_number: not exact for even-sized groups
*/

-- Set total rows
SET @total_rows = (SELECT COUNT(*) FROM titanic);

-- ---------- AGE ----------
WITH age_table AS (
  SELECT Age, ROW_NUMBER() OVER (ORDER BY Age) AS row_num
  FROM titanic
)
SELECT  
  MIN(Age) AS min_age, 
  MAX(Age) AS max_age,
  AVG(Age) AS avg_age,
  STD(Age) AS std_dev,
  AVG(CASE WHEN row_num IN (CEIL((@total_rows + 1)/2), FLOOR((@total_rows + 1)/2)) THEN Age END) AS median_age,
  AVG(CASE WHEN row_num = FLOOR(@total_rows / 4) THEN Age END) AS q1,
  AVG(CASE WHEN row_num = FLOOR((@total_rows * 3)/4) THEN Age END) AS q3
FROM age_table;

-- ---------- FARE ----------
WITH fare_table AS (
  SELECT Fare, ROW_NUMBER() OVER (ORDER BY Fare) AS row_num
  FROM titanic
)
SELECT  
  MIN(Fare) AS min_fare, 
  MAX(Fare) AS max_fare,
  AVG(Fare) AS avg_fare,
  STD(Fare) AS std_dev,
  AVG(CASE WHEN row_num IN (CEIL((@total_rows + 1)/2), FLOOR((@total_rows + 1)/2)) THEN Fare END) AS median_fare,
  AVG(CASE WHEN row_num = FLOOR(@total_rows / 4) THEN Fare END) AS q1,
  AVG(CASE WHEN row_num = FLOOR((@total_rows * 3)/4) THEN Fare END) AS q3
FROM fare_table;

/*
-- -------- Insights --------
-- AGE:
# Min: 0, Max: 80, Avg: 29.7, Median: 28, Std Dev: 14.5
# Q1: 20, Q3: 38 → IQR = 18
# Range without outliers (Q1 - 1.5*IQR to Q3 + 1.5*IQR): [-7, 65]
# Most ages are in 20–38 range; a few elderly passengers >65 are outliers.
# Std dev is high, indicating wide age variance.

-- FARE:
# Min: 0, Max: 512.3, Avg: 34.7, Median: 15.7, Std Dev: 52.8
# Q1: 8.05, Q3: 33 → IQR = 24.95
# Range without outliers: [-29, 70.4]
# Most passengers paid low fares, but a few paid very high (right-skewed distribution).
# High std dev reflects wide variance in ticket prices.
*/
