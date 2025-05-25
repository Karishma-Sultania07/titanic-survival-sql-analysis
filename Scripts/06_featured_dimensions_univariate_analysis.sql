/*
-- Script: 06_featured_dimensions_univariate_analysis.sql
-- Objective: Check value counts for AgeGroup, FareRange, IsAlone, FamilySize
*/

-- Set total rows
SET @total_rows = (SELECT COUNT(*) FROM titanic);

-- ---------- AgeGroup ----------
SELECT AgeGroup, count(*) as total_count, count(*)*100/@total_rows AS total_pct
from titanic
group by AgeGroup
order by AgeGroup;

-- ---------- FareRange ----------
SELECT FareRange, count(*) as total_count, count(*)*100/@total_rows AS total_pct
from titanic
group by FareRange
order by FareRange;

-- ---------- IsAlone ----------
SELECT IsAlone, count(*) as total_count, count(*)*100/@total_rows AS total_pct
from titanic
group by IsAlone;

-- ---------- FamilySize ----------
SELECT FamilySize, count(*) as total_count, count(*)*100/@total_rows AS total_pct
from titanic
group by FamilySize
order by FamilySize;

/*
-- -------- Insights --------

-- AgeGroup:
# 3.4% infants, 6.3% children, 13.3% teenagers, 46.6% young_adults, 26.7% adults, 3.6% seniors
# Age is kind of normally distributed
# Maximum young_adults are there
# Less no. of infants or children or seniors are there

-- FareRange:
# low_fare_pct, # 26.8%
# mid_fare_pct, # 48.2%
# high_fare_pct, # 11.5%
# very_high_fare_pct # 13.6%
# Maximum passengers are paying medium fare 

-- IsAlone
# 56.6% passengers are travelling alone, confirming high individual travel rate.
# 43.4% are travelling with family

-- FamilySize
# 0 -> 56.6%
# 1 -> 19.5%
# 2 -> 13.0%
# 3 -> 3.78%
# 4 -> 1.54%
# 5 -> 3.08%
# 6 -> 1.68%
# 7 -> 0.84%
# Family sizes above 2 were rare.
*/
