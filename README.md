# Employee_Attrition_Analysis

## Table of Contents
- [Project Overview](#project-overview)
- [Objectives/Problem Statements](#objectivesproblem-statements)
- [Data Source](#data-source)
- [Tools](#tools)
- [Data Preparation](#data-preparation)
- [Data Visualization](#data-visualization)
- [Recommendations](#recommendations)


## Project Overview:
Employee attrition, the gradual reduction of a company’s workforce due to resignations, retirements, or terminations, is a critical concern for organizations. High attrition impacts productivity, increases recruitment costs,loss of talent, and disrupts operations. 
This project provides an in-depth analysis of employee attrition, aiming to uncover key drivers of turnover and deliver actionable, data-driven recommendations to improve employee retention and satisfaction.

## Objectives/Problem Statements:
Understanding the key drivers of employee turnover is essential for developing strategies to enhance employee satisfaction, improve retention, and optimize workforce planning.
This analysis aims to address the following key questions:
- What are the primary factors influencing employee attrition?
- How does compensation impact employee retention?
- Do work-life balance and overtime significantly affect attrition rates?
- Which departments and job roles experience the highest turnover?
- Are there trends in attrition based on tenure, age, or experience?

## Data Source:
The dataset was provided via the MeriSkill Internship; the dataset contains 35 columns across 1,470 records, including
- **Demographics**: Age, Gender, Marital Status  
- **Job Details**: Department, Job Role, Tenure  
- **Compensation**: Monthly Income, Stock Options, Hike %  
- **Engagement Metrics**: Overtime, Satisfaction, Work-Life Balance  
- **Target Variable**: Attrition (Yes/No)

## Tools:
- **Power BI Desktop**: Dashboard creation and data visualization  
- **Power Query Editor**: Data transformation  
- **DAX**: Calculated fields and measures

## Data Preparation:
After loading the cleaned data into Power BI, the following transformations and enhancements were made:
- No missing or duplicate values  
- Created key measures:
  - `Attrition Rate`
 
  ![Attrition Rate](https://github.com/user-attachments/assets/88028cfb-68a6-40ef-b976-bab6525cce44)

  - `Avg Income (Attrited)`
 
  ![Avg Income  ](https://github.com/user-attachments/assets/573b1e9e-9408-4ea3-8d86-e4b64b370a9b)

  - `Overtime Rate`

  ![Overtime Rate](https://github.com/user-attachments/assets/7088c2cf-2971-452f-a993-f858e564fc80)

  - `Total Attrition`
 
  ![Total Attrition ](https://github.com/user-attachments/assets/41523af6-fd8c-412c-8e2c-a9164ac39d59)

  - `Retained Employees`

  ![Retained Employee](https://github.com/user-attachments/assets/d68d2964-6945-486e-b493-5348befbe3e3)

- Created calculated columns:
  - `Age Group`
 
  ![Age Groups](https://github.com/user-attachments/assets/036f303e-4c61-4d16-9f6d-c38aaccda621)

  - `Attrition (Numeric)`
 
  ![Attrition Numeric](https://github.com/user-attachments/assets/4670f7fa-b36d-4212-9de1-328ca43c815d)

  - `Job Level`

![Job level grouping](https://github.com/user-attachments/assets/a1970b4a-8882-4215-8023-d2721bfb7938)

## Data Visualization
To keep insights organized and digestible, I structured the analysis into two main pages:

### 1. **Overview Dashboard**

![OVERVIEW](https://github.com/user-attachments/assets/20825910-3d77-4367-9a98-36ecc2c2806d)

### Insights:
- **Total Employees:**:  1,470 | **Retained**: 1,233 | **Attrition Rate**: 16.12%
- The highest attrition rates are observed in **research & development** and **sales departments**.
- **Entry-level and associate roles** account for the highest attrition numbers. This indicates that **entry-level employees** are at the highest risk.
 - Employees in the **18–24 age group** have the highest attrition rate at **39.18%**, indicating retention challenges for younger employees.
- The average monthly salary for **attrited employees ($4,787)** is significantly lower than that of **retained employees ($6,833)**, suggesting salary plays a key role in attrition.

- High attrition in roles like **sales representative, laboratory technician, HR rep, sales executive, and research scientist**.
- Average Monthly Income: **High-income roles** (like R&D Director) experience less attrition.
- Lowest Attrition: Research Director **(2.50%)**, Manager **(4.90%)**, Healthcare Representative **(6.87%)**.

### 2. Department & Job Role Analysis Dashboard

![Department Analysis Dashboard](https://github.com/user-attachments/assets/99e012d7-33a1-4baf-8228-d39491c13e61)

### Insights:
- Employees who travel **rarely** exhibit significantly **higher attrition (887 employees)** than frequent travelers. 
- **Lower satisfaction and poor work-life balance are** strongly linked to resignations (**2.47** vs. **2.78** for satisfaction, **2.66** vs. **2.78** for work-life balance).
- Employees with **higher stock options** (Level 3) show lower attrition compared to those with **lower or no stock options**.
- Employees with **longer tenure at the company (7.37 years)** are more likely to stay compared to those with shorter tenure (5.13 years).
- **Higher performance ratings do not necessarily correlate with retention**, indicating other motivating factors beyond performance.
- Research & Development, with an overtime rate of **55.64%**, followed by the department with **52.17%**, shows a sharp overtime-to-attrition relationship.

## Recommendations:
- **Competitive Salary Adjustments:** Prioritize salary reviews for high-attrition roles (sales, lab technicians, HR, and R&D) to align with market benchmarks and improve retention.
- **Early-Career Retention Programs:**  Launch tailored development tracks for employees aged 18–24, including accelerated promotions and mentorship, to curb turnover in this demographic.
- **Equity-Based Incentives:**  Expand stock option programs to enhance long-term employee commitment, leveraging data showing lower attrition among equity-holding staff.
- **Support for Entry-Level Talent:** Invest in onboarding and upskilling for associate-level employees, who represent the largest attrition segment, to foster engagement and career progression.
- **Sales & R&D Retention Initiatives:** Introduce clear promotion pathways and specialized training in these critical functions to align growth opportunities with employee aspirations.
- **Travel Policy Optimization:** Reduce attrition linked to travel stress by offering flexible scheduling and remote alternatives for rarely traveling employees.
- **Job Satisfaction Enhancements:** Implement flexible work models, structured mentorship, and skill-building programs to address dissatisfaction drivers.
- **Workload & Work-Life Balance:** Audit workloads, set realistic targets, and formalize career plans to mitigate burnout and improve retention.

By implementing these recommendations, the organization can create a more supportive and engaging work environment, ultimately reducing attrition rates and enhancing employee satisfaction.



