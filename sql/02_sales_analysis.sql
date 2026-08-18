-- =====================================================
-- 02 SALES ANALYSIS
-- Digital Sales Intelligence
-- =====================================================


-- 1. Total sales
SELECT
    SUM(Total) AS total_sales
FROM chinook.Invoice;


-- 2. Total number of invoices
SELECT
    COUNT(*) AS total_invoices
FROM chinook.Invoice;


-- 3. Average invoice value
SELECT
    AVG(Total) AS average_invoice_value
FROM chinook.Invoice;


-- 4. Sales by country
SELECT
    BillingCountry,
    COUNT(*) AS total_invoices,
    SUM(Total) AS total_sales,
    AVG(Total) AS average_invoice_value
FROM chinook.Invoice
GROUP BY BillingCountry
ORDER BY total_sales DESC;


-- 5. Top 10 customers by sales
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country,
    SUM(i.Total) AS total_sales
FROM chinook.Customer c
JOIN chinook.Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country
ORDER BY total_sales DESC
LIMIT 10;


-- 6. Sales by year
SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS sales_year,
    COUNT(*) AS total_invoices,
    SUM(Total) AS total_sales
FROM chinook.Invoice
GROUP BY sales_year
ORDER BY sales_year;


-- 7. Sales by month
SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS sales_year,
    EXTRACT(MONTH FROM InvoiceDate) AS sales_month,
    SUM(Total) AS total_sales
FROM chinook.Invoice
GROUP BY
    sales_year,
    sales_month
ORDER BY
    sales_year,
    sales_month;


-- 8. Top 10 invoices
SELECT
    InvoiceId,
    CustomerId,
    InvoiceDate,
    Total
FROM chinook.Invoice
ORDER BY Total DESC
LIMIT 10;


-- 9. Sales by customer country
SELECT
    c.Country,
    COUNT(DISTINCT c.CustomerId) AS total_customers,
    SUM(i.Total) AS total_sales
FROM chinook.Customer c
JOIN chinook.Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY total_sales DESC;


-- 10. Sales by customer
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    COUNT(i.InvoiceId) AS total_invoices,
    SUM(i.Total) AS total_sales,
    AVG(i.Total) AS average_invoice_value
FROM chinook.Customer c
JOIN chinook.Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName
ORDER BY total_sales DESC;

WITH kinerjaperbulan AS (
    SELECT
        DATE_TRUNC('month', InvoiceDate) AS month,
        ROUND(SUM(total), 2) AS revenue
    FROM chinook.invoice
    GROUP BY month
)

SELECT
    STRFTIME(month, '%Y-%m') AS month,
    revenue,
    revenue - LAG(revenue) OVER (
        ORDER BY month
    ) AS revenue_change
FROM kinerjaperbulan
ORDER BY month;