-- Credit Risk Analysis with SQL
-- Project: Credit Risk Analysis with SQL
-- Author: Vishawjit Singh
-- Description: SQL queries used to analyze borrower risk patterns
-- Dataset: German Credit Dataset with Credit Risk

USE credit_analysis;

-- =====================================================
-- 1. Initial Data Validation
-- =====================================================

-- Preview the full dataset
SELECT *
FROM credit_data;

-- Confirm total record count
SELECT COUNT(*) AS total_rows
FROM credit_data;

-- Count customers by credit risk category
SELECT `Credit Risk`, COUNT(*) AS customer_count
FROM credit_data
GROUP BY `Credit Risk`;

-- =====================================================
-- 2. Risk Comparison by Loan Characteristics
-- =====================================================

-- Average credit amount by risk group
SELECT `Credit Risk`, ROUND(AVG(`Credit amount`), 2) AS avg_credit_amount
FROM credit_data
GROUP BY `Credit Risk`;

-- Average loan duration by risk group
SELECT `Credit Risk`, ROUND(AVG(Duration), 2) AS avg_duration
FROM credit_data
GROUP BY `Credit Risk`;

-- =====================================================
-- 3. Risk Concentration by Loan Purpose
-- =====================================================

-- Count customers by loan purpose and credit risk
SELECT Purpose, `Credit Risk`, COUNT(*) AS customer_count
FROM credit_data
GROUP BY Purpose, `Credit Risk`
ORDER BY Purpose, `Credit Risk`;

-- Average credit amount by loan purpose
SELECT Purpose, ROUND(AVG(`Credit amount`), 2) AS avg_credit_amount, COUNT(*) AS customer_count
FROM credit_data
GROUP BY Purpose
ORDER BY avg_credit_amount DESC;

-- Average loan duration by loan purpose
SELECT Purpose, ROUND(AVG(Duration), 2) AS avg_duration, COUNT(*) AS customer_count
FROM credit_data
GROUP BY Purpose
ORDER BY avg_duration DESC;

-- High-risk rate by loan purpose
SELECT
    Purpose,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) AS high_risk_customers,
    ROUND(SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS high_risk_rate_pct
FROM credit_data
GROUP BY Purpose
ORDER BY high_risk_rate_pct DESC;

-- =====================================================
-- 4. Risk Concentration by Housing Status
-- =====================================================

-- Count customers by housing and credit risk
SELECT Housing, `Credit Risk`, COUNT(*) AS customer_count
FROM credit_data
GROUP BY Housing, `Credit Risk`
ORDER BY Housing, `Credit Risk`;

-- High-risk rate by housing
SELECT
    Housing,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) AS high_risk_customers,
    ROUND(SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS high_risk_rate_pct
FROM credit_data
GROUP BY Housing
ORDER BY high_risk_rate_pct DESC;

-- =====================================================
-- 5. Optional Segment Review
-- =====================================================

-- Count customers by sex and credit risk
SELECT Sex, `Credit Risk`, COUNT(*) AS customer_count
FROM credit_data
GROUP BY Sex, `Credit Risk`
ORDER BY Sex, `Credit Risk`;

-- High-risk rate by sex
SELECT
    Sex,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) AS high_risk_customers,
    ROUND(SUM(CASE WHEN `Credit Risk` = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS high_risk_rate_pct
FROM credit_data
GROUP BY Sex
ORDER BY high_risk_rate_pct DESC;