-- Undersatnding the approval trends and risk factors

-- 1.1 Understanding the factors affectinng the loan approval
SELECT Education, Self_Employed, Property_Area, COUNT(*) AS total_applicants, 
       SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS approved_loans, 
       ROUND((SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS approval_rate
FROM home_loan_approval
GROUP BY Education, Self_Employed, Property_Area
ORDER BY approval_rate DESC;

-- purpose" find out self-employed individuals or specific education level affects the approval of rate

-- 1.2 Monthly Income vs Loan Approval
SELECT ApplicantIncome, LoanAmount, Loan_Status 
FROM home_loan_approval
WHERE ApplicantIncome > 5000
ORDER BY LoanAmount DESC;

-- purpose: see if higher income results in better approval chance