CREATE OR REPLACE PROCEDURE staging.TransformCustomer()
BEGIN
    MERGE reporting.Customer a
    USING staging.Customer b
    ON
        a.CustomerID = b.custid
    WHEN NOT MATCHED THEN
    INSERT(CustomerID, CustomerName, Country)
    VALUES(b.custid, b.contactname, b.country);
END;