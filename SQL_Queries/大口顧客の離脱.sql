USE churn_analysis_db;



-- 離脱者の総支払額・月額料金ランキングを作成
SELECT 
    customerID,                                -- 顧客ID
    TotalCharges,                              -- 総支払額
    MonthlyCharges,                            -- 月額料金
    Churn,                                     -- 離脱フラグ（Yes/No）
    ROW_NUMBER() OVER (ORDER BY TotalCharges DESC) AS total_rank,    -- 総支払額ランキング
    ROW_NUMBER() OVER (ORDER BY MonthlyCharges DESC) AS monthly_rank -- 月額料金ランキング
FROM 
	telco_churn
WHERE 
	Churn = 'Yes'                           -- 離脱者のみ抽出
LIMIT 
	10;                                     -- 上位10件のみ表示
