create database MovieTickets;
use MovieTickets;

-- dimensional : Customer
create table Dim_Customer(
customer_key int primary key,
customer_id varchar(50),
customer_name varchar(100),
gender varchar(10),
age_group varchar(20),
city varchar(50),
state varchar(50),
membership_type varchar(50), -- Regular/premium/vip
registration_date date);

-- dimensional : Movie
create table Dim_Movie(
movie_key int primary key,
movie_id varchar(50),
movie_name varchar(100),
genre varchar(50), -- Action, Drama, Comedy
language varchar(50), 
certification varchar(10), -- U, U/A, A
duration_minutes int,
release_date date,
director varchar(50));

-- dimensional : Cinema
create table Dim_Cinema(
cinema_key int primary key,
cinema_id varchar(50),
cinema_name varchar(50),
city varchar(50),
state varchar(20),
theatre_type varchar(20), -- Multiplex/Single Screen
seating_capacity int);

-- dimensional : Date
create table Dim_date(
date_key int primary key,
full_date date,
day_of_week varchar(10),
day tinyint,
week_of_year tinyint,
month tinyint,
quarter tinyint,
year smallint,
is_weekend boolean,
is_holiday boolean);

-- Dimensional : Payment
create table Dim_Payment(
payment_key int primary key,
payment_id varchar(50),
payment_method varchar(20), -- UPI/Card/Net Banking/Cash
payment_gateway varchar(50), -- Razorpay/Paytm
payment_status varchar(50), -- Success/Failed/Refunded
payment_date date);

-- fact : movie Ticket
create table Fact_Movie_Ticket(
ticket_id int primary key,
movie_key int, 
customer_key int,
cinema_key int,
date_key int,
payment_key int,
booking_id varchar(20),
ticket_quantity INT,  -- no of tickets
ticket_price DECIMAL,
discount_amount DECIMAL,
tax_amount DECIMAL,
total_amount DECIMAL,
refund_amount DECIMAL,
foreign key (movie_key) references Dim_Movie(movie_key),
foreign key (customer_key) references Dim_Customer(customer_key),
foreign key (cinema_key) references Dim_Cinema(cinema_key),
foreign key (date_key) references Dim_Date(date_key),
foreign key (payment_key) references Dim_Payment(payment_key));


