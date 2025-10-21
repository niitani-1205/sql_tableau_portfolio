USE churn_analysis_db;


SELECT
    Contract,                                     -- 契約タイプ（月/1年/2年）
    COUNT(*) AS total,                            -- 契約者数
    SUM(IF(Churn = 'Yes', 1, 0)) AS churn_count,  -- 離脱者数
    ROUND(SUM(IF(Churn = 'Yes', 1, 0)) 
        / COUNT(*) * 100, 2) AS churn_rate        -- 離脱率（％）
FROM 
	telco_churn
GROUP BY 
	Contract                                 -- 契約タイプごとに集計
ORDER BY 
	churn_rate DESC;                         -- 離脱率が高い順に並べる
