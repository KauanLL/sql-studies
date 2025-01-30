SELECT
    c.ContactName AS Cliente,
    p.ProductName AS Produto,
    od.Quantity AS Quantidade,
    p.QuantityPerUnit AS Unidade,
    ct.CategoryName AS Categoria,
    o.OrderDate as Data
FROM
    `Order Details` od
JOIN
    Customers c ON c.CustomerID = o.CustomerID
JOIN
    Products p ON p.ProductID = od.ProductID
JOIN
    Orders o ON o.OrderID = od.OrderID
JOIN
    Categories ct ON ct.CategoryID = p.CategoryID
WHERE
    o.OrderDate >= DATE('now', '-2 year')
    AND ct.CategoryID = 1
ORDER BY
    o.OrderDate DESC
LIMIT 10;