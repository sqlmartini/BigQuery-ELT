CREATE TABLE staging.SalesOrder
(
    orderid INTEGER,
    custid STRING,
    empid INTEGER,
    orderdate DATETIME,
    requireddate DATETIME,
    shippeddate DATETIME,
    shipperid INTEGER,
    freight NUMERIC,
    shipname STRING,
    shipaddress STRING,
    shipcity STRING,
    shipregion STRING,
    shippostalcode STRING,
    shipcountry STRING
)