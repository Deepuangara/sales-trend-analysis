-- 🔹 1. View All Records
SELECT * FROM sales;

-- 🔹 2. View Sorted Data by Gender, Country, etc.
SELECT * 
FROM sales 
ORDER BY Customer_Gender, Country, Order_Quantity, State, Product_Category, Sub_Category, Product;

-- 🔹 3. Total Sales
SELECT SUM(Revenue) AS TotalSales 
FROM sales;

-- 🔹 4. Monthly Sales Trend by Year & Month
SELECT 
    Year, 
    Month, 
    SUM(Revenue) AS MonthlySales
FROM Sales
GROUP BY Year, Month
ORDER BY Year, 
    FIELD(Month, 'January', 'February', 'March', 'April', 'May', 'June', 
                  'July', 'August', 'September', 'October', 'November', 'December');

-- 🔹 5. Top 5 Best-Selling Products
SELECT 
    Product, 
    SUM(Revenue) AS Best_Selling_Products 
FROM sales 
GROUP BY Product 
ORDER BY Best_Selling_Products DESC 
LIMIT 5;

-- 🔹 6. Revenue by Customer Age
SELECT 
    Customer_Age, 
    SUM(Revenue) AS Highest_Sales 
FROM sales 
GROUP BY Customer_Age 
ORDER BY Highest_Sales DESC;

-- 🔹 7. Number of Transactions by Unit Cost
SELECT 
    Unit_Cost, 
    COUNT(Revenue) AS TotalTransactions 
FROM sales 
GROUP BY Unit_Cost;

-- 🔹 8. Total Number of Transactions
SELECT COUNT(*) AS TotalTransactions 
FROM sales;

-- 🔹 9. Revenue by Gender
SELECT 
    Customer_Gender, 
    SUM(Revenue) AS TotalRevenue 
FROM sales 
GROUP BY Customer_Gender;

-- 🔹 10. Earliest and Latest Transaction Dates
SELECT 
    MIN(Date) AS EarliestTransaction, 
    MAX(Date) AS OldestTransaction 
FROM sales;

-- 🔹 11. Average Revenue Per Transaction
SELECT AVG(Revenue) AS AvgRevenue 
FROM sales;

-- 🔹 12. Top 3 Best-Selling Products by Revenue
SELECT 
    Product, 
    SUM(Revenue) AS Best_Selling_Products 
FROM sales 
GROUP BY Product 
ORDER BY Best_Selling_Products DESC 
LIMIT 3;

-- 🔹 13. Highest Revenue Age Group
SELECT 
    Age_Group, 
    SUM(Revenue) AS HighestRevenue 
FROM sales 
GROUP BY Age_Group 
ORDER BY HighestRevenue DESC 
LIMIT 1;

-- 🔹 14. Average Revenue per Product Category
SELECT 
    Product_Category, 
    AVG(Revenue) AS AvgRevenue 
FROM sales 
GROUP BY Product_Category 
ORDER BY AvgRevenue DESC;

-- 🔹 15. Monthly Revenue Trend for 2023
SELECT 
    MONTH(Date) AS Month, 
    SUM(Revenue) AS Trend 
FROM sales 
WHERE YEAR(Date) = 2023 
GROUP BY MONTH(Date) 
ORDER BY Month;

-- 🔹 16. Monthly Revenue Trend for 2012
SELECT  
    MONTH(Date) AS Month,  
    SUM(Revenue) AS TotalRevenue  
FROM Sales  
WHERE YEAR(Date) = 2012
GROUP BY MONTH(Date)  
ORDER BY Month;

-- 🔹 17. Product Category with Highest Sales Percentage
SELECT  
    Product_Category,  
    (SUM(Revenue) * 100.0) / (SELECT SUM(Revenue) FROM Sales) AS Sales_Percentage  
FROM Sales  
GROUP BY Product_Category  
ORDER BY Sales_Percentage DESC  
LIMIT 1;

-- 🔹 18. Gender-Wise Revenue by Product Category
SELECT  
    Customer_Gender,  
    Product_Category,  
    SUM(Revenue) AS TotalRevenue  
FROM Sales  
GROUP BY Customer_Gender, Product_Category  
ORDER BY TotalRevenue DESC;

-- 🔹 19. Year-over-Year Sales Growth (Using CTE)
WITH YearlySales AS (  
    SELECT  
        YEAR(Date) AS Sales_Year,  
        SUM(Revenue) AS TotalRevenue  
    FROM Sales  
    GROUP BY YEAR(Date)  
)  
SELECT  
    Y1.Sales_Year,  
    Y1.TotalRevenue,  
    ((Y1.TotalRevenue - Y0.TotalRevenue) / Y0.TotalRevenue) * 100 AS YoY_Growth 
FROM YearlySales Y1  
LEFT JOIN YearlySales Y0  
ON Y1.Sales_Year = Y0.Sales_Year + 1  
ORDER BY Y1.Sales_Year;
