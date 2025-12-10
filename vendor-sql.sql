-- CREATE OR REPLACE VIEW vendordata.vw_brand_purchase_summary AS
-- SELECT Brand, PurchasePrice, SUM(Quantity) AS total_quantity, SUM(Dollars) AS total_dollars
-- FROM vendordata.purchases
-- GROUP BY Brand, PurchasePrice;

-- select * from vendordata.vw_brand_purchase_summary;

CREATE OR REPLACE TABLE vendordata.vendor_summary AS
WITH FreightSummary AS (
        SELECT VendorNumber, SUM(Freight) AS FreightCost
        FROM vendordata.vendor_invoice
        GROUP BY VendorNumber
    ),
    PurchaseSummary AS (
    SELECT p.VendorNumber, p.VendorName, p.Brand, p.Description, p.PurchasePrice, 
    pp.Price AS ActualPrice, pp.Volume, SUM(p.Quantity) AS TotalPurchaseQuantity, 
    SUM(p.Quantity * p.PurchasePrice) AS TotalPurchaseDollars
    FROM vendordata.purchases p
    JOIN vendordata.purchase_prices pp ON p.Brand = pp.Brand
    WHERE p.PurchasePrice > 0
    GROUP BY p.VendorNumber, p.VendorName, p.Brand, p.Description, p.PurchasePrice, pp.Price, pp.Volume
   ),
   SalesSummary AS(
    SELECT VendorNo, Brand, SUM(SalesQuantity) AS TotalSalesQuantity, 
    SUM(SalesDollars) AS TotalSalesDollars, SUM(SalesPrice) AS TotalSalesPrice, 
    SUM(ExciseTax) AS TotalExciseTax
    FROM vendordata.sales
    GROUP BY VendorNo, Brand 
)
    SELECT ps.VendorNumber, ps.VendorName, ps.Brand, ps.Description, ps.PurchasePrice, 
    ps.ActualPrice, ps.Volume, ps.TotalPurchaseQuantity, ps.TotalPurchaseDollars, 
    ss.TotalSalesQuantity, ss.TotalSalesPrice, ss.TotalSalesDollars, ss.TotalExciseTax, 
    fs.FreightCost
    FROM PurchaseSummary ps
    LEFT JOIN SalesSummary ss ON ps.VendorNumber = ss.VendorNo AND ps.Brand = ss.Brand
    LEFT JOIN FreightSummary fs ON ps.VendorNumber = fs.VendorNumber
    ORDER BY ps.TotalPurchaseDollars DESC;