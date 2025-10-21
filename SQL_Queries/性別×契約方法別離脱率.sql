USE churn_analysis_db;


SELECT
    gender,                  -- 性別
    Contract,                -- 契約タイプ（月/1年/2年）
    PaperlessBilling,        -- ペーパーレス請求
    COUNT(*) AS total,       -- セグメント内の人数
    SUM(IF(Churn='Yes',1,0)) AS churn_count,  -- 離脱者数
    ROUND(SUM(IF(Churn='Yes',1,0)) / COUNT(*) * 100, 2) AS churn_rate  -- 離脱率(%)
FROM 
	telco_churn
GROUP BY 
	gender, Contract, PaperlessBilling  -- 3つの条件でグループ化
ORDER BY 
	gender, Contract, PaperlessBilling;
-- 表示順を整理
