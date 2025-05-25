/*
-- Script: 04_dimensions_univariate_analysis.sql
-- Objective: Check value counts of dimensions (Survived (target variable), Pclass, Sex, Embarked, SibSp , Parch)
*/

-- Set total rows
SET @total_rows = (SELECT COUNT(*) FROM titanic);

-- ---------- Survived ----------
SELECT Survived, COUNT(*) AS total_count, ROUND(COUNT(*)*100/@total_rows, 1) AS total_pct
FROM titanic
GROUP BY Survived;

-- ---------- Pclass ----------
SELECT Pclass, COUNT(*) AS total_count, ROUND(COUNT(*)*100/@total_rows, 1) AS total_pct
FROM titanic
GROUP BY Pclass
ORDER BY Pclass;

-- ---------- Sex ----------
SELECT Sex, COUNT(*) AS total_count, ROUND(COUNT(*)*100/@total_rows, 1) AS total_pct
FROM titanic
GROUP BY Sex;

-- ---------- Embarked ----------
SELECT Embarked, COUNT(*) AS total_count, ROUND(COUNT(*)*100/@total_rows, 1) AS total_pct
FROM titanic
GROUP BY Embarked;

-- ---------- SibSp ----------
SELECT SibSp, COUNT(*) AS total_count, ROUND(COUNT(*)*100/@total_rows, 1) AS total_pct
FROM titanic
GROUP BY SibSp
ORDER BY SibSp;

-- ---------- Parch ----------
SELECT Parch, COUNT(*) AS total_count, ROUND(COUNT(*)*100/@total_rows, 1) AS total_pct
FROM titanic
GROUP BY Parch
ORDER BY Parch;


/*
-- -------- Insights --------

-- Survived:
# 40.6% passengers survived, 59.4% did not.
# => Majority of the passengers died.

-- Pclass:
# Pclass 1: 26.1%
# Pclass 2: 24.2%
# Pclass 3: 49.7%
# => Almost half the passengers traveled in 3rd class.

-- Sex:
# Male: 63.4%
# Female: 36.6%
# => Most passengers were male.

-- Embarked:
# Port of Embarkation: C = Cherbourg, Q = Queenstown, S = Southampton
# S (Southampton): 77.9%
# C (Cherbourg): 18.2%
# Q (Queenstown): 3.9%
# => Most passengers boarded from Southampton.

-- SibSp:
# 66% passengers had 0 siblings/spouses aboard
# 25.6% had 1
# Very few had more than 1 (3.5% had 2, 1.7% had 3, 2.5% had 4, 0.7% had 5)
# => Most passengers were traveling alone or with 1 companion

-- Parch:
# 73% passengers had 0 parents/children aboard
# 15.4% had 1, 9.5% had 2
# Very rare to have more than 2 (0.7% had 3, 0.6% had 4, 0.7% had 5, 0.1% had 6)
# => Majority traveled without parents or children, only few large families
*/
