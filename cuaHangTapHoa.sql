CREATE DATABASE grocery

GO

USE grocery

GO

CREATE TABLE Category (
	id INT PRIMARY KEY IDENTITY,
	name VARCHAR(50)
)

GO

CREATE TABLE Unit(
	id INT PRIMARY KEY IDENTITY,
	name VARCHAR(50)
)

GO

CREATE TABLE Supplier(
	id INT PRIMARY KEY,
	name VARCHAR(100),
	address VARCHAR(50),
	phone VARCHAR(50)
)

GO

CREATE TABLE Product (
	barcode VARCHAR(20) PRIMARY KEY,
	name VARCHAR(50),
	unit INT FOREIGN KEY REFERENCES Unit(id),
	quantity INT,
	idCategory INT FOREIGN KEY REFERENCES Category(id),
	idSupplier INT FOREIGN KEY REFERENCES Supplier(id),	 
	importPrice FLOAT, 
	exportPrice FLOAT,
	ManufacturingDate DATE,
	ExpiryDate DATE,
	image VARCHAR
)

GO

CREATE TABLE Employee(
	id VARCHAR(20) PRIMARY KEY,
	name NVARCHAR(50),
	address VARCHAR(50),
	phone VARCHAR (50),
	image VARCHAR,
	status BIT,
	username VARCHAR(50),
	password VARCHAR(50)
)

GO

CREATE TABLE Customer (
	id VARCHAR(20) PRIMARY KEY,
	name NVARCHAR(50),
	address VARCHAR(50),
	phone VARCHAR(50),
	status BIT
)

GO

CREATE TABLE Bill(
	id VARCHAR PRIMARY KEY,
	date DATE,
	idEmployee VARCHAR(20) FOREIGN KEY REFERENCES Employee(id),
	idCustomer VARCHAR(20) FOREIGN KEY REFERENCES Customer(id)
)

GO

CREATE TABLE BillDetail(
	idBill VARCHAR FOREIGN KEY REFERENCES Bill(id),
	idProduct VARCHAR(20) FOREIGN KEY REFERENCES Product(barcode),
	quantity INT,
	price FLOAT,
	intoMoney FLOAT
)

GO

CREATE TABLE Import (
	id VARCHAR(50),
	idEmployee VARCHAR(20) FOREIGN KEY REFERENCES Employee(id),
	importDate DATE,
	idSupplier INT FOREIGN KEY REFERENCES Supplier(id),
	totalPrice FLOAT,
	note TEXT
)


CREATE TABLE tblImportDetail (
	idImport VARCHAR(50) FOREIGN KEY REFERENCES Import(id),
	barcode VARCHAR(20) FOREIGN KEY REFERENCES Product(barcode),
	quantity INT,
	price FLOAT,
	totalPrice FLOAT 
)