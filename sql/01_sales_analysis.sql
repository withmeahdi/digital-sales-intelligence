-- =====================================================
-- SALES ANALYSIS
-- =====================================================

-- 1. View sample invoices
SELECT *
FROM chinook.Invoice
LIMIT 10;


-- 2. Select important invoice columns
SELECT
    InvoiceId,
    CustomerId,
    InvoiceDate,
    Total
FROM chinook.Invoice
LIMIT 10;


-- 3. Count total invoices
SELECT
    COUNT(*) AS total_invoices
FROM chinook.Invoice;


-- 4. Calculate total sales
SELECT
    SUM(Total) AS total_sales
FROM chinook.Invoice;


-- 5. Analyze sales by country
SELECT
    BillingCountry,
    SUM(Total) AS total_sales
FROM chinook.Invoice
GROUP BY BillingCountry
ORDER BY total_sales DESC;