-- Create database
CREATE database BankDB;

USE BankDB;

-- Create Bank Table

CREATE Table Bank(
Branch_id int,
Branch_name varchar(64),
PRIMARY KEY (Branch_id)
);

-- Create Customer table

CREATE Table Customers(
Customer_id int,
LastName varchar(255),
FirstName varchar(255),
UserName varchar(255),
UserPassword char(24),
Email varchar(255),
Phone char(10),
Branch_id int,
PRIMARY KEY (Customer_id),
FOREIGN KEY (Branch_id) REFERENCES Bank(Branch_id)
);


-- Create Bank Accounts Table

CREATE Table BankAccounts(
Customer_id int,
Account_id int,
CardType VARCHAR(2),
CardNumber VARCHAR(255),
Account_Created date,
Account_Closed date,
Account_Status varchar(32),
Pending_Balance int,
Avail_Balance int,
Branch_id int,
PRIMARY KEY (Account_id),
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
FOREIGN KEY (Branch_id) REFERENCES Bank(Branch_id)
);

-- Create Transaction Types Table

CREATE Table TransactionTypes(
TransactionType varchar(32),
TypeDescription varchar(255),
PRIMARY KEY (TransactionType)
);

-- Create Transactions Table

CREATE Table Transactions (
TransactionNumber int,
TransactionType varchar(32),
Customer_id int,
Account_id int,
CardType VARCHAR(2),
CardNumber VARCHAR(255),
ToAccount varchar(255),
ToCard VARCHAR(255),
Transaction_Status varchar(32),
Transaction_Amount int,
PRIMARY KEY (TransactionNumber),
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

-- Create Transaction History Table

Create Table TransactionHistory(
Account_id int,
Customer_id int,
Transaction_id int,
TransactionNumber int,
Transaction_Status varchar(32),
TransactionType varchar(32),
CardType VARCHAR(2),
CardNumber VARCHAR(255),
Transaction_Info varchar(255),
FromAccount varchar(255),
ToAccount varchar(255),
ToCard varchar(255),
PRIMARY KEY (Transaction_id),
FOREIGN KEY (TransactionNumber) REFERENCES Transactions(TransactionNumber),
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
FOREIGN KEY (Account_id) REFERENCES BankAccounts(Account_id)
);

-- Insert Transaction Types
INSERT INTO TransactionTypes(TransactionType, TypeDescription)
Values('ATM', 'Deposit or withdraw funds using an ATM')

INSERT INTO TransactionTypes(TransactionType, TypeDescription)
Values('Charge', 'Record a purchase on a credit card or withdraw funds using a debit card')

INSERT INTO TransactionTypes(TransactionType, TypeDescription)
Values('Check', 'Withdraw funds by writing a paper check. Choosing this type will automatically insert a number in the \'#\' field (the next number in sequence from the last check recorded')

INSERT INTO TransactionTypes(TransactionType, TypeDescription)
Values('Deposit', 'Add funds to an account by any method')

INSERT INTO TransactionTypes(TransactionType, TypeDescription)
Values('Online', 'Withdraw funds through a web-based store or online banking service')

INSERT INTO TransactionTypes(TransactionType, TypeDescription)
Values('POS', 'Withdraw funds through a point-of-sale transaction (typically a cash or debit card purchase)')

INSERT INTO TransactionTypes(TransactionType, TypeDescription)
Values('Transfer', 'Move funds from one account to another (for more information, see Account Transfers)')

INSERT INTO TransactionTypes(TransactionType, TypeDescription)
Values('Withdrawal', 'Deduct funds from an account by any method.')

-- Insert Banks

INSERT INTO Bank(Branch_id,Branch_name)
VALUES(1,'UniCredit Sofia')

INSERT INTO Bank(Branch_id,Branch_name)
VALUES(2,'UniCredit Plovdiv')

INSERT INTO Bank(Branch_id,Branch_name)
VALUES(3,'UniCredit Varna')

-- Insert USER

INSERT INTO Customers(Customer_id,LastName, FirstName, UserName, UserPassword, email, Phone)
VALUES(1,'Kanchev', 'Kristian', 'kristiankanchev', 'VeryStrongPassword!','somerandom@email.com',0888888888)

-- Insert Bank Account

INSERT INTO BankAccounts(Customer_id,Account_id, CardType, CardNumber, Account_Created, Account_Closed, Account_Status, Pending_Balance, Avail_Balance, Branch_id)
VALUES(1,1, 'D', 4627299917400254, 20120530,NULL,'Open', NULL, 1000, 1)

-- Insert Transactions

INSERT INTO Transactions(TransactionNumber, TransactionType, Customer_id, Account_id, CardType, CardNumber, ToAccount, ToCard, Transaction_Status, Transaction_Amount)
VALUES(01,'Transfer', 1, 1, 'D',4627299917400254,11, 4471595069607530, 'Pending', 200)

-- Insert TransactionHistory

INSERT INTO TransactionHistory(Account_id, Customer_id, Transaction_id, TransactionNumber, Transaction_Status, TransactionType, CardType, CardNumber, Transaction_Info, FromAccount, ToAccount, ToCard)
VALUES(1,1,01,1,'Completed','Transfer','D',4627299917400254,'Transfered for test',1,11,4471595069607530)

