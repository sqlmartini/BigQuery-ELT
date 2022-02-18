CREATE OR REPLACE PROCEDURE staging.TransformProduct()
BEGIN
    MERGE reporting.Product a
    USING 
        (
        SELECT 
            a.productid ProductID
            , a.productname ProductName
            , b.companyname CompanyName
            , b.country Country
            , a.unitprice UnitPrice
            , a.discontinued Discontinued
        FROM 
            staging.Product a
        INNER JOIN 
            staging.Supplier b
        ON
            a.supplierid = b.supplierid
        ) b
    ON
        a.ProductID = b.ProductID
    WHEN NOT MATCHED THEN
    INSERT(ProductID, ProductName, CompanyName, Country, UnitPrice, Discontinued)
    VALUES(b.ProductID, b.ProductName, b.CompanyName, b.Country, b.UnitPrice, b.Discontinued);
END;