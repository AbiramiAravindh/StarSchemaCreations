create database ECommerceSales;
use ECommerceSales;

-- Dimensional : Customer
Create table Dim_customer(
Customer_key int primary key,
Customer_id varchar(50),
Customer_name varchar(100),
Gender varchar(10),
age_group varchar(20),
city varchar(50),
State varchar(50),
Customer_segment varchar(50));

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

-- dimensional : product
create table Dim_Product(
product_key int primary key,
product_id varchar(50),
product_name varchar(150),
brand varchar(100),
category varchar(100),
sub_category varchar(100),
unit varchar(20),
list_price decimal(10,2),
is_active boolean);

-- dimensional : Promotion
create table Dim_Promotion(
promotion_key int primary key,
promotion_id varchar(50),
promotion_name varchar(150),
promotion_type varchar(50),
discount_value decimal(10,2),
start_date datetime,
end_date datetime,
is_active boolean);

-- Fact : Fact Order Item
create table fact_order_item(
order_item_key bigint primary key,
customer_key int,
product_key int,
date_key int,
promotion_key int,
order_id bigint,
quantity int,
unit_price decimal(10,2),
discount_amount decimal(10,2),
tax_amount decimal(10,2),
shipping_amount decimal(10,2),
total_amount decimal(10,2),
foreign key (customer_key) references Dim_Customer(customer_key),
foreign key (product_key) references Dim_Product(product_key),
foreign key (date_key) references Dim_Date(date_key),
foreign key (promotion_key) references Dim_Promotion(promotion_key));


Select * from fact_order_item;
Select * from Dim_Promotion;
Select * from Dim_Product;
Select * from Dim_date;
Select * from Dim_customer;