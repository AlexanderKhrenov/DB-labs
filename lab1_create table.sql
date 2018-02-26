create database LoanAccounting
use LoanAccounting
drop table Payments, Customers, interests, purposes, urgencies, loans


create table Customers(
IDCode bigint NOT NULL identity(1000000000,1),
firstName varchar(15) NOT NULL default('ChangeThis'),
lastName varchar(15) NOT NULL default('ChangeThis'),
midName varchar(15) NOT NULL default('ChangeThis'),
email varchar(50) NOT NULL default('ChangeThis@ua.ua'),
telephone varchar(10) default('0000000000'),
PRIMARY KEY (IDCode)
); 


create table interests(
ID int NOT NULL identity(1,1) PRIMARY KEY,
name varchar(15) UNIQUE NOT NULL
);

create table purposes(
ID int NOT NULL identity(1,1) PRIMARY KEY,
name varchar(15) UNIQUE NOT NULL
);

create table urgencies(
ID int NOT NULL identity(1,1) PRIMARY KEY,
name varchar(15) UNIQUE NOT NULL
);

create table loans(
ID bigint NOT NULL identity(1000000000,1),
CustomerID bigint FOREIGN KEY REFERENCES Customers(IDCode),
interestID int FOREIGN KEY REFERENCES interests(ID) NOT NULL default(1),
purposeID int FOREIGN KEY REFERENCES purposes(ID) NOT NULL default(1),
urgencyID int FOREIGN KEY REFERENCES urgencies(ID) NOT NULL default(1),
startDate date DEFAULT(getdate()) NOT NULL,
endDate date NOT NULL default(getdate()),
moneyAmount money NOT NULL default(0),
interestRate decimal(5,3) DEFAULT(0) NOT NULL,
interestAmount money DEFAULT(0) NOT NULL,
PRIMARY KEY (ID)
);

create table Payments(
loanID bigint NOT NULL,
PaymentDate datetime DEFAULT(getdate()) NOT NULL,
income decimal(10,2) NOT NULL,
FOREIGN KEY (loanID) REFERENCES loans(ID), 
PRIMARY KEY (loanID, PaymentDate)
);

