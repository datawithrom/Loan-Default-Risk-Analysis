# Loan-Default-Risk-Analysis
Project Overview

Horizon Financial Group observed that approximately 25% of issued personal loans were defaulting, significantly exceeding the company's target default rate of 12%.

The objective of this analysis was to identify the key drivers of loan defaults and provide data-driven recommendations to improve the loan approval process and reduce portfolio risk.

Business Problem

The VP of Risk requested an analysis of borrower and loan data to answer the following questions:

What is the overall default rate?
How does default rate vary by credit score?
Is there a relationship between Debt-to-Income (DTI) ratio and default risk?
Which loan purposes have the highest default rates?
How do employment-related factors influence defaults?
What underwriting thresholds should be implemented?
Dataset
Borrower Profiles

Contains:

Borrower ID
Credit Score
Annual Income
Employment Status
Years Employed
Debt-to-Income Ratio (DTI)
Loan Applications

Contains:

Borrower ID
Loan Amount
Loan Purpose
Interest Rate
Loan Term
Default Status

Datasets were joined using:

borrower_id
Tools Used
SQL Server
Excel
Python (Pandas, Matplotlib)
Data Preparation
Steps Performed
Imported both CSV files.
Checked data types and missing values.
Cleaned null values where necessary.
Joined borrower and loan datasets.
Created analytical buckets for:
Credit Score
DTI Ratio
Employment Duration
Key Findings
1. Credit Score Analysis
Credit Score	Default Rate
520–599	49.14%
600–649	29.03%
650–699	28.00%
700–749	16.28%
750+	11.69%
Insight
Borrowers with scores below 600 defaulted at nearly 50%.
Default rates steadily declined as credit scores increased.
The 750+ segment met the company's target risk profile.
Highest Risk Segment

Credit Score: 520–599

Default Rate: 49.14%

2. Debt-to-Income (DTI) Analysis
DTI Range	Default Rate
0–29.99%	14.29%
30–49.99%	17.16%
50–69.99%	32.57%
70–89.99%	37.10%
90–100%	41.67%
100%+	36.36%
Insight

Default risk increases substantially after a DTI ratio exceeds 50%.

Recommended DTI Threshold

✅ Preferred Approval Threshold: DTI < 50%

⚠ Manual Review: 50–70%

❌ High Risk: Above 70%

3. Loan Purpose Analysis
Loan Purpose	Default Rate
Wedding	32.14%
Home Improvement	28.57%
Auto Loan	27.12%
Business Loan	24.14%
Education	22.64%
Insight

The highest default rates were observed among:

Wedding Loans
Home Improvement Loans
Auto Loans

These categories may require stricter underwriting criteria.

Risk Factors Identified
High Risk Characteristics
Credit Score below 650
DTI above 50%
Wedding Loan Purpose
Home Improvement Loan Purpose
Auto Loan Purpose
Business Recommendations
Recommendation 1: Increase Minimum Credit Score

Current data shows:

<600 score borrowers default at nearly 50%.
750+ borrowers default at only 11.69%.

Suggested Policy:

Minimum Credit Score = 650
Recommendation 2: Introduce DTI Limits

Suggested Policy:

Approve: DTI < 50%

Manual Review: 50% - 70%

Decline: >70%
Recommendation 3: Risk-Based Pricing

Apply higher interest rates or stricter approval criteria for:

Wedding Loans
Home Improvement Loans
Auto Loans
Expected Business Impact

Implementing these recommendations can:

Reduce portfolio default rates
Improve loan quality
Strengthen underwriting decisions
Move default rates closer to the 12% company target
SQL Skills Demonstrated
CTEs
CASE Statements
Aggregations
GROUP BY
JOIN Operations
Default Rate Calculations
Risk Segmentation
Project Outcome

The analysis identified Credit Score and Debt-to-Income Ratio (DTI) as the strongest indicators of default risk. By tightening approval thresholds around these metrics, Horizon Financial Group can significantly improve loan portfolio performance and reduce future defaults.

Author

Romio Bapari
Data Analyst Portfolio Project
Horizon Financial Group – Loan Default Risk Analysis
