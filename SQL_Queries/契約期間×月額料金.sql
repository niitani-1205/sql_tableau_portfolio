USE churn_analysis_db;
SET NAMES utf8mb4;



WITH customer_segments AS (
    SELECT 
        customerID,                                 -- 顧客ID
        Churn,                                      -- 離脱フラグ（Yes/No）
        tenure,                                     -- 契約月数
        MonthlyCharges,                             -- 月額料金
        CASE 
            WHEN tenure < 12 THEN '短期(0-11ヶ月)' -- 契約期間を短期に分類
            WHEN tenure < 24 THEN '中期(12-23ヶ月)'-- 契約期間を中期に分類
            ELSE '長期(24ヶ月以上)'                 -- 契約期間を長期に分類
        END AS 
        	tenure_category,
        CASE 
            WHEN MonthlyCharges < 35 THEN '低(0$-34$)'  -- 月額料金を低に分類
            WHEN MonthlyCharges < 70 THEN '中(35$-69$)' -- 月額料金を中に分類
            ELSE '高(70$以上)'                          -- 月額料金を高に分類
        END AS 
        	charges_category
    FROM 
    	telco_churn
)
SELECT
    tenure_category,                                 -- 契約期間カテゴリ
    charges_category,                                -- 月額料金カテゴリ
    COUNT(*) AS total_customers,                     -- セグメント内の顧客総数
    SUM(IF(Churn='Yes',1,0)) AS churn_count,         -- 離脱者数
    ROUND(SUM(IF(Churn='Yes',1,0)) / COUNT(*) * 100,2) AS churn_rate -- 離脱率(%)
FROM 
	customer_segments
GROUP BY 
	tenure_category, charges_category
ORDER BY 
	tenure_category, charges_category;
