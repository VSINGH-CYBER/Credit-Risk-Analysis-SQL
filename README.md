# Credit Risk Analysis with SQL


## 1. Project Overview
**This project analyzes customer credit data to identify patterns associated with higher credit risk.** Using SQL in MySQL Workbench, I explored how borrower characteristics such as loan amount, loan duration, loan purpose, and housing status relate to risk outcomes. The goal here was to generate business level insights that could help form stronger underwriting review and risk monitoring decisions.

## 2. Business Problem
**Financial institutions need to understand which borrower characteristics are related to higher credit risk so they can make stronger lending decisions and reduce potential losses.** In this project, I analyzed consumer credit data to determine whether factors such as loan size, repayment term, purpose of the loan, and housing situation were associated with a larger pool of high-risk borrowers.

## 3. Objective
The objective of this analysis was to:
- identify differences between lower-risk and higher-risk borrowers
- evaluate which loan purposes show the highest concentration of high-risk customers
- assess whether housing status is associated with different levels of credit risk
- translate findings into practical recommendations for loan underwriting and portfolio monitoring


## 4. Tools Used
- MySQL Workbench for querying and data analysis
- SQL for data exploration, aggregation, and risk segmentation
- Google Docs for project documentation and write up

## 5. Dataset
This project was base of the German Credit Dataset with Credit Risk from Kaggle. This dataset contains borrower information including demographic characteristics, loan attributes, and a credit risk rating field. 

### Key Fields
- Age
- Sex
- Job
- Housing
- Savings Account
- Checking Account
- Credit Amount
- Duration
- Purpose
- Credit Risk

### Data Notes
- Total records analyzed: **954**
- Credit Risk Rating
  - 1 = lower risk customer
  - 2 = higher risk customer
 
## 6. Key Business Questions

1. Do higher-risk borrowers seem to have larger loan amounts?
2. Do higher-risk borrowers seem to have longer loan repayment durations?
3. Which loan purposes seem to have the larger concentrations high-risk borrowers?
4. Does housing status seem to be associated with credit risk?
5. Which borrower segments may warrant closer underwriting reviews?

## 7. SQL Analysis Process
The analysis began with intial data validation and exploration, including record preview and row count confirmation. I then used grouped aggregrations to compare borrower segments by the credit risk category. After identifying that higher-risl group had larger loan amounts and longer loan repayment durations, I extended my analysis to evaluate high-risk concetrations grouped by loan purpose and housing type. 

Core SQL techniques used: 
- SELECT
- COUNT
- AVG
- ROUND
- GROUP BY
- ORDER BY
- CASE WHEN
- Conditional aggregation for high-risk rate calculations

## 8. Sample Queries

### Query 1: Count customers by credit risk
```sql
SELECT `Credit Risk`, COUNT(*) AS customer_count
FROM credit_data
GROUP BY `Credit Risk`;
```

### Query 2: Average credit amount by risk
```sql
SELECT `Credit Risk`, ROUND(AVG(`Credit amount`), 2) AS avg_credit_amount
FROM credit_data
GROUP BY `Credit Risk`;
```

### Query 3: Average duration by risk
```sql
SELECT `Credit Risk`, ROUND(AVG(Duration), 2) AS avg_duration
FROM credit_data
GROUP BY `Credit Risk`;
```

### Query 4: High-risk rate by purpose
```sql
SELECT
     Purpose,
     COUNT(*) AS total_customers,
     SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) AS high_risk_customers,
     ROUND(SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS high_risk_rate_pct
FROM credit_data
GROUP BY Purpose
ORDER BY high_risk_rate_pct DESC;
```

### Query 5: High-risk rate by housing
```sql
SELECT
     Housing,
     COUNT(*) AS total_customers,
     SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) AS high_risk_customers,
     ROUND(SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS high_risk_rate_pct
FROM credit_data
GROUP BY Housing
ORDER BY high_risk_rate_pct DESC;
```

## 9. Findings

## Key Findings

1. Higher-risk borrowers had larger loans and longer repayment terms

The higher-risk borrower segment showed a higher average credit amount and a longer average loan term than the lower-risk segment. This suggests that larger loans and longer repayment terms may be associated with higher credit risk.

- Lower-risk group (1) average credit amount: 2994.52
- Higher-risk group (2) average credit amount: 3933.98
- Lower-risk group (1) average duration: 19.14
- Higher-risk group (2) average duration: 24.56

2. Loan purpose is an influence on high-risk concentration

Risk concentration varied across loan purposes. Although vacation/others showed the highest observed high-risk rate, its small sample size does limit the confidence in our results. More relevant categories were business and car, which combined elevated risk with a larger customer volume.

- Vacation/others: 41.67% high risk, 12 customers
- Business: 34.41% high risk, 93 customers
- Car: 31.37% high risk, 322 customers
- Radio/TV: 22.52% high risk, 262 customers

3. Housing status appeared strongly associated with credit risk

Housing status showed a clear difference in risk concentration. Borrowers that were in the free and rent categories has substantially higher high-risk rates than borrowers who own their housing. 

- Free: 40.95% high risk
- Rent: 39.05% high risk
- Own: 26.47% high risk

This suggests housing stability may be associated with lower credit risk and may be useful as an input for enhanced review or underwriting considerations.

## 10. Recommendations 

Based on the analysis, lenders could benefit from applying enhanced underwriting review to applicants that have a combination of the following characteristics: 

- larger requested loan amounts
- longer repayment durations
- business-purpose loans
- car-purpose loans
- non-owner housing loans

These factors should not be used as sole considerations when assessing risk for loan disbursements, but they could be meaningful metrics to consider in a broader risk-screening assessment. With these considerations, this could support stronger approval quality, more targeted documentation checks, and reduce credit loss exposure. 

## 11. Limitations

It is important to note that this analysis is completely exploratory and base on a single historical dataset. These findings are broader inferences, not proven relationships. Some categories, like vacation/others, had a very small sample size, which utlimately limits the confidence in broad conclusion based off those metrics. Additional analysis with recent and larger datasets would be required before applying these patterns directly to real-world lending policies. 

## 12. Skills Demonstrated

Here are some of the skills that are demonstrated throughout this project:

- SQL querying and aggregation
- Risk segmentation analysis
- Business problem framing
- Interpretation of borrower behavior data
- Translation of analysis into recommendations
- Analyst-style documentation and communication

## Key Query Output Screenshots

### Customer Count by Credit Risk
![Customer Count by Credit Risk](images/customer-count-by-credit-risk.png)

### Average Credit Amount by Credit Risk
![Average Credit Amount by Credit Risk](images/avg-credit-amount-by-risk.png)

### Average Loan Duration by Credit Risk
![Average Loan Duration by Credit Risk](images/avg-duration-by-risk.png)

### High-Risk Rate by Loan Purpose
![High-Risk Rate by Loan Purpose](images/high-risk-rate-by-purpose.png)

### High-Risk Rate by Housing
![High-Risk Rate by Housing](images/high-risk-rate-by-housing.png)



