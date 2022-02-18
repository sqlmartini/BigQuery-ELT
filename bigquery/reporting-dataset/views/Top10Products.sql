CREATE VIEW reporting.Top10Products AS
WITH ProductRanking AS 
(
SELECT 
    b.ProductName
    , SUM(a.UnitPrice * a.Quantity) as TotalPrice
    , RANK() OVER(ORDER BY (SUM(a.UnitPrice * a.Quantity)) DESC) as Ranking
FROM 
    reporting.Orders a
INNER JOIN 
    reporting.Product b
ON
    a.ProductID = b.ProductID
GROUP BY 
    b.ProductName
)
SELECT * FROM ProductRanking  WHERE Ranking <= 10 ORDER BY Ranking