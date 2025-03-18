-- Risk Analysis and Defaults Prediction

-- High-Risk Loan Applicants
SELECT Loan_ID, ApplicantIncome, CoapplicantIncome, Credit_History, LoanAmount, Loan_Amount_Term 
FROM home_loan_approval
WHERE Credit_History = 0 OR (ApplicantIncome < 3000 AND LoanAmount > 150)
ORDER BY LoanAmount DESC;

-- Purpose: Identify applicants with low credit history or low income who requested high loan amounts.
