CREATE OR REPLACE PROCEDURE staging.TransformOrders()
BEGIN
    MERGE reporting.Orders a
    USING 
        (
        SELECT 
            a.orderid as OrderID
            , a.custid as CustomerID
            , a.empid as EmployeeID
            , b.productid as ProductID
            , a.orderdate as OrderDate
            , a.freight as Freight
            , b.unitprice as UnitPrice
            , b.qty as Quantity
            , b.discount as Discount
        FROM 
            staging.SalesOrder a
        INNER JOIN 
            staging.OrderDetail b
        ON
            a.orderid = b.orderid
        ) b
    ON
        a.orderid = b.orderid
    WHEN NOT MATCHED THEN
    INSERT(OrderID, CustomerID, EmployeeID, ProductID, OrderDate, Freight, UnitPrice, Quantity, Discount)
    VALUES(b.OrderID, b.CustomerID, b.EmployeeID, b.ProductID, b.OrderDate, b.Freight, b.UnitPrice, b.Quantity, b.Discount);
END;