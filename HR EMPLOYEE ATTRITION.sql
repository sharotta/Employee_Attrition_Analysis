--                        HR EMPLOYEE ATTRITION
use PortfolioProject;
 

SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'hr_employee_attrition';





--           Data Cleaning
-- Check if all data are correctly loaded
      SELECT * FROM [dbo].[hr_employee_attrition]
-- Check for missing values 
      select
	       count(*) as Total_Rows,
		   sum(case when Age is null then 1 else 0 end) as missing_age,
		   sum(case when Attrition is null then 1 else 0 end) as missing_attrition,
		   sum(case when JobRole is null then 1 else 0 end) as missing_JobRole,
		   sum(case when MonthlyIncome is null then 1 else 0 end) as missing_MonthlyIncome
	 from
	     hr_employee_attrition;

-- Changing data types from Float to INT
      SELECT COLUMN_NAME
      FROM INFORMATION_SCHEMA.COLUMNS
      WHERE TABLE_NAME = 'hr_employee_attrition';

-- Checking the compatability of Age before changing it from FLOAT to INT If the above query returns any rows, those rows contain non-numeric values that need to be handled before converting
     select *
	 from
	    [hr_employee_attrition]
	 where
	   ISNUMERIC (age) = 33;
-- Altering the column Age by changing it to INT
      alter table 
	      [hr_employee_attrition]
	  alter column 
	        age int;
-- Checking the compatability of DailyRate before changing it from FLOAT to INT
      select *
	  from
	    [hr_employee_attrition]
	  where
	    ISNUMERIC (YearsWithCurrManager) = 7;
 -- Altering the column DailyRate by changing it to INT
       alter table 
	       [hr_employee_attrition]

--                     Demographics Analysis
-- Total Employees
      select 
	     sum(EmployeeCount) as TotalEmployee
	  from 
	     [hr_employee_attrition];
-- Total Attrition by Education field
      select
	      EducationField,
		  sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	  from
	     [hr_employee_attrition]
	  group by
	      EducationField
	  order by
	       TotalAttrition desc;
-- Count total Attrition if "Attrition" is "Yes
      select 
	      count(*) as TotalAttrition
	  from 
	      [hr_employee_attrition]
	  where Attrition = 'Yes';
-- Count of Active Employees
      select 
	      count(*) as TotalAttrition
	  from 
	      [hr_employee_attrition]
	  where Attrition = 'No';
-- Total Attrition by WorkLifeBalance
     select
         case 
           when WorkLifeBalance = 1 then 'Bad'
           when WorkLifeBalance = 2 then 'Average'
           when WorkLifeBalance = 3 then 'Good'
           when WorkLifeBalance = 4 then 'Excellent'
          end as  WorkLifeBalanceGroup,
       count(*) AS TotalEmployees,
       sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
   from
      [hr_employee_attrition]
   group by 
    case 
           when WorkLifeBalance = 1 then 'Bad'
           when WorkLifeBalance = 2 then 'Average'
           when WorkLifeBalance = 3 then 'Good'
           when WorkLifeBalance = 4 then 'Excellent'
          end;
-- Total Attrition by Distance from Home 
     select 
	     case 
		     when DistanceFromHome between 1 and 10 then 'near-by'
			 when DistanceFromHome between 11 and 20 then 'far'
			 when DistanceFromHome between 21 and 30 then 'very far'
		end as DistanceCategory,
		count(*) as employeeCount,
		sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
	    [hr_employee_attrition]
	 group by
	     case 
		     when DistanceFromHome between 1 and 10 then 'near-by'
			 when DistanceFromHome between 11 and 20 then 'far'
			 when DistanceFromHome between 21 and 30 then 'very far'  
		 end;
-- Total Attrition by Age
     select 
	     case 
		     when Age between 18 and 31 then '18-30'
			 when Age between 31 and 45 then '31-45'
			 when Age between 46 and 60 then '46-60'
		end as AgeCategory,
		count(*) as employeeCount,
		sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition 
	 from 
	    [hr_employee_attrition]
	 group by
	         case 
		     when Age between 18 and 31 then '18-30'
			 when Age between 31 and 45 then '31-45'
			 when Age between 46 and 60 then '46-60'
		 end
	order by
	      TotalAttrition desc;
-- Total Attrition by Age and Gender
        select
	     case 
		     when Gender = 'Male'   then 'Male'
			 when Gender = 'Female'  then 'Female'
			 end as GenderCategory,
			 case 
		     when Age between 18 and 31 then '18-30'
			 when Age between 31 and 45 then '31-45'
			 when Age between 46 and 60 then '46-60'
		     end as AgeCategory,
			 count(*) as employeeCount,
			 sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
	     [hr_employee_attrition]
	 group by
	      case 
		     when Gender = 'Male'   then 'Male'
			 when Gender = 'Female'  then 'Female'
			 end,    
             case 
		     when Age between 18 and 31 then '18-30'
			 when Age between 31 and 45 then '31-45'
			 when Age between 46 and 60 then '46-60'
		     end
	order by
	       TotalAttrition desc;
-- Total Attrition by marital status 
     select
	     case 
		     when MaritalStatus = 'Single'   then 'Single'
			 when MaritalStatus = 'Married'  then 'Married'
			 when MaritalStatus = 'Divorced' then 'Divorced'
		end as MaritalStatusCategory,
		count(*) as employeeCount,
		 sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
	    [hr_employee_attrition]
	 group by
	       case
		     when MaritalStatus = 'Single'   then 'Single'
			 when MaritalStatus = 'Married'  then 'Married'
			 when MaritalStatus = 'Divorced' then 'Divorced'
		end
	 order by
	      TotalAttrition desc;
 -- Total Attrition by Job Role
     select
	        JobRole,
			sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
		    [hr_employee_attrition]
	  group by 
		       JobRole;
 -- Total Attrition by Job Role and gender
        select
	        JobRole,
			Gender,
			sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
		from 
		    [hr_employee_attrition]
		group by 
		       JobRole,
			   Gender;
 -- Total Attrition by Business Travel and Gender
      select
	        BusinessTravel,
			Gender,
			sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
		from 
		    [hr_employee_attrition]
		group by 
		       BusinessTravel,
			   Gender;
 -- Total Attrition by Department
        select
	        Department,
			sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
		from 
		    [hr_employee_attrition]
		group by 
		       Department;
-- Total Attrition by Years In Current Role and Department
        select
	        Department,
			YearsInCurrentRole,
			sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
		from 
		    [hr_employee_attrition]
		group by 
		       Department,
			   YearsInCurrentRole;
-- Total Attrition Overtime
        select
	        OverTime,
			sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
		from 
		    [hr_employee_attrition]
		group by 
		       OverTime;
 -- Total Attrition Job Level 
        select
	       case 
		      when JobLevel = 1   then 'Entry level'
			  when JobLevel = 2    then 'Junior or Associate'
			  when JobLevel = 3    then 'Mid level Specialist'
			  when JobLevel = 4    then 'Senior'
			  when JobLevel = 5    then 'Executive'
			  end as JobLevelCategory,
			  count(*) as employeeCount,
			  sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	   from 
	      [hr_employee_attrition]
	   group by
	       case 
		     when JobLevel = 1   then 'Entry level'
			 when JobLevel = 2    then 'Junior or Associate'
			 when JobLevel = 3    then 'Mid level Specialist'
			 when JobLevel = 4    then 'Senior'
			 when JobLevel = 5    then 'Executive'
			 end;
 -- Total Attrition by Performance Rating
        select
	        case 
		      when PerformanceRating = 3   then 'Low'
			  when PerformanceRating = 4  then 'High'
			  end as PerformanceRatingCategory,
			  count(*) as employeeCount,
			  sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	    from 
	      [hr_employee_attrition]
	    group by
	        case 
		      when PerformanceRating = 3 then 'Low'
			  when PerformanceRating = 4 then 'High'
			  end;
 -- Total Attrition by Environment Satisfaction
     select
	     case
		    when EnvironmentSatisfaction = 1 then 'Very dissatified'
			when EnvironmentSatisfaction = 2 then 'dissatified'
			when EnvironmentSatisfaction = 3 then 'satisfied'
			when EnvironmentSatisfaction = 4 then 'very satisfied'
			end as EnvironmentSatisfactionCategory,
			count(*) as EmployeeCount,
			sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
	    [hr_employee_attrition]
	 group by
	        case
		    when EnvironmentSatisfaction = 1 then 'Very dissatified'
			when EnvironmentSatisfaction = 2 then 'dissatified'
			when EnvironmentSatisfaction = 3 then 'satisfied'
			when EnvironmentSatisfaction = 4 then 'very satisfied'
			end;
 -- Total Attrition by Job Satisfaction
     select
	     case
		    when JobSatisfaction = 1 then 'Very dissatified'
			when JobSatisfaction = 2 then 'dissatified'
			when JobSatisfaction = 3 then 'satisfied'
			when JobSatisfaction = 4 then 'very satisfied'
			end as JobSatisfactionCategory,
			count(*) as EmployeeCount,
			sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
	    [hr_employee_attrition]
	 group by
	      case
	        when JobSatisfaction = 1 then 'Very dissatified'
			when JobSatisfaction = 2 then 'dissatified'
			when JobSatisfaction = 3 then 'satisfied'
			when JobSatisfaction = 4 then 'very satisfied'
			end;
 -- Total Attrition by Job Involvement
     select
	     case
		    when JobInvolvement = 1 then 'Very low'
			when JobInvolvement = 2 then 'Low'
			when JobInvolvement = 3 then 'Moderate'
			when JobInvolvement = 4 then 'High'
			end as JobInvolvementCategory,
			count(*) as EmployeeCount,
			sum( case when Attrition = 'Yes' then 1 else 0 end)
	 from 
	     [hr_employee_attrition]
	group by
	     case
		    when JobInvolvement = 1 then 'Very low'
			when JobInvolvement = 2 then 'Low'
			when JobInvolvement = 3 then 'Moderate'
			when JobInvolvement = 4 then 'High'
			end;
-- Total Attrition by Work Life Balance
     select
	     case
		    when WorkLifeBalance = 1 then 'Bad'
			when WorkLifeBalance = 2 then 'Average'
			when WorkLifeBalance = 3 then 'Good'
			when WorkLifeBalance = 4 then 'Execellent'
			end as WorkLifeBalanceCategory,
			count(*) as EmployeeCount,
			sum( case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition 
	 from 
	     [hr_employee_attrition]
	group by
	     case
		    when WorkLifeBalance = 1 then 'Bad'
			when WorkLifeBalance = 2 then 'Average'
			when WorkLifeBalance = 3 then 'Good'
			when WorkLifeBalance = 4 then 'Execellent'
			end;
-- Total Attrition by Performance Rating
      select
	     case
		    when PerformanceRating = 3 then 'Low'
			when PerformanceRating = 4 then 'High'
			end as PerformanceRatingCategory,
			count(*) as EmployeeCount,
			sum( case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition 
	 from 
	     [hr_employee_attrition]
	group by
	      case
		    when PerformanceRating = 3 then 'Low'
			when PerformanceRating = 4 then 'High'
			end; 
 
 
 --                            TURN OVER ANALYSIS
 -- Gender count
    select
	     case 
		     when Gender = 'Male'   then 'Male'
			 when Gender = 'Female'  then 'Female'
			 end as GenderCategory,
			 count(*) as employeeCount,
			 sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
	     [hr_employee_attrition]
	 group by
	      case 
		     when Gender = 'Male'   then 'Male'
			 when Gender = 'Female'  then 'Female'
			 end;
-- Age Distribution Percentage of male and female employees
     select
	      (sum(case when Gender = 'Male' then 1 else 0 end) * 100/ count(*)) as  MalePercentage,
		  (sum(case when Gender = 'Female' then 1 else 0 end) * 100/ count(*)) as  FemalePercentage
     from 
	     [hr_employee_attrition];
-- Marital Status Distribution
     select
	       MaritalStatus,
		   count(*) as CountofMaritalStatus,
		   (count(*)*100/ (select count(*) from [hr_employee_attrition])) as Percentage
	from 
	   [hr_employee_attrition]
	group by
	   MaritalStatus;
-- Job Role Distribution
    select
	     JobRole,
		 count(*) as CountofJobRole,
		 (count(*)*100/ (select count(*) from [hr_employee_attrition])) as Percentage
	from 
	   [hr_employee_attrition]
	group by
	  JobRole;
-- Distribution of education levels
   select
	     Education,
		 count(*) as EducationCount,
		 (count(*)*100/ (select count(*) from [hr_employee_attrition])) as Percentage
	from 
	   [hr_employee_attrition]
	group by
	  Education
	order by
	  EducationCount;
-- Distribution of employees across different departments
    select
	     Department,
		 count(*) as CountofDepartment,
		 (count(*)*100/ (select count(*) from [hr_employee_attrition])) as Percentage
	from 
	   [hr_employee_attrition]
	group by
	  Department;
-- Average distance from home to work
   select
         avg(DistanceFromHome) as AverageDistanceFromHome
	from 
	   [hr_employee_attrition];
 -- Average Working Years
     select
	      avg(TotalWorkingYears) as AverageWorkingYears
	 from 
	    [hr_employee_attrition];
 -- Job Role Count
     select
	      count(distinct JobRole) as CountOfJobRole
	 from 
	      [hr_employee_attrition];

--   Count of Department
        select
		      count(distinct Department) as CountofDepartment
		from
		   [hr_employee_attrition];
-- Distribution of department- Distribution of employees across different departments
       select
	        Department,
			count(*) as EmployeeCount
	  from
	      [hr_employee_attrition]
	 group by 
		       Department;
-- Average age of employees.
        select
		     avg(Age) as AverageAge
		from
		     [hr_employee_attrition]; 
 
 --                              Employee Wellness
 -- Average Daiy Rate
      select
	     Department,
		 avg(DailyRate) as AverageDailyRate
	  from
	     [hr_employee_attrition]
	  group by
	    Department;
-- Average Daily Rate impact on Attrition
     select
	     Department,
		 avg(DailyRate) as AverageDailyRate,
         sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from
	     [hr_employee_attrition]
	  group by
	    Department;
 --Average Monthly Income 
      select
	      Department,
	      avg(MonthlyIncome)as AverageMonthlyIncome
	 from 
	    [hr_employee_attrition]
	group by
	    Department;
-- Average Monthly Income impact on Attrition
    select
	      Department,
	      avg(MonthlyIncome)as AverageMonthlyIncome,
		  sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
	    [hr_employee_attrition]
	group by
	    Department;
 -- Average Hourly Rate
     select
	      Department,
	      avg(HourlyRate) as AverageHourlyRate
	 from 
	     [hr_employee_attrition]
	 group by
	    Department;
--  Average Hourly Rate impact on Attrition
      select
	      Department,
	      avg(HourlyRate) as AverageHourlyRate,
		  sum(case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition
	 from 
	     [hr_employee_attrition]
	 group by
	    Department; 
-- Average salary by job role for employees who left vs.who stayed
     select 
	       JobRole,
		   Attrition,
		  avg(MonthlyIncome) as avg_salary
	from hr_employee_attrition
	group by 
	      JobRole,

-- Average environment satisfaction score
     select
	      avg(EnvironmentSatisfaction) as AverageEnvironmentSatifaction
	from
	     [hr_employee_attrition];

 --Relationship Satisfaction
    select
	     case
		    when RelationshipSatisfaction = 1 then 'Very low'
			when RelationshipSatisfaction = 2 then 'Low'
			when RelationshipSatisfaction = 3 then 'Moderate'
			when RelationshipSatisfaction = 4 then 'High'
			end as RelationshipCategory,
			count(*) as EmployeeCount,
			sum( case when Attrition = 'Yes' then 1 else 0 end) as TotalAttrition 
	 from 
	     [hr_employee_attrition]
	group by
	     case
		     when RelationshipSatisfaction = 1 then 'Very low'
			when RelationshipSatisfaction =  2 then 'Low'
			when RelationshipSatisfaction =  3 then 'Moderate'
			when RelationshipSatisfaction =  4 then 'High'
			end;  
-- Performance Rating Analysis
      select
	     case
		    when PerformanceRating = 3 then 'Low'
			when PerformanceRating = 4 then 'High'
			end as PerformanceRatingCategory,
			count(*) as EmployeeCount
	 from 
	     [hr_employee_attrition]
	group by
	      case
		    when PerformanceRating = 3 then 'Low'
			when PerformanceRating = 4 then 'High'
			end;  
 
-- Work Life Balance Anaysis
     select
	    sum(case when WorkLifeBalance = 1 then 1.0 else 0 end) as WorkLifeBalance_1,
		sum(case when WorkLifeBalance = 2 then 1.0 else 0 end) as WorkLifeBalance_2,
		sum(case when WorkLifeBalance = 3 then 1.0 else 0 end) as WorkLifeBalance_3,
		sum(case when WorkLifeBalance = 4 then 1.0 else 0 end)as WorkLifeBalance_4
	 from 
	     [hr_employee_attrition]; 
 
-- Average Work Life Balance
	select 
	    avg(WorkLifeBalance) as AverageWorkLife
	from 
	  [hr_employee_attrition];
-- Percentage of employees working OverTime.
     select
	      (sum(case when OverTime = 'Yes' then 1 else 0 end) * 100/ count(*)) as OverTimePercentage
     from 
	     [hr_employee_attrition];
-- Average number of years employees have been with the company.
     select
	      avg(YearsAtCompany) as AverageYearsAtCompany
	from 
	     [hr_employee_attrition];
-- Average number of years since last promotion
    select
	   avg(YearsSinceLastPromotion) as AverageYearsSinceLastPromotion
	from 
	   [hr_employee_attrition];
-- Average number of training sessions attended in the last year.
    select
	    avg(TrainingTimesLastYear) as AverageTrainingTimesLastYear
	from
	     [hr_employee_attrition];
