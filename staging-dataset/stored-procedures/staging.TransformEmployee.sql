CREATE OR REPLACE PROCEDURE staging.TransformEmployee()
BEGIN
    MERGE reporting.Employee a
    USING staging.Employee b
    ON
        a.EmployeeID = b.empid
    WHEN NOT MATCHED THEN
    INSERT(EmployeeID, LastName, FirstName, Country, City)
    VALUES(b.empid, b.lastname, b.firstname, b.country, b.city);
END;