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