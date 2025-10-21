-- データベース作成
CREATE DATABASE churn_analysis_db;
USE churn_analysis_db;


-- テーブル作成（11列構成）
CREATE TABLE telco_churn (
    customerID        VARCHAR(20)   PRIMARY KEY,       -- 顧客ID
    gender            VARCHAR(10),                     -- 性別
    SeniorCitizen     TINYINT,                         -- 高齢者フラグ（0=否,1=はい）
    Partner           VARCHAR(5),                      -- 配偶者あり（Yes/No）
    Dependents        VARCHAR(5),                      -- 扶養家族あり（Yes/No）
    tenure            INT,                             -- 契約月数
    Contract          VARCHAR(20),                     -- 契約タイプ（月/1年/2年）
    PaperlessBilling  VARCHAR(5),                      -- ペーパーレス請求（Yes/No）
    MonthlyCharges    DECIMAL(10,2),                   -- 月額料金
    TotalCharges      DECIMAL(10,2),                   -- 総支払額
    Churn             VARCHAR(5)                       -- 離脱（Yes/No）
);


