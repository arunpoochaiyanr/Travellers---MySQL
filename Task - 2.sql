use travego;
show tables;
describe passenger;
describe price;
select * from passenger;
select * from price;

-- a. How many females and how many male passengers traveled a minimum distance of 600 KMs?
select count(*) as `Female Passengers travelled a min of 600kms` 
from passenger 
where gender like 'F' and distance >=600;

select count(*) as `Male Passengers travelled a min of 600kms` 
from passenger 
where gender like 'M' and distance >=600;

-- or

select gender, COUNT(*) AS `count of passengers travelled more than 600kms`
from passenger
where distance>= 600
group by gender;

-- b. Find the minimum ticket price of a Sleeper Bus. 
select min(price) as `Min Sleeper Ticket` from price where Bus_type like 'Sleeper';

-- or
select * from price where bus_type = 'sleeper' order by price asc limit 1;


-- c.	Select passenger names whose names start with character 'S'.
select * from passenger where Passenger_name like 's%';

-- d. Calculate price charged for each passenger displaying 
-- Passenger name, Boarding City, Destination City, Bus_Type, Price in the output

select passenger.passenger_name, passenger.boarding_city,passenger.destination_city,passenger.bus_type,price.price 
from passenger,price 
where passenger.distance = price.distance and passenger.bus_type = price.bus_type
order by passenger_name asc;

-- or

select passenger_name,boarding_city,destination_city,passenger.bus_type,price.price 
from passenger 
left join price on passenger.distance = price.distance and passenger.bus_type = price.bus_type
order by passenger_name asc;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? 
select passenger.passenger_name as `People who travelled more than 1000kms`,passenger.distance,passenger.bus_type,price.price
from passenger,price
where passenger.distance = price.distance and passenger.bus_type = price.bus_type
having distance >= 1000 and bus_type like 'sitting';

-- or

select passenger_name,passenger.distance,passenger.bus_type,price.price
from passenger 
left join price on  passenger.distance = price.distance and passenger.bus_type = price.bus_type
where passenger.distance >= 1000 and passenger.bus_type = 'sitting';


-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select passenger.passenger_name,passenger.bus_type,passenger.boarding_city,passenger.destination_city,passenger.distance,price.price
from passenger,price
where passenger.distance = price.distance and passenger.bus_type = price.bus_type
having passenger.passenger_name like 'pallavi' and (passenger.bus_type = 'sleeper' or passenger.bus_type = 'sitting');

-- or

select passenger_name,passenger.bus_type,boarding_city,destination_city,passenger.distance,price.price
from passenger 
left join price on passenger.distance = price.distance and passenger.bus_type = price.bus_type
where passenger_name like 'pallavi' and (passenger.bus_type = 'sleeper' or passenger.bus_type = 'sitting');

-- g. List the distances from the "Passenger" table 
-- which are unique (non-repeated distances) in descending order.
select distinct(distance) from passenger order by distance desc;

-- h. Display the passenger name and percentage of distance traveled by that passenger 
-- from the total distance traveled by all passengers without using user variables 
select passenger_id as `ID`,passenger_name as `Name`,
(distance/(select sum(distance) from passenger))*100 
as `% of distance covered by them` 
from passenger 
order by ID asc;