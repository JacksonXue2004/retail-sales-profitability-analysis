# Retail Sales & Profitability Analysis (2022–2025)

End-to-end data analytics project using Python, Pandas, MySQL, SQL, and Tableau to analyze retail sales performance, profitability, product categories, geographic markets, sales channels, customers, and discount patterns.

## Dashboard Preview

![Retail Sales & Profitability Dashboard](images/Retail%20Sales%20%26%20Profitability%20Dashboard.png)

[View Interactive Tableau Dashboard](https://public.tableau.com/views/RetailSalesProfitabilityDashboard_17901183484830/RetailSalesProfitabilityDashboard?:language=en-US&:display_count=n&:origin=viz_share_link)

## Project Overview

This project analyzes retail transaction data from 2022 to 2025 to identify key sales and profitability trends and build an interactive business intelligence dashboard.

The project follows a complete data analytics workflow:

**Raw CSV → Python/Pandas Data Cleaning → MySQL → SQL Analysis → Tableau Dashboard**

The final dataset contains approximately 18,000 retail transactions after data cleaning and validation.

## Tools Used

- Python
- Pandas
- MySQL
- SQL
- Tableau
- GitHub

## Business Questions

This analysis focuses on answering questions such as:

- How have sales changed from 2022 to 2025?
- Which product categories generate the most revenue?
- Which countries contribute the most sales?
- Which sales channels perform best?
- How do discount levels relate to profitability?
- Which areas of the business contribute most to overall performance?

## Tableau Dashboard

The interactive dashboard includes:

- Total Sales
- Total Profit
- Total Orders
- Profit Margin
- Monthly Sales Trend
- Sales by Product Category
- Country Performance
- Channel Performance
- Discount vs Profitability
- Interactive Year and Product Category filters

### Interactive Dashboard

[View the Tableau Dashboard](https://public.tableau.com/views/RetailSalesProfitabilityDashboard_17901183484830/RetailSalesProfitabilityDashboard?:language=en-US&:display_count=n&:origin=viz_share_link)

## Key Insights

- The business generated approximately **$8.23M in total sales** and **$1.65M in total profit** across **14,541 orders**, resulting in an overall **19.98% profit margin**.

- Sales in **2025 increased by approximately 20.66% year over year**, representing the strongest recent annual growth in the dataset.

- **Electronics accounted for approximately 59.78% of total sales**, making it the dominant product category and a major driver of overall revenue.

- The **United States contributed approximately 42.55% of total sales**, making it the largest geographic market in the dataset.

- The **B2B Portal generated the highest average order value at approximately $1,024.88**, indicating substantially larger transactions through this channel.

- Higher discount levels were associated with lower observed profit margins, suggesting that aggressive discounting may reduce profitability.

> **Note:** The relationship between discount levels and profitability represents an observed correlation in the dataset and does not establish causation.

## Business Recommendations

- **Prioritize high-performing product categories while managing concentration risk.** Electronics generates the majority of sales, so maintaining its performance is important while continuing to develop other categories to reduce reliance on a single product segment.

- **Explore opportunities to expand higher-value sales channels.** The B2B Portal has the highest average order value, making it a strong area for further investigation and potential growth.

- **Review discounting strategies with profitability in mind.** Since higher discount levels are associated with lower observed profit margins, discount programs should be evaluated to ensure that additional sales volume is sufficient to offset margin erosion.

- **Continue monitoring geographic concentration.** With the United States representing a large share of total sales, growth opportunities in other markets could help diversify the revenue base.

## Repository Structure

```text
retail-sales-profitability-analysis/
│
├── README.md
├── data/
│   └── Sales_transactions_2022_2025_clean.csv
├── notebooks/
│   └── data_cleaning.ipynb
└── sql/
    └── retail_sales_analysis.sql
