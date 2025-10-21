USE churn_analysis_db;

SELECT 
    COUNT(*) 
        AS total_customers,                                -- 全顧客数
    SUM(IF(Churn = 'Yes', 1, 0)) 
        AS churn_count,                                    -- 離脱者数
    ROUND(SUM(IF(Churn = 'Yes', 1, 0)) / COUNT(*) * 100, 2) 
        AS churn_rate,                                     -- 離脱率（％）
    SUM(IF(SeniorCitizen = 1 AND Churn = 'Yes', 1, 0)) 
        AS senior_churn,                                   -- 高齢者離脱数
    SUM(IF(gender = 'Female' AND Churn = 'Yes', 1, 0)) 
        AS female_churn                                    -- 女性離脱数
FROM 
	telco_churn;

