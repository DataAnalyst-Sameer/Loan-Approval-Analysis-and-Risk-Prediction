# Loan Approval Analysis and Risk Prediction
## Description:
This project analyzes loan approval trends and predicts high-risk applicants using historical loan application data. It explores key factors influencing loan approvals, evaluates applicant risk levels, and provides insights to improve financial decision-making.

## Dataset: Home Loan Approval Dataset
This dataset includes details such as Gender, Marital Status, Education, Number of Dependents, Income, Loan Amount, Credit History, and more. 
https://www.kaggle.com/datasets/rishikeshkonapure/home-loan-approval/data

## Key Features:
Loan Approval Trends: Analyze approval rates based on education, employment status, property location, and credit history.
Advanced Loan Analysis: Identify critical factors affecting loan approvals and loan amount variations.
Risk Analysis & Default Prediction: Detect high-risk applicants based on credit history, income levels, and loan amounts.

## Technologies Used:
1. SQL (for data querying and analysis)
2. Excel (for supplementary analysis)
3. Power BI/Tableau (optional for visualization)

## Project Files:
1. loan_sanction_train.csv – Training dataset for loan approvals
2. loan_sanction_test.csv – Test dataset for evaluation
3. Advanced_Loan_Approval_Analysis.sql – SQL queries for advanced approval trends
4. Home_Loan_Approval_Basic_Analysis.sql – SQL queries for fundamental approval insights
5. Risk_Analysis_and_Defaults_Prediction.sql – SQL queries for risk assessment and default prediction

## Potential Applications:
1. Financial Institutions: Improve loan approval strategies.
2. Data Analysts: Explore real-world loan datasets for insights.

# 🏦 Home Loan Approval Analysis – Key Findings  

## 📌 Project Overview  
This analysis explores **home loan approval trends** using SQL, focusing on key factors affecting approval rates and identifying high-risk applicants.  

---

## 🔍 Key Findings  

### ✅ 1. **Loan Approval Rates by Applicant Profile**  
- **Credit history** is the strongest predictor of loan approval.  
  - Applicants with a **credit history (1)** had a **78% approval rate**.  
  - Applicants with **no credit history (0)** had only **21% approval rate**.  

- **Employment Status Matters:**  
  - **Self-employed applicants** had a **15% lower approval rate** than salaried individuals.  
  - Most **approved applicants** were **salaried** and had stable incomes.  

- **Education & Loan Approval:**  
  - **Graduate applicants** had a **higher approval rate (74%)** compared to non-graduates (58%).  
  - Education level alone did not guarantee loan approval but correlated with better credit history.  

---

### 🚨 2. **High-Risk Loan Applicants**  
- **Low-Income Applicants with High Loan Amount Requests**:  
  - 32% of applicants with an income **below $3,000** requested loans **above $150K**.  
  - These applicants had **only a 35% approval rate**.  

- **High Loan-to-Income Ratio Cases**:  
  - Applicants with an **income-to-loan ratio** below **0.5** were **denied loans in 64% of cases**.  

- **Property Area Impact**:  
  - Urban properties had **the highest approval rates (81%)**.  
  - Rural applicants faced **higher rejection (39%)** due to lower income and unstable employment.  

---

## 📊 SQL Query Insights  

### 1️⃣ **Credit History & Approval Rate**  
```sql
SELECT Credit_History, COUNT(*) AS total_applicants, 
       SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS approved_loans,
       ROUND((SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS approval_rate
FROM home_loan_approval
GROUP BY Credit_History;
