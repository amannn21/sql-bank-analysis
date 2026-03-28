-- 1. Total customers
SELECT COUNT(*) AS total_customers
FROM bank;

-- 2. Customers by job
SELECT job, COUNT(*) AS customer_count
FROM bank
GROUP BY job
ORDER BY customer_count DESC;

-- 3. Average balance by job
SELECT job, AVG(balance) AS avg_balance
FROM bank
GROUP BY job
ORDER BY avg_balance DESC;

-- 4. Customers with high balance
SELECT *
FROM bank
WHERE balance > 50000;

-- 5. Loan vs no loan
SELECT loan, COUNT(*) AS total
FROM bank
GROUP BY loan;

-- 6. Customers who subscribed (target = yes)
SELECT COUNT(*) AS subscribed_customers
FROM bank
WHERE y = 'yes';

-- 7. Subscription rate by job
SELECT job,
       COUNT(CASE WHEN y = 'yes' THEN 1 END) AS subscribed,
       COUNT(*) AS total,
       (COUNT(CASE WHEN y = 'yes' THEN 1 END) * 100.0 / COUNT(*)) AS conversion_rate
FROM bank
GROUP BY job
ORDER BY conversion_rate DESC;

-- 8. Age group analysis
SELECT 
    CASE 
        WHEN age < 30 THEN 'Young'
        WHEN age BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_customers
FROM bank
GROUP BY age_group;
