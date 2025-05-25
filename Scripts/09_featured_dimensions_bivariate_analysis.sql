/*
-- Script: 09_featured_dimensions_bivariate_analysis.sql
-- Objective: Check distribution with respect to survival for following dimensions:- AgeGroup, FareRange, IsAlone, FamilySize
*/

-- ---------- AgeGroup ----------
select AgeGroup, avg(Survived)*100 as pct_survived
from titanic
group by AgeGroup
order by AgeGroup;

-- ---------- FareRange ----------
select FareRange, avg(Survived)*100 as pct_survived
from titanic
group by FareRange
order by FareRange;

-- ---------- IsAlone ----------
select IsAlone, avg(Survived)*100 as pct_survived
from titanic
group by IsAlone;

-- ---------- FamilySize ----------
select FamilySize, avg(Survived)*100 as pct_survived
from titanic
group by FamilySize
order by FamilySize;

/*
-- -------- Insights --------

-- AgeGroup:
# Survival % -> infant: 62.5%, child: 56%, teenager: 41%, young_adult: 38%, adult: 40%, senior: 27%
# => Younger passengers (infants and children) had higher survival rates; seniors had lowest survival.
# => Age has some impact on survival, but groups like infants and seniors are rare.

-- FareRange:
# Survival % -> low_fare: 20%, mid_fare: 41%, high_fare: 50%,very_high_fare: 72%
# => With increasing fare, chances of survival increased

-- IsAlone:
# Survival % -> yes: 32%, no: 51.6%
# => Chances of people with family to survive is higher

-- FamilySize:
# Survival % -> 0: 32%, 1: 55%, 2: 57%, 3: 78%, 4: 27%, 5: 14%, 6: 33%, 7: 0%
# familysize > 2 is rare (as per univariate)
# => Chances of survival for people with 1 or 2 family member is higher than those alone.
# => Larger families (4 or more) had lower survival rates, possibly due to evacuation challenges.

*/







