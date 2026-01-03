# 📊 Employee Attrition Analysis (SQL + Power BI)

## 📌 Project Overview
Employee attrition is a critical challenge for organizations, leading to increased hiring costs, loss of skilled talent, and reduced productivity.  
This project performs an **end-to-end Employee Attrition Analysis** using **SQL for data analysis** and **Power BI for visualization** to identify key drivers of employee turnover and provide actionable HR insights.

## 🎯 Business Problem
The HR department wants to:
- Understand **why employees leave the organization**
- Identify **high-risk departments and roles**
- Analyze the impact of **salary, tenure, performance, and promotions**
- Support data-driven strategies to **reduce attrition**

---

## 🗂️ Dataset
- **Source:**  Employee Attrition Dataset (Kaggle)
- **Type:** Structured HR data
- **Initial Format:** Single CSV file

  ## 🏗️ Data Modeling & Preparation
The original flat CSV dataset was normalized into **relational SQL Views** to simulate a real-world HR database:

| Views | Description |
|----------|-------------|
| `employees` | Employee demographic and job-related information |
| `salaries` | Salary and compensation details |
| `performance` | Performance ratings and promotion data |
| `attrition` | Attrition status and tenure information |

This step demonstrates **data modeling, normalization, and ETL concepts** using SQL.


### SQL Concepts Used
- JOINs (INNER, LEFT)
- Aggregations
- CASE statements
- CTEs
- Window functions
- Data cleaning & transformation

  ## 📈 Key Insights
- The **Sales department** shows the highest attrition rate
- Employees in **lower salary bands** are more likely to leave
- Attrition is highest within the **first 2 years of employment**
- Employees with **delayed promotions** show higher attrition
- Lower performance ratings correlate with increased attrition


## 📊 Power BI Dashboard
The Power BI dashboard provides an interactive view of attrition trends and includes:
- KPI cards for overall attrition rate and headcount
- Department-wise attrition analysis
- Salary and tenure-based attrition insights
- Filters for department and job role

📁 **File:** `Emp_Attrition.pbix`


## 📁 Project Structure
Employee-Attrition-Analysis/
│
├── sql/
│ └── attrition.sql # SQL queries for analysis
│
├── powerbi/
│ └── Emp_Attrition.pbix # Power BI dashboard
│
├── README.md
