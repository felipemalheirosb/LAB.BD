use NorthWind

CREATE TABLE Address (
AddressID INT IDENTITY NOT NULL,
AddressNumber INT NOT NULL,
AddressName VARCHAR(30) NOT NULL,
AddressNeighborhood VARCHAR(30) NOT NULL,
City VARCHAR(15) NOT NULL,
Region VARCHAR(15) NOT NULL,
PostalCode VARCHAR(10) NOT NULL,
Country VARCHAR(15) NOT NULL,
RegionDescription CHAR(50) NOT NULL,
CONSTRAINT Address_PK PRIMARY KEY (AddressID)
);

INSERT INTO Address (AddressNumber,
					 AddressName,
					 AddressNeighborhood,
					 City,
					 Region,
					 PostalCode,
					 Country,
					 RegionDescription)
VALUES (185,
		'Jose Vitorino',
		'Bodocongo',
		'Campina Grande',
		'Nordeste',
		'58430226',
		'Brazil',
		'Região Nordeste do Brasil');


CREATE TABLE Suppliers (
SupplierID INT IDENTITY NOT NULL,
AddressID INT NOT NULL,
CompanyName VARCHAR(40) NOT NULL,
ContactName VARCHAR(30) NOT NULL,
ContactTitle VARCHAR(30) NOT NULL,
Phone VARCHAR(24) NOT NULL,
Fax VARCHAR(24) NOT NULL,
HomePage TEXT NOT NULL,
CONSTRAINT SupplierID_PK PRIMARY KEY (SupplierID),
CONSTRAINT Address_Suppliers_FK FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
);

INSERT INTO Suppliers (AddressID,
					   CompanyName,
					   ContactName,
					   ContactTitle,
					   Phone,
					   Fax,
					   HomePage)
VALUES (1,
		'Fábrica de Moedas',
		'Felipe Malheiros',
		'CEO',
		'83988522430',
		'+558330771944',
		'http://fabricamoedas.com');
	
CREATE TABLE Categories (
CategoryID INT IDENTITY NOT NULL,
CategoryName VARCHAR(15) NOT NULL,
Description TEXT NOT NULL,
Picture IMAGE NOT NULL,
CONSTRAINT CategoryID_PK PRIMARY KEY (CategoryID)
);

INSERT INTO Categories (CategoryName,
					   Description,
					   Picture)
VALUES ('Flor de cunho',
		'Moedas não circuladas',
		'http://fabricamoedas.com/image.jpg');

INSERT INTO Categories (CategoryName,
					   Description,
					   Picture)
VALUES ('MVC',
		'Moedas circuladas',
		'http://fabricamoedas.com/image1.jpg');

INSERT INTO Categories (CategoryName,
					   Description,
					   Picture)
VALUES ('Soberba',
		'Moedas muito circuladas ',
		'http://fabricamoedas.com/image2.jpg');

CREATE TABLE Products (
ProductID INT IDENTITY NOT NULL,
ProductName VARCHAR(40) NOT NULL,
SupplierID INT NOT NULL,
CategoryID INT NOT NULL,
QuantityPerUnit VARCHAR(20) NOT NULL,
UnitPrice MONEY NOT NULL,
UnitsInStock SMALLINT NOT NULL,
UnitsOnOrder SMALLINT NOT NULL,
ReorderLevel SMALLINT NOT NULL,
Discontinued BIT NOT NULL,
CONSTRAINT ProductID_PK PRIMARY KEY (ProductID),
CONSTRAINT Products_Suppliers_FK FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
CONSTRAINT Products_Categories_FK FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO Products (ProductName,
					  SupplierID,
					  CategoryID,
					  QuantityPerUnit,
					  UnitPrice,
					  UnitsInStock,
					  UnitsOnOrder,
					  ReorderLevel,
					  Discontinued)
VALUES ('Moeda Olimpiadas 2016',
		1,
		1,
		'100',
		4.50,
		1000,
		100,
		2000,
		0);

CREATE TABLE Employees (
EmployeeID INT IDENTITY NOT NULL,
AddressID INT NOT NULL,
LastName VARCHAR(20) NOT NULL,
FirstName VARCHAR(10) NOT NULL,
Title VARCHAR(30) NOT NULL,
TitleOfCourtesy VARCHAR(25) NOT NULL,
BirthDate DATETIME NOT NULL,
HireDate DATETIME NOT NULL,
HomePhone VARCHAR(24) NOT NULL,
Extension VARCHAR(4) NOT NULL,
Photo IMAGE NOT NULL,
Notes TEXT NOT NULL,
ReportsTo INT NOT NULL,
PhotoPath VARCHAR(255) NOT NULL,
CONSTRAINT EmployeeID_PK PRIMARY KEY (EmployeeID),
CONSTRAINT Address_Employees_FK FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE Customers (
CustomerID INT IDENTITY NOT NULL,
AddressID INT NOT NULL,
CompanyName VARCHAR(40) NOT NULL,
ContactName VARCHAR(30) NOT NULL,
ContactTitle VARCHAR(30) NOT NULL,
Phone VARCHAR(24) NOT NULL,
Fax VARCHAR(24) NOT NULL,
CONSTRAINT CustomerID_PK PRIMARY KEY (CustomerID),
CONSTRAINT Address_Customers_FK FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE Shippers (
ShipperID INT IDENTITY NOT NULL,
CompanyName VARCHAR(40) NOT NULL,
Phone VARCHAR(24) NOT NULL,
ShippedDate DATETIME NOT NULL,
ShipVia INT NOT NULL,
ShipName VARCHAR(40) NOT NULL,
ShipAddress VARCHAR(60) NOT NULL,
ShipCity VARCHAR(15) NOT NULL,
ShipRegion VARCHAR(15) NOT NULL,
ShipPostalCode VARCHAR(10) NOT NULL,
ShipCountry VARCHAR(15) NOT NULL,
CONSTRAINT Shippers_PK PRIMARY KEY (ShipperID)
);

CREATE TABLE Orders(
OrderID INT IDENTITY NOT NULL,
CustomerID INT NOT NULL,
EmployeeID INT NOT NULL,
ShipperID INT NOT NULL,
OrderDate DATETIME NOT NULL,
RequiredDate DATETIME NOT NULL,
Freight MONEY NOT NULL,
CONSTRAINT Order_PK PRIMARY KEY (OrderID),
CONSTRAINT Orders_Employees_FK FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
CONSTRAINT Orders_Customers_FK FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
CONSTRAINT Orders_Shippers_FK FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

CREATE TABLE Order_Details (
OrderID INT IDENTITY NOT NULL,
ProductID INT NOT NULL,
UnitPrice MONEY NOT NULL,
Quantity SMALLINT NOT NULL,
Discount REAL NOT NULL,
CONSTRAINT Order_Details_FK FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
CONSTRAINT Order_Details_ProductID_FK FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Region (
RegionID INT IDENTITY NOT NULL,
RegionDescription CHAR(50) NOT NULL,
CONSTRAINT Region_PK PRIMARY KEY (RegionID)
);

CREATE TABLE Territories (
TerritoryID VARCHAR(20) NOT NULL,
RegionID INT NOT NULL,
TerritoryDescription CHAR(50) NOT NULL,
CONSTRAINT Territories_PK PRIMARY KEY (TerritoryID),
CONSTRAINT Territories_Region_FK FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE EmployeeTerritories (
EmployeeID INT NOT NULL,
TerritoryID VARCHAR(20) NOT NULL,
CONSTRAINT EmployeeTerritories_Employee_PK FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
CONSTRAINT EmployeeTerritories_Territory_PK FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
);

CREATE TABLE CustomerDemographics (
CustomerTypeID CHAR(10) NOT NULL,
CustomerDesc TEXT NOT NULL,
CONSTRAINT CustomerType_PK PRIMARY KEY (CustomerTypeID)
);

CREATE TABLE CustomerDemo (
CustomerID INT NOT NULL,
CustomerTypeID CHAR(10) NOT NULL,
CONSTRAINT CustomerCustomerDemo_Customers_FK FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
CONSTRAINT CustomerCustomerDemo_CustomerDemographics_FK FOREIGN KEY (CustomerTypeID) REFERENCES CustomerDemographics(CustomerTypeID)
);



select * from CustomerDemo
select * from CustomerDemographics
select * from EmployeeTerritories
select * from Territories   --Território
select * from Region        --Região
select * from Order_Details --Encomenda_detalhes
select * from Orders        --Encomendas/pedidos
select * from Shippers 
select * from Customers     --Clientes
select * from Employees     --Empregados
select * from Products      --Produtos
select * from Categories    --Categorias
select * from Suppliers     --Fornecedores
select * from Address