create database ecommerce;
use ecommerce;

create table customer (
cus_id int primary key,
cus_name varchar(100),
city varchar(50),
email varchar(60),
phone varchar(20),
state varchar(20)
);

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




