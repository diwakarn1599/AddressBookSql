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
