# Digital Sales Intelligence

A Business Intelligence portfolio project built with **SQL, Power BI, and DAX** using the Chinook dataset.

The project analyzes sales performance across revenue, orders, customers, countries, artists, and genres, with a focus on turning data into clear business insights.

## Project Workflow

**Data → SQL → Data Modeling → DAX → Power BI → Business Insights**

## Business Questions

The analysis focuses on:

- How is revenue performing over time?
- How are orders, customers, and average order value changing?
- Which countries generate the most revenue?
- Which artists contribute the most revenue?
- Which genres perform best?
- What changes can be identified from year-over-year performance?

## Data

The project uses the **Chinook Database**, a fictional relational dataset containing digital music sales data.

The data was transformed into a dimensional model consisting of:

- Fact Sales
- Dim Customer
- Dim Artist
- Dim Genre
- Dim Date
- Dim Track

## SQL

SQL is used for data exploration and analytical queries, including:

- Data inspection
- Joins
- Aggregation
- Filtering
- Ranking
- Sales analysis

SQL is developed through a **learning-by-doing approach**, applying queries directly to practical business analysis problems.

## Power BI

Power BI is used for:

- Data modeling
- DAX measures
- KPI development
- Interactive filtering
- Revenue trend analysis
- Country, artist, and genre analysis
- Business insight generation

### Dashboard

The dashboard provides an interactive view of:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Revenue per Customer
- Revenue Growth
- Genre Performance
- Top Artists
- Top Countries
- Top Genres

Dashboard results dynamically change based on selected filters.

## Analytical Perspective

The analysis examines:

- Revenue growth
- Transaction activity
- Customer movement
- Average order value
- Market concentration
- Genre performance
- Artist contribution

The project focuses on identifying meaningful patterns and business signals without making unsupported causal claims.

## Project Structure

```text
digital-sales-intelligence/
│
├── dashboard/
│   └── Dashboard screenshots
│
├── data/
│   ├── Chinook_Sqlite.sqlite
│   ├── Dimension tables
│   └── Fact Sales
│
├── docs/
│   ├── data-model.png
│   └── methodology.md
│
├── sql/
│   ├── 01_sales_analysis.sql
│   ├── 02_sales_analysis.sql
│   └── 03_model_build.sql
│
└── README.md
