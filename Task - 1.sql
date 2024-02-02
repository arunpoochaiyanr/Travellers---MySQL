-- a. Create a schema named Travego.
-- Creating Database Travego 
create database if not exists travego;

-- Checking whether the Database 'Travego' is created
show databases;

use travego;

-- b.Create the tables mentioned above with the mentioned column names
-- Creating the table 'passenger'
create table if not exists passenger (
Passenger_id int,
Paseenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20) );
 
 -- Creating the table 'price'
 create table if not exists price (
 id int,
 Bus_Type varchar(20),
 Distance int,
 Price int );
 
 -- Checking whether both the tables are present and the column datatypes
 show tables;
 describe passenger;
 describe price;
 
 -- c.Insert the data in the newly created tables using sql script or using MySQL UI. 
 -- Passenger Table Creation
 insert into passenger values
 (1,'Sejal',   'AC',    'F','Bengaluru', 'Chennai',  350,'Sleeper'),
 (2,'Anmol',   'Non-AC','M','Mumbai',    'Hyderabad',700,'Sitting'),
 (3,'Pallavi', 'AC',    'F','Panaji',    'Bengaluru',600,'Sleeper'),
 (4,'Khusboo', 'AC',    'F','Chennai',   'Mumbai',   1500,'Sleeper'),
 (5,'Udit',    'Non-AC','M','Trivandrum','Panaji',   1000,'Sleeper'),
 (6,'Ankur',   'AC',    'M','Nagpur',    'Hyderabad',500,'Sitting'),
 (7,'Hemant',  'Non-AC','M','Panaji',    'Mumbai',   700,'Sleeper'),
 (8,'Manish',  'Non-AC','M','Hyderabad', 'Bengaluru',500,'Sitting'),
 (9,'Piyush',  'AC',    'M','Pune',      'Nagpur',   700,'Sitting');

-- Checking the passenger table
select * from passenger;

-- Price Table Creation
insert into price values
(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

-- Checking the price table
select * from price;

-- making the two individuals columns in the passenger and price tables as primary keys
alter table passenger modify passenger_id int primary key;
alter table price modify id int primary key;
alter table passenger change paseenger_name passenger_name varchar(20);