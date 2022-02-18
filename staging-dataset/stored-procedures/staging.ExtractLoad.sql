CREATE OR REPLACE PROCEDURE staging.ExtractLoad()
BEGIN 
    CREATE OR REPLACE TABLE
    staging.SalesOrder AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from salesorder;");

    CREATE OR REPLACE TABLE
    staging.OrderDetail AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from orderdetail;");

    CREATE OR REPLACE TABLE
    staging.Customer AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from customer;");

    CREATE OR REPLACE TABLE
    staging.Product AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from product;");

    CREATE OR REPLACE TABLE
    staging.Supplier AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from supplier;"); 

    CREATE OR REPLACE TABLE
    staging.Employee AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from employee;");

    CREATE OR REPLACE TABLE
    staging.EmployeeTerritory AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from employeeterritory;");    

    CREATE OR REPLACE TABLE
    staging.Region AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from region;");   

    CREATE OR REPLACE TABLE
    staging.Territory AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from territory;");       

    CREATE OR REPLACE TABLE
    staging.Shipper AS
    SELECT
    *
    FROM
    EXTERNAL_QUERY(" projects/keen-scion-316120/locations/us-central1/connections/demo-postgresql",
        "select * from shipper;");                                                
END;