Use Market
----------------------------
-- Create table DimCustomer
CREATE TABLE DimCustomer (
  [Customer ID] varchar(15) PRIMARY KEY,
  [Customer Name] varchar(30) NOT NULL
);

-- Create table DimSegment
CREATE TABLE DimSegment (
  [Segment ID] varchar(10) PRIMARY KEY,
  [Segment Name] varchar(20) NOT NULL
);

-- Create table DimShip
CREATE TABLE DimShip (
  [Ship ID] varchar(10) PRIMARY KEY,
  [Ship Mode] varchar(20) NOT NULL
);

-- Create table Dimlocation
CREATE TABLE DimLocation (
  [LOC ID] varchar(10) PRIMARY KEY,
  Country varchar(20) NOT NULL,
  Region varchar(15) NOT NULL,
  Market varchar(15) NOT NULL,
  State varchar(100) NOT NULL,
  City varchar(100) NOT NULL
);

-- Create table DimDate
CREATE TABLE DimDate (
  [Order Date] Date PRIMARY KEY,
  Year int NOT NULL,
  Quarter int NOT NULL,
  Month int NOT NULL
);

-- Create table Dimproduct
CREATE TABLE DimProduct (
  [Product ID] varchar(20) PRIMARY KEY,
  [Product Name] varchar(150) NOT NULL,
  Category varchar(30) NOT NULL,
  [Sub-category] varchar(30) NOT NULL
);

-- Create table FOrder
CREATE TABLE FOrder (
  [Row ID] int PRIMARY KEY,
  [Order ID] varchar(20) NOT NULL,
  [Order Date] Date NOT NULL,
  [Ship Date] Date NOT NULL,
  [Customer ID] varchar(15) NOT NULL,
  [Product ID] varchar(20),
  [LOC ID] varchar(10),
  [Segment ID] varchar(10),
  [Ship ID] varchar(10),
  Sales float NOT NULL,
  Quantity int NOT NULL,
  Discount float NOT NULL,
  Profit float NOT NULL,
  [Shipping Cost] float NOT NULL,
  CONSTRAINT FK_Customer FOREIGN KEY ([Customer ID]) REFERENCES DimCustomer ([Customer ID]),
  CONSTRAINT FK_Product FOREIGN KEY ([Product ID]) REFERENCES DimProduct ([Product ID]),
  CONSTRAINT FK_Location FOREIGN KEY ([LOC ID]) REFERENCES DimLocation ([LOC ID]),
  CONSTRAINT FK_Segment FOREIGN KEY ([Segment ID]) REFERENCES DimSegment ([Segment ID]),
  CONSTRAINT FK_Ship FOREIGN KEY ([Ship ID]) REFERENCES DimShip ([Ship ID]),
  CONSTRAINT FK_OrderDate FOREIGN KEY ([Order Date]) REFERENCES DimDate ([Order Date])
);
