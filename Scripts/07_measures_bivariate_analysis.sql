/*
-- Script: 07_measures_bivariate_analysis.sql
-- Objective: Check distribution of Age & Fare with respect to survival
-- Approximate quartiles using row_number: not exact for even-sized groups
*/

-- Get count of survived vs not survived
SET @total_survived = (SELECT COUNT(*) FROM titanic WHERE Survived = 1);
SET @total_died     = (SELECT COUNT(*) FROM titanic WHERE Survived = 0);

SELECT @total_survived AS total_survived, @total_died AS total_died;

-- ---------- AGE ----------
with age_table as (
SELECT  Age, Survived, 
row_number() over (partition by Survived order by Age) AS row_num
FROM titanic
)
SELECT  Survived, 
MIN(Age) AS min_age, 
MAX(Age) as max_age, 
AVG(Age) AS avg_age,
STD(Age) AS std_dev,
AVG(case when row_num = cast((case when Survived then @total_survived else @total_died end)/2 as unsigned) then Age end) as q2,
AVG(case when row_num = cast((case when Survived then @total_survived else @total_died end)/4 as unsigned) then Age end) as q1,
AVG(case when row_num = cast(((case when Survived then @total_survived else @total_died end)*3)/4 as unsigned) then Age end) as q3
FROM age_table
GROUP BY Survived;


-- ---------- Fare ----------
with Fare_table as (
SELECT  Fare, Survived, 
row_number() over (partition by Survived order by Fare) AS row_num
FROM titanic
)
SELECT  Survived, 
MIN(Fare) AS min_Fare, 
MAX(Fare) as max_Fare, 
AVG(Fare) AS avg_Fare,
STD(Fare) AS std_dev,
AVG(case when row_num = cast((case when Survived then @total_survived else @total_died end)/2 as unsigned) then Fare end) as q2,
AVG(case when row_num = cast((case when Survived then @total_survived else @total_died end)/4 as unsigned) then Fare end) as q1,
AVG(case when row_num = cast(((case when Survived then @total_survived else @total_died end)*3)/4 as unsigned) then Fare end) as q3
FROM Fare_table
GROUP BY Survived;


/*
-- -------- Insights --------

-- AGE:
# Passengers who died-> Min: 1, Max: 74, Avg: 30.5, Median: 28, Std Dev: 14.2, Q1: 21, Q3: 39, IQR = 18
# Passengers who survived-> Min: 0, Max: 80, Avg: 28.3, Median: 28, Std Dev: 14.9, Q1: 19, Q3: 36, IQR = 17
# => Age distribution is very similar between survived and died. No significant age-based survival advantage.

-- FARE:
# Passengers who died    -> Min: 0, Max: 263,   Avg: 23,   Median: 11.5, Std Dev: 31, Q1: 7.9, Q3: 26.6, IQR = 18.7
# Passengers who survived-> Min: 0, Max: 512.3, Avg: 51.8, Median: 26.3, Std Dev: 70, Q1: 13.0, Q3: 66.6, IQR = 53.6
# => Survivors tended to pay higher fares on average.
# => Many passengers who died paid low fares, while high-fare passengers were more likely to survive.
*/
