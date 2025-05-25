# Titanic Survival Analysis Using SQL
This project analyzes the survival patterns of Titanic passengers through exploratory data analysis (EDA) using SQL.

## Objective
To identify key features that influenced survival, using SQL-based EDA, and provide actionable insights for further analysis.

## Dataset
The dataset used is the [Titanic dataset from Kaggle](https://www.kaggle.com/datasets/yasserh/titanic-dataset), which contains passenger details including demographics, ticket class, family relationships, fare, and survival status.

**Import Instruction**:  
Please download the dataset and import it into your MySQL database as the table `titanic_raw_dataset`.

## Methodology
The analysis follows these steps:

- **Step 1. Data Understanding**  
  Understand data shape, uniqueness, null values, and variable types.  
  [01_data_understanding.sql](Scripts/01_data_understanding.sql)

- **Step 2. Data Cleaning**  
  Handle missing values, fix inconsistencies, and prepare for analysis.  
  [02_data_cleaning.sql](Scripts/02_data_cleaning.sql)

- **Step 3. Univariate Analysis**  
  Study distributions and summary statistics of individual variables.  
  [03_measures_univariate_analysis.sql](Scripts/03_measures_univariate_analysis.sql)  
  [04_dimensions_univariate_analysis.sql](Scripts/04_dimensions_univariate_analysis.sql)

- **Step 4. Feature Engineering & Featured Dimensions Univariate Analysis**  
  Create new fields like age groups, fare bands, family size, and alone status and perform univariate analysis.  
  [05_feature_engineering.sql](Scripts/05_feature_engineering.sql)  
  [06_featured_dimensions_univariate_analysis.sql](Scripts/06_featured_dimensions_univariate_analysis.sql)

- **Step 5. Bivariate Analysis**  
  Explore relationships between features and survival status.  
  [07_measures_bivariate_analysis.sql](Scripts/07_measures_bivariate_analysis.sql) 
  [08_dimensions_bivariate_analysis.sql](Scripts/08_dimensions_bivariate_analysis.sql)  
  [09_featured_dimensions_bivariate_analysis.sql](Scripts/09_featured_dimensions_bivariate_analysis.sql)

**Note**: Each script includes inline insights at the end, except for the following:
- 02_data_cleaning.sql (data preparation only)
- 05_feature_engineering.sql (feature creation only)

## Tools Used
- **MySQL Workbench** – SQL development, querying, and analysis.

## Key Insights
- **Fare:** Higher fare passengers had better survival odds.
- **Passenger Class:** First-class passengers had the highest survival rate (65.6%), while third-class had the lowest (24%).
- **Sex:** Female passengers had significantly higher survival rate(75.4%) compared to males (20.5%).
- **Embarkation Port:** Passengers boarding from Cherbourg had the highest survival rate (~60.7%), partly due to more first-class passengers.
- **Family Size:** 1–2 member families survived more; solo travelers and large families had lower survival rate.
- **Age:** Infants and children had relatively better survival rates, though these groups were few.

## View the SQL Scripts
All SQL scripts are available in the `/Scripts` folder. You can browse them individually below:

- [01_data_understanding.sql](Scripts/01_data_understanding.sql)
- [02_data_cleaning.sql](Scripts/02_data_cleaning.sql)
- [03_measures_univariate_analysis.sql](Scripts/03_measures_univariate_analysis.sql)
- [04_dimensions_univariate_analysis.sql](Scripts/04_dimensions_univariate_analysis.sql)
- [05_feature_engineering.sql](Scripts/05_feature_engineering.sql)
- [06_featured_dimensions_univariate_analysis.sql](Scripts/06_featured_dimensions_univariate_analysis.sql)
- [07_measures_bivariate_analysis.sql](Scripts/07_measures_bivariate_analysis.sql)
- [08_dimensions_bivariate_analysis.sql](Scripts/08_dimensions_bivariate_analysis.sql)
- [09_featured_dimensions_bivariate_analysis.sql](Scripts/09_featured_dimensions_bivariate_analysis.sql)

[Click here to view the full Scripts folder](https://github.com/Karishma-Sultania07/titanic-survival-analysis/tree/main/Scripts)
