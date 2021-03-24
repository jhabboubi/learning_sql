-- Prepared by Jafer Alhaboubi on March 2021
-- Using MariaDB with Sequel Proud


-- Comment in one line only!

/*
Multiple lines of comments
 */
 
-- use classicmodels database 
USE `classicmodels`;

-- select all column/fields/attributes/entity_type from the customers table/domain/entity 
select * from customers;

/* 
SQL COUNT(), AVG() and SUM() Functions
The COUNT() function returns the number of rows that matches a specified criterion.
The AVG() function returns the average value of a numeric column. 
The SUM() function returns the total sum of a numeric column. 
source: https://www.w3schools.com/sql/sql_count_avg_sum.asp
source for all built-in functions https://mariadb.com/kb/en/built-in-functions/
*/
select count(*) from customers;

-- select all fields from the customer table where the field country is equal to Germany (case senstive)

select *
from customers
where country='Germany';


-- insert a new record into customer table 

insert into customers values(497, 'Jenny', 'Jenny', 'Jones', '917-433-2828', '12 Mockingbird Lanes', null, 'Omaha', 'NE', '54550', 'USA', 1323, 2000.00);

-- build insert using field-list

insert into payments (`customerNumber`, `checkNumber`, `paymentDate`, `amount`)
values (121,'XL55793','2017-12-13',1258.16),
(121,'QQ27862','2017-12-13',3426.26);

-- updating a record or multiple can be achieved by keywords `update` and `set`  

update payments set amount=1400 where customerNumber=121 and checkNumber='XL55793';

-- deleting a record or multiple records can be achieved by keyword `delete`

delete from payments where customerNumber=121 and paymentDate='2017-12-13';

-- Transactions, Rollback, and Commit

select count(*) from employees;

start transaction;
delete from employees where employeeNumber=28;
select count(*) from employees;
rollback;
select count(*) from employees;

-- create a table and define the colums name, datatype, constraints 
create table jdpitts(
	id int not null auto_increment,
	name varchar(50),
	email varchar(100),
	CONSTRAINT jdpittstable_pk PRIMARY KEY (id)
);


-- creating another table with FK
CREATE TABLE jdpitts_details (
  id_jd int(11) NOT NULL,
  computer varchar(50) NOT NULL,
  ram int(11) NOT NULL,
  diskspace decimal(10,2) NOT NULL,
  PRIMARY KEY (id_jd),
  CONSTRAINT jdpitts_ibfk_1 FOREIGN KEY (id_jd) 
	REFERENCES jdpitts (id)
);

insert into jdpitts (`name`, `email`)values ('Jafer alhaboubi', 'jalhaboubi@perscholas.org');

insert into jdpitts_details values (1, 'macbook', 16, 500.25);

-- alter table 

alter table jdpitts modify name varchar(100);

-- create users 

CREATE OR REPLACE USER jd@localhost IDENTIFIED BY 'root';

SHOW GRANTS;
SHOW GRANTS FOR CURRENT_USER;
-- % (wildcard) here meaning logging in from any location will work!
SHOW GRANTS FOR 'jd'@'%';

-- join tables
select * from employees as e join customers as c  on e.`employeeNumber` = c.`salesRepEmployeeNumber` ;

-- group by only
select lastName from employees as e join customers as c  on e.`employeeNumber` = c.`salesRepEmployeeNumber` group by lastName ;

-- without alias
select lastName, count(lastName) from employees as e join customers as c  on e.`employeeNumber` = c.`salesRepEmployeeNumber` group by lastName;


-- with alias
select lastName, count(lastName) as Customers from employees as e join customers as c  on e.`employeeNumber` = c.`salesRepEmployeeNumber` group by lastName;


-- having > 7 for promotion
select lastName, count(lastName) as Customers from employees as e join customers as c  on e.`employeeNumber` = c.`salesRepEmployeeNumber` group by lastName having customers > 7;


-- limit 3 records 
select lastName, count(lastName) as Customers from employees as e join customers as c  on e.`employeeNumber` = c.`salesRepEmployeeNumber` group by lastName having customers > 7  order by limit 3;

-- using order by
select lastName, count(lastName) as Customers from employees as e join customers as c  on e.`employeeNumber` = c.`salesRepEmployeeNumber` group by lastName order by Customers;

-- class ex
select e.lastName, count(e.lastName) as Freq from employees as e inner join customers as c  on e.`employeeNumber` = c.`salesRepEmployeeNumber` where c.customerNumber is NOT NULL group by e.lastName having Freq > 7 order by Freq desc limit 3 ;



-- https://drive.google.com/file/d/1GMNCHH6OqCA3S_ChmRvvG1BzHE_mJLUC/view

select CURRENT_DATE();

select DATE_FORMAT(CURRENT_DATE(),'%Y');

select YEAR(CURRENT_DATE()) as 'CURRENT YEAR';

select DATEDIFF(CURRENT_DATE(),'2021-01-01') as DIFF;


SELECT IF(DATEDIFF(CURRENT_DATE(),'2021-01-01')>90, 'More than 3 months', 'Less than 3 months') as '1st Quarter' ;

