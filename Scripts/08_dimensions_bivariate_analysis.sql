/*
-- Script: 08_dimensions_bivariate_analysis.sql
-- Objective: Check distribution with respect to survival for following dimensions:- Pclass, Sex, Embarked, SibSp, Parch
-- Also analyse Embarked with Pclass
*/

-- ---------- Pclass ----------
select Pclass, avg(Survived)*100 as pct_survived
from titanic
group by Pclass
order by Pclass;

-- ---------- Sex ----------
select Sex, avg(Survived)*100 as pct_survived
from titanic
group by Sex;

-- ---------- Embarked ----------
select Embarked, avg(Survived)*100 as pct_survived
from titanic
group by Embarked;

# Embarked with Pclass
with t as (
select Embarked, Pclass, count(*) as cnt
from titanic
group by Embarked, Pclass
)
select Embarked, Pclass, cnt*100/sum(cnt) over (partition by Embarked) as pct_pclass
from t
order by Embarked, Pclass;


-- ---------- SibSp ----------
SELECT SibSp, avg(Survived)*100 as pct_survived
from titanic
group by SibSp
order by SibSp;

-- ---------- Parch ----------
SELECT Parch, avg(Survived)*100 as pct_survived
from titanic
group by Parch
order by Parch;


/*
-- -------- Insights --------

-- Pclass:
# Survival % -> Pclass 1: 65.6%, 2: 48%, 3: 24%
# => Pclass 1 passengers are most likely to survive while Pclass 3 least likely

-- Sex:
# Survival % -> male: 20.5%, female: 75.4%
# => Female passengers were most likely to survive

-- Embarked:
# Survival % -> C: 60.7%, Q: 28.5%, S: 36.5%
# Embarked distribution -> S (Southampton): 77.9%, C (Cherbourg): 18.2%, Q (Queenstown): 3.9%
# => Passengers boarded from Cherbourg were most likely to survive
# => Maximum passsengers from Cherbourg were in Pclass 1, explaining higher survival.
# => Queenstown had mostly Pclass 3 passengers, explaining the lower survival

-- SibSp:
# Survival % -> 0: 37%, 1: 53%, 2: 44%, 3: 33%, 4: 16%, 5:0%
# Most passengers had 0 or 1 sibling/spouse aboard (as per univariate)
# => Passengers with 1 sibling or spouse were more likely to survive than those with none
# => Survival dropped sharply for larger family groups (4–5), possibly due to evacuation challenges

-- Parch:
# Survival % -> 0: 35.7%, 1: 55.5%, 2: 57%, 3: 60%, 4: 0%, 5:20%, 6: 0%
# Most passengers had 0–2 parents/children aboard (as per univariate); very few had 3 or more 
# => Passengers with 1 or 2 parents/children were more likely to survive than those with none
# => Although rare, those with 3 parents/children showed the highest survival
# => Larger families (4–6) were least likely to survive
*/


