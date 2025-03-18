-- 1. Loan Approval Rate by Credit History
SELECT Credit_History, 
       COUNT(*) AS total_applications,
       SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS approved_loans,
       (SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS approval_rate
FROM home_loan_approval
GROUP BY Credit_History;

-- 2. Average Loan Amount by Employment Type
SELECT Self_Employed, AVG(LoanAmount) AS avg_loan_amount
FROM home_loan_approval
GROUP BY Self_Employed;

-- 3. Loan Approval Rate Based on Income Levels
SELECT 
    CASE 
        WHEN ApplicantIncome < 2000 THEN 'Low Income'
        WHEN ApplicantIncome BETWEEN 2000 AND 5000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_category,
    COUNT(*) AS total_applicants,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS approved_loans,
    (SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS approval_rate
FROM home_loan_approval
GROUP BY income_category;

-- 4. Loan Approval Rate by Property Area
SELECT Property_Area, 
       COUNT(*) AS total_loans, 
       SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS approved_loans,
       (SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS approval_rate
FROM home_loan_approval
GROUP BY Property_Area;


