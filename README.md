# Employee_Attrition_Analysis

## Overview
Employee attrition, the gradual reduction of a company’s workforce due to resignations, retirements, or terminations, is a critical concern for organizations. High attrition impacts productivity, increases recruitment costs, and disrupts operations.
I used HR data to build an interactive dashboard that helps the business identify high-risk roles, understand satisfaction trends, and simulate the impact of salary changes on turnover. It's a hands-on showcase of my ability to turn complex data into clear, actionable insights for smarter decision-making.

## Data Source
The dataset was provided via the MeriSkill Internship; the dataset contains 35 columns across 1,470 records, including
- **Demographics**: Age, Gender, Marital Status  
- **Job Details**: Department, Job Role, Tenure  
- **Compensation**: Monthly Income, Stock Options, Hike %  
- **Engagement Metrics**: Overtime, Satisfaction, Work-Life Balance  
- **Target Variable**: Attrition (Yes/No)

##  Tools & Technologies
- **Power BI Desktop**: Dashboard creation and data visualization  
- **Power Query Editor**: Data transformation  
- **DAX**: Calculated fields and measures

## Data Preparation in Power BI:
After loading the cleaned data into Power BI, the following transformations and enhancements were made:
- No missing or duplicate values  
- Created key measures:
  - `Attrition Rate`
  - `Avg Income (Attrited)`
  - `Overtime Rate`
  - `Total Attrition`
  - `Retained Employees`
- Created calculated columns:
  - `Age Group`
  - `Attrition (Numeric)`
  - `Job Level`
