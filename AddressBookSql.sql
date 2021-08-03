--Uc1--
Create database AddressBook;

use AddressBook;

--Uc2--
create table Address_Book_Table
(
FirstName varchar(20) not null,
LastName varchar(20),
address varchar(100),
City varchar(20),
StateName varchar(25),
ZipCode int,
Phonenum bigint,
EmailId varchar(20)
);

--Uc3--
Insert into Address_Book_Table values('Diwakar','N','Ambattur','chennai','Tn',600062,9876543210,'asdf@gmail.com'),
('Gayathri','Sri','Egmore','chennai','Tn',600072,9852343210,'qwer@gmail.com'),
('Surya','S','mogappair','chennai','Tn',600022,9876145210,'surya@gmail.com'),
('Siva','Karthi','Chik','Manglore','karnataka',56872,9885443210,'qazx@gmail.com');
--Insert into Address_Book_Table values ('Siva','Karthi','Chik','Manglore','karnataka',56872,9885443210,'qazx@gmail.com');
Insert into Address_Book_Table values ('Dhruv','Vikram','malleshwaram','banglore','karnataka',56872,9025443210,'dhruv@gmail.com'),('Raju','Bhai','Andheri','Mumbai','Maharashtra',56872,7845443210,'raju@gmail.com');

select * from Address_Book_Table;

--Uc4--
update Address_Book_Table set City='Pursaiwalkam' where FirstName='Gayathri';

update Address_Book_Table set EmailId='siva@gmail.com' where FirstName='Siva';

update Address_Book_Table set LastName='Sivakumar' where FirstName='Surya';

select * from Address_Book_Table;
 --Uc5--
delete from Address_Book_Table where FirstName='Siva';
 
select * from Address_Book_Table;

--Uc6--
Select * from Address_Book_Table where City='chennai' or StateName='Tn';

--Uc7--
Select Count(*) As Count,StateName,City from Address_Book_Table group by StateName,City;

--Uc8--
Select * from Address_Book_Table city where city ='chennai' order by FirstName ASC;

--Uc9--
--Add two columns
ALTER TABLE Address_Book_Table ADD 
AdressBookName varchar(50),AbType varchar(20);


UPDATE  Address_Book_Table SET
AdressBookName='FamilyAddressBook' , AbType = 'Family' 
WHERE
FirstName ='Diwakar' or FirstName='Gayathri';

UPDATE  Address_Book_Table SET
AdressBookName='FriendAddressBook' , AbType = 'Friend' 
WHERE
FirstName ='Surya' or FirstName='Siva';

UPDATE  Address_Book_Table SET
AdressBookName='ProfessionAddressBook' , AbType = 'profession' 
WHERE
FirstName ='Dhruv' or FirstName='Raju';

--Uc10--
Select count(*)as CountAbType, AbType  from Address_Book_Table group by AbType;
Select count(*)as CountAbNames, AdressBookName  from Address_Book_Table group by AdressBookName;

--Uc11--
Insert into Address_Book_Table values ('Surya','S','mogappair','chennai','Tn',600022,9876145210,'surya@gmail.com','FamilyAddressBook','Family');
select * from Address_Book_Table;

----------------------------------------------------------
--Create AddressBook Table
CREATE TABLE AddressBook(
	AddressBookId INT IDENTITY(1,1) PRIMARY KEY,
	AddressBookName VARCHAR(30)
);
--Create Persons Table
CREATE TABLE PersonTypes(
	PersonTypeId INT IDENTITY(1,1) PRIMARY KEY,
	PersonType varchar(50),
	--PersonId INT  FOREIGN KEY REFERENCES Person(PersonId)
);


--Create Table Persons
CREATE TABLE Person(
	PersonId INT IDENTITY(1,1) PRIMARY KEY,
	AddressBookId INT FOREIGN KEY REFERENCES AddressBook(AddressBookId),
	FirstName varchar(30),
	LastName varchar(30),
	Address varchar(30),
	City varchar(30),
	StateName varchar(30),
	ZipCode int,
	PhoneNumber bigint,
	EmailId varchar(30)
);

CREATE TABLE PersonTypesMap(
	PersonId INT FOREIGN KEY REFERENCES Person(PersonId),
	PersonTypeId INT FOREIGN KEY REFERENCES PersonTypes(PersonTypeId)
);



--------------------------------------------------------
--Insert Values into address books
INSERT INTO AddressBook VALUES ('Diwakar'),('Rajini');

SELECT * FROM AddressBook;

--Insert values in persons type
INSERT INTO PersonTypes VALUES ('Family'),('Friend'),('Profession');
SELECT * FROM PersonTypes;


---Insert Values into Persons
INSERT INTO Person VALUES (1,'Gayathri','Sri','Egmore','Chennai','Tn',600062,9876543210,'asdf@asf.com');
INSERT INTO Person VALUES (1,'Nayantara','N','Palakkad','Kochin','Kerala',602536,9985543210,'qwer@asf.com'),(2,'Kamal','Haasan','Adyar','Chennai','Tn',674536,9985595210,'kamal@asf.com');
INSERT INTO Person VALUES (1,'Vijay','N','Palakkad','Kochin','Kerala',602536,9985543210,'qwer@asf.com');
SELECT * FROM Person;



--Insert into persons type map tables
INSERT INTO PersonTypesMap VALUES (1,1),(2,2),(3,3),(4,1);
SELECT * FROM PersonTypesMap;

-----------------------------------------------------------------------------
--Retrive All Data---
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType,pt.PersonTypeId FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId
INNER JOIN PersonTypesMap as ptm On ptm.PersonId = p.PersonId
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = ptm.PersonTypeId;

-------------------------------------------------------------------
--Retrieve based on city and state--
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType,pt.PersonTypeId FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId AND (p.City='Chennai' OR p.StateName='Tn')
INNER JOIN PersonTypesMap as ptm On ptm.PersonId = p.PersonId
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = ptm.PersonTypeId;

-------------------------------------------------------------------------
--Count based on city---
Select Count(*) As Count,StateName,City from Person group by StateName,City;

---------------------------------------------------------------------------
--Sort based on first name
SELECT ab.AddressBookId,ab.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.StateName,p.ZipCode,
p.PhoneNumber,p.EmailId,pt.PersonType,pt.PersonTypeId FROM
AddressBook AS ab 
INNER JOIN Person AS p ON ab.AddressBookId = p.AddressBookId
INNER JOIN PersonTypesMap as ptm On ptm.PersonId = p.PersonId
INNER JOIN PersonTypes AS pt ON pt.PersonTypeId = ptm.PersonTypeId ORDER BY p.FirstName ;
------------------------------------------------------------------------------
--Retreive based on person types---
SELECT COUNT(ptm.PersonTypeId) as Relations,pt.PersonType FROM
PersonTypesMap AS ptm 
INNER JOIN PersonTypes as pt On pt.PersonTypeId = ptm.PersonTypeId
INNER JOIN Person as p ON p.PersonId = ptm.PersonId GROUP BY Ptm.PersonTypeId,pt.PersonType;

