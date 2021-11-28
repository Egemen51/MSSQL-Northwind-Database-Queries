--Company Name, Representative, Address, City, Country information of customers located in Brasil
SELECT  CompanyName, ContactName, [Address],City, Country
FROM Customers
WHERE Country='Brazil'
ORDER BY CompanyName

--Most Expensive 5 products
select Top 5 ProductName,UnitPrice,UnitsInStock from Products
Order By UnitPrice ASC

--Customers whose country is OR Spain, France, or Germany
select * from Customers
where Country='Germany' OR Country='France' OR Country='Spain'

--Customer whose fax number I do not know
select * from Customers
where Fax is NULL

--Records with Mexico City and Contact Title Owner
select * from Customers
where city ='México D.F.' AND ContactTitle ='Owner'

--Names and prices of products starting with C
select * from Products
Where ProductName Like 'C%'

--Number of orders
select DISTINCT Count(ShipCountry) from Orders

--"Address" combining four columns (Name, City, Region and Country)
select CONCAT(ContactName,' ',City,' ',Region,' ',Country) AS Adresses from Customers

--How many products are in category 1?
select Count(UnitsInStock) ProductsNumber from Products
Where CategoryID='1';

--How many different countries do I export to..?
select Count(ShipCountry) As OrderNumbersOfCountry from Orders

--Which countries I export to..?
SELECT DISTINCT Country FROM Customers

--Number of orders of my customer with ALF Customer ID..?
SELECT Count(*) Numbers from Orders
Where CustomerID='ALFKI';

--Total cost of my products
Select Sum(UnitPrice) TotalSumOfProducts from Products

--How much turnover has my company made so far..?
Select Sum(UnitPrice*Quantity*(1-Discount)) As TotalEndorsement from [Order Details]

--Average Product Price
Select AVG(UnitPrice) AveragePriceOfProducts from Products

--Name of Most Expensive Product
SELECT ProductName, UnitPrice from Products
WHERE UnitPrice=(SELECT MAX(UnitPrice) FROM Products)

--Least money making order
SELECT TOP 1  OrderID, SUM(UnitPrice*Quantity) AS [En Kârsýz Sipariþ]
FROM [Order Details]
GROUP BY OrderID
ORDER BY [En Kârsýz Sipariþ] ASC

--Set Units Orders 0 if there is a null expression.
SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0)) as kol
FROM Products;

--Product name of the least profitable order
select SUM([Order Details].UnitPrice* Quantity*(1-Discount)) AS [Kazanc],ProductName from [Order Details]
Inner JOIN Products
ON [Order Details].ProductID = Products.ProductID
Group by Products.ProductName
Order BY [Kazanc] asc;

--Customer with the longest name (number of letters) among my customers
select TOP 1 LEN(ContactName) AS ÝsimUzunluðu, ContactName from Customers
Order By ÝsimUzunluðu DESC;

--Name, Surname and Age of My Employees
select FirstName,LastName,DATEDIFF(year,BirthDate,GETDATE()) As Yaþ from Employees

--How many of each product were bought and their names?
SELECT ProductName, SUM(Quantity) AS [Toplam Sipariþ Miktarý]
FROM [Order Details]
INNER JOIN Products
ON [Order Details].ProductID = Products.ProductID
Group By ProductName
ORDER BY [Toplam Sipariþ Miktarý] DESC

--Which of my customers have never placed an order..?
select * from Customers
where CustomerID Not in (Select CustomerID from Orders)

--Which product is in which category?
select ProductName,CategoryName from products
Inner join Categories
ON Products.CategoryID = Categories.CategoryID

--How many products are there in total in which category..?
SELECT CategoryID, COUNT (CategoryID) AS [Toplam Ürün Sayýsý]
FROM Products
GROUP BY CategoryID

--How many products are there in total in which category.. (with the category name)?
SELECT CategoryName, COUNT (ProductID) AS [Toplam Ürün Sayýsý]
FROM Products
Inner join Categories
On Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName

--Which supplier provides which product?
Select ProductName from Suppliers
Inner Join Products
On Suppliers.SupplierID = Products.SupplierID
Group by ProductName
Order by ProductName Asc

--Which order was sent with which cargo company and when..?
select OrderID,CompanyName from Orders
Inner Join Shippers
On Orders.ShipVia = Shippers.ShipperID

--Which employee received how many orders in total..?
select FirstName, Count(OrderID) As [SÝPARÝÞ MÝKTARI] from Employees e
Inner Join Orders o
ON e.EmployeeID = o.EmployeeID
Group by FirstName
Order by FirstName ASC

-- Which customer placed which order, which employee received it, on which date, by which cargo company, how many of which product was purchased, at what price,
--in which category is the product? Which supplier provided this product?
select * from Orders
Inner Join Employees
ON Orders.EmployeeID = Employees.EmployeeID
Inner Join Customers
ON Orders.CustomerID = Customers.CustomerID
Inner Join [Order Details]
ON Orders.OrderID = [Order Details].OrderID
Inner Join Products
ON Products.ProductID = [Order Details].ProductID
Inner Join Categories
ON Categories.CategoryID = Products.CategoryID
Inner Join Shippers
On Orders.ShipVia = Shippers.ShipperID
Inner Join Suppliers
On Products.SupplierID = Suppliers.SupplierID
ORDER BY Orders.OrderID ASC






