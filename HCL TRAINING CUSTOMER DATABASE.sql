create database ecommerce;
use ecommerce;

create table customer (
customer_id int primary key,
customer_name varchar(100),
city varchar(50),
email varchar(60),
phone varchar(20),
state varchar(20)
);
alter table customer rename column cus_id to customer_id;
alter table customer rename column cus_name to customer_name;

insert into customer(cus_id, cus_name, city, email, phone, state) values
(01,'Ronaldo','New delhi','ronaldocr7@gmail.com','7777777777','Delhi'),
(02,'Messi','Chennai','lmessi10@gmail.com','7676767676','Tamil nadu'),
(03,'Mbappe','Jaipur','mbappe07@gmail.com','7094940855','Rajasthan'),
(04,'Neyamr','Lucknow','neymarjr10@gmail.com','9023678891','Uttar Pradesh'),
(05,'Valverde','Amritsar','valverde01@gmail.com','7923456781','Punjab'),
(06,'Bellingam','Bangalore','bellingam05@gmail.com','7223657781','Karnataka'),
(07,'Vini jr','Hyderabad','vinijr90@gmail.com','7392042133','Telangana'),
(08,'Saka','Kochi','saka06@gmail.com','7423456799','Kerala'),
(09,'Wirtz','Mumbai','wirtz88@gmail.com','8823991012','Maharashtra'),
(10,'cubarsi','Panaji','cubarasi11@gmail.com','7923696722','Goa'),
(11,'Yamal','Pudukkottai','Yamal66@gmail.com','9821003344','Tamil nadu'),
(12,'Kane','Trichy','kane99@gmail.com','6388449022','Tamil nadu'),
(13,'Chettri','Hubli','chettri11@gmail.com','7788445566','Karnataka'),
(14,'Camavinga','Kolkata','cavinga20@gmail.com','6280993577','West Bengal'),
(15,'Salah','Bhubaneswar','salah11@gmail.com','8822997766','Odisha');

select * from customer;

select * from customer where state = 'Kerala';

select * from customer where state = 'Karnataka' and city = 'Chennai';

select * from customer where cus_name = 'Ronaldo' or city = 'Chennai';

select cus_name from customer where city = 'Mumbai';

select cus_name, city from customer where city in ('Jaipur','Lucknow');

select database();

select * from customer where cus_id between 1 and 5;

select * from customer where cus_name like 'm%';

select count(*) as total_customer from customer;

select  distinct cus_name, city from customer;

create table product (
product_id int primary key,
product_name varchar(100),
category varchar(50),
price decimal,
stock varchar(20) );

alter table product modify column  price decimal(10,2);

insert into product values 
(01,'Wireless mouse','Electronics','1499.00','120'),
(02,'Mechanical Keyboard','Electronics','4999.00','45'),
(03,'Running shoes','Sports','3499.50','12'),
(04,'Ceramic coffee Mug','Home & Kitchen','399.00','200'),
(05,'Stainless steel water bottle','Sports','799.25','0'),
(06,'Bluetooth speaker','Electronics','2499.00','85'),
(07,'Cotton T-SHIRT','Clothing','699.75','300'),
(08,'Desk LED lamp','Home & kitchen','1299.00','5'),
(09,'Noise cancelling airpods','Electronics','9999.0','30'),
(10,'Leather wallet','Accessories','1850.50','65'),
(11,'Yoga mat','Sports','1150.0','40'),
(12,'Study table','Furniture','1560.4','25'),
(13,'Smart fitness band','Electronics','3299.00','110'),
(14,'Backpack','Accessories','2499.00','0'),
(15,'Denim jacket','clothing','4499.00','25');

select * from product;

select * from product where price > 1000.0 and price < 2000.0;

select * from product where category = 'Electronics';

select * from product where product_id between 04 and 08;

select * from product where price between 1000.0 and 3000.0;

select * from product where category in ('Electronics','Clothing');

select * from product where category like '%electronics';

select * from product where category like '%clothing';

select * from product order by price asc;

select * from product order by price desc;

select product_name,price  from product order by price desc limit 3;

select sum(price) as total_sum from product;

select product_name,price from product where price = (select max(price) from product);

select avg(price) as avg_price from product;

select product_name,price from product  order by price desc limit 5;

select product_name,price from product where price = (select min(price) from product);

create table orders (
order_id int primary key,
customer_id int,
order_date date,
order_status varchar(30),
foreign key (customer_id) references customer (cus_id) 
);

select * from orders;

insert into orders values
(1101,01,'2026-09-01','processing'),
(1102,02,'2026-09-02','processing'),
(1103,03,'2026-09-11','Shipped'),
(1104,04,'2026-09-25','Delivered'),
(1105,05,'2026-09-20','Delivered'),
(1106,06,'2026-09-15','Shipped'),
(1107,07,'2026-09-12','processing'),
(1108,08,'2026-09-22','Shipped'),
(1109,09,'2026-09-05','Delivered'),
(1110,10,'2026-09-08','processing');

select * from orders where order_status = 'shipped';

select * from customer c join orders o on c.customer_id = o.customer_id 
join orderitem oi on oi.order_id = oi.order_id
join product p on oi.order_id = p.product_id;

select
c.customer_id,
c.customer_name,
c.city,
c.email,
c.phone,
c.state,
p.product_id,
p.product_name,
p.price,
o.order_id,
o.order_date,
o.order_status
from customer c join orders o on c.customer_id = o.customer_id 
join orderitem oi on oi.order_id = oi.order_id 
join product p on oi.product_id = p.product_id;

select distinct
c.customer_id,
c.customer_name
from customer c join orders o on c.customer_id = o.customer_id 
join orderitem oi on oi.order_id = oi.order_id 
join product p on oi.product_id = p.product_id;



create table orderitem(
order_item_id int primary key,
order_id int,
product_id int,
quantity int,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references product (product_id) );

insert into orderitem values 
(1,1101,1,3),
(2,1102,2,6),
(3,1103,3,2),
(4,1104,4,7),
(5,1105,5,8);
 
 select * from orderitem;

create table payment (
payment_id int primary key,
order_id int,
payment_method varchar(100),
payment_amount decimal(10,2),
payment_status varchar(200),
foreign key (order_id) references orders(order_id) );

insert into payment values
(221,1101,'credit card',2000,'success'),
(222,1102,'debit card',9000,'Failure'),
(223,1103,'upi',4000,'refund'),
(224,1104,'credit card',1500,'Failure'),
(225,1105,'cash on delivery',2500,'success');

select * from payment;

 #ROUGHWORK
 #order details with price
select 
o.order_id,
o.order_date,
o.order_status,
p.product_id,
p.product_name,
oi.quantity,
p.price from orders o join orderitem oi on o.order_id = oi.order_id join product p on oi.product_id = p.product_id;

#calculate item value
select
o.order_id,
p.product_name,
oi.quantity,
p.price,
oi.quantity * p.price as item_value
from orders o join orderitem oi on o.order_id = oi.order_id join product p on oi.product_id = p.product_id;

#calculate order value
select
o.order_id,
sum(oi.quantity * p.price) as order_value
from orders o join orderitem oi on o.order_id = oi.order_id join product p on oi.product_id = p.product_id
group by order_id;

#total product revenue
select
sum(oi.quantity * p.price) as total_revenue
from orderitem oi join product p on oi.product_id = p.product_id;

#revenue by product
select
p.product_id,
p.product_name,
sum(oi.quantity * p.price) as revenue
from orderitem oi join product p on oi.product_id = p.product_id
group by p.product_id, p.product_name;

#quantity sold  by product
select
p.product_id,
p.product_name,
sum(oi.quantity ) as quantity_sold
from orderitem oi join product p on oi.product_id = p.product_id
group by p.product_id, p.product_name;

#top selling product
select
p.product_id,
p.product_name,
sum(oi.quantity ) as quantity_sold
from orderitem oi join product p on oi.product_id = p.product_id
group by p.product_id, p.product_name;
order by quantity_sold desc
limit 1;

#customer purchase details
select
c.customer_id,
c.customer_name,
o.order_id,
o.order_date,
p.product_name,
oi.quantity,
p.price,
oi.quantity * p.price as item_value
from customer c join orders o on c.customer_id = o.customer_id 
join orderitem oi on oi.order_id = oi.order_id 
join product p on oi.product_id = p.product_id;

# customer who never ordered
select 
c.customer_id,
c.customer_name,
c.city
from customer c left join orders o on c.customer_id = o.customer_id
where o.order_id is null;

#BUSINESS REPORTS

#TOTAL PRODUCTS
select count(*) as total_product from product;

#total orders
select count(*) as total_orders from orders;

#total delivered order
select count(*) as total_delivered_order
from orders where order_status = 'delivered';

#total cancelled order
select  count(*) as total_cancelled_order
from orders where order_status = 'cancelled';

#total revenue by city
SELECT
    c.city,
    SUM(oi.quantity * p.price) AS total_revenue
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN orderitem oi
    ON o.order_id = oi.order_id
JOIN product p
    ON oi.product_id = p.product_id
GROUP BY c.city;

#top 5 products
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM product p
JOIN orderitem oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY quantity_sold DESC
LIMIT 5;

#Complete order report
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    c.customer_id,
    c.customer_name,
    c.city,
    p.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    p.price,
    oi.quantity * p.price AS item_value
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN orderitem oi
    ON o.order_id = oi.order_id
JOIN product p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;










