create database hr;
use hr;
show tables;
select * from employee_attrition;
ALTER TABLE employee_attrition
RENAME COLUMN ï»¿Age TO age;
drop table employee_attrition;

CREATE VIEW emp AS
    SELECT 
        employeenumber AS emp_id,
        Age,
        gender,
        education,
        department,
        jobrole
    FROM
        employee_attrition;
        
        CREATE  OR REPLACE VIEW emp AS
    SELECT 
        employeenumber AS emp_id,
        Age,
        gender,
        education,
        department,
        jobrole,
        yearsatcompany
    FROM
        employee_attrition;
        
        
        
        CREATE VIEW salary AS
SELECT
  EmployeeNumber AS employee_id,
  MonthlyIncome AS salary,
  PercentSalaryHike
FROM employee_attrition;

CREATE VIEW performances AS
SELECT
  EmployeeNumber AS employee_id,
  PerformanceRating,
  YearsSinceLastPromotion
FROM employee_attrition;

create or replace view performances as
SELECT
  EmployeeNumber AS employee_id,
  PerformanceRating,
  YearsSinceLastPromotion,
  yearsincurrentrole
FROM employee_attrition;

select * from performances;

CREATE  OR REPLACE VIEW attritionS AS
SELECT
  EmployeeNumber AS employee_id,
  Attrition,
  YearsAtCompany
FROM employee_attrition;


-- Attrition Rate = (Employees Left / Total Employees) * 100
--  overall Attration rate ?

SELECT
  COUNT(CASE WHEN attrition = 1 THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
FROM attritions;

-- attration rate departmentwise?
SELECT
  e.department,
  COUNT(CASE WHEN a.attrition = 'Yes' THEN 1 END)*100.0/COUNT(*) AS attrition_rate
FROM employees e
JOIN attritions a ON e.emp_id = a.employee_id
GROUP BY e.department
ORDER BY attrition_rate DESC;


-- attration rate job rolewise?
SELECT
  e.jobrole,
  COUNT(CASE WHEN a.attrition = 1 THEN 1 END)*100.0/COUNT(*) AS attrition_rate
FROM employees e
JOIN attritions a ON e.emp_id = a.employee_id
GROUP BY e.jobrole
ORDER BY attrition_rate DESC;


SELECT
  CASE
    WHEN s.salary < 40000 THEN 'Low'
    WHEN s.salary BETWEEN 40000 AND 80000 THEN 'Medium'
    ELSE 'High'
  END AS salary_band,
  COUNT(CASE WHEN a.attrition = 1 THEN 1 END)*100.0/COUNT(*) AS attrition_rate
FROM salary s
JOIN attrition a ON s.employee_id = a.employee_id
GROUP BY salary_band;


SELECT
  CASE
    WHEN yearsatcompany < '2 years' THEN '0–2 Years'
    WHEN yearsatcompany < '5 years' THEN '2–5 Years'
    ELSE '5+ Years'
  END AS tenure_group,
  COUNT(CASE WHEN a.attrition = 1 THEN 1 END)*100.0/COUNT(*) AS attrition_rate
FROM employees e
JOIN attritions a ON e.emp_id = a.employee_id
GROUP BY tenure_group;



SELECT
  p.performancerating,
  COUNT(CASE WHEN a.attrition = 1 THEN 1 END)*100.0/COUNT(*) AS attrition_rate
FROM performance p
JOIN attritions a ON p.employee_id = a.employee_id
GROUP BY p.performancerating;

SELECT
  CASE
    WHEN  yearsincurrentrole - yearssincelastpromotion > 2 THEN 'No Promotion >2 Years'
    ELSE 'Recently Promoted'
  END AS promotion_status,
  COUNT(CASE WHEN a.attrition = 1 THEN 1 END)*100.0/COUNT(*) AS attrition_rate
FROM performances p
JOIN attritions a ON p.employee_id = a.employee_id
GROUP BY promotion_status;


select sum(employeenumber) from employee_attrition;
select sum(attrition) from employee_attrition;