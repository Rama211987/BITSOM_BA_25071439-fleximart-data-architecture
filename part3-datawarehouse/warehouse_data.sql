-- warehouse_data.sql 
-- Load order: dim_date → dim_product → dim_customer → fact_sales
USE fleximart_dw;

-- =========================
-- dim_date (30 dates: Jan–Feb 2024, all used by facts)
-- =========================
INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,FALSE),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,FALSE),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,FALSE),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,FALSE),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,FALSE),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,TRUE),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,TRUE),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,FALSE),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,FALSE),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,FALSE),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,FALSE),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,FALSE),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,TRUE),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,TRUE),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,FALSE),
(20240116,'2024-01-16','Tuesday',16,1,'January','Q1',2024,FALSE),
(20240117,'2024-01-17','Wednesday',17,1,'January','Q1',2024,FALSE),
(20240118,'2024-01-18','Thursday',18,1,'January','Q1',2024,FALSE),
(20240119,'2024-01-19','Friday',19,1,'January','Q1',2024,FALSE),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,TRUE),
(20240121,'2024-01-21','Sunday',21,1,'January','Q1',2024,TRUE),
(20240122,'2024-01-22','Monday',22,1,'January','Q1',2024,FALSE),
(20240123,'2024-01-23','Tuesday',23,1,'January','Q1',2024,FALSE),
(20240124,'2024-01-24','Wednesday',24,1,'January','Q1',2024,FALSE),
(20240125,'2024-01-25','Thursday',25,1,'January','Q1',2024,FALSE),
(20240126,'2024-01-26','Friday',26,1,'January','Q1',2024,FALSE),
(20240127,'2024-01-27','Saturday',27,1,'January','Q1',2024,TRUE),
(20240128,'2024-01-28','Sunday',28,1,'January','Q1',2024,TRUE),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,TRUE),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,TRUE);

-- =========================
-- dim_product (15 products, AUTO_INCREMENT keys 1–15)
-- =========================
INSERT INTO dim_product (product_id,product_name,category,subcategory,unit_price) VALUES
('P01','Notebook','Stationery','Paper',100),
('P02','Pen','Stationery','Writing',150),
('P03','Backpack','Stationery','Bags',1200),
('P04','Calculator','Stationery','Electronics',900),
('P05','Office Chair','Furniture','Seating',7500),
('P06','Office Desk','Furniture','Tables',15000),
('P07','Bookshelf','Furniture','Storage',9000),
('P08','Sofa','Furniture','Seating',35000),
('P09','Laptop','Electronics','Computers',50000),
('P10','Smartphone','Electronics','Mobiles',30000),
('P11','Tablet','Electronics','Mobiles',25000),
('P12','Headphones','Electronics','Accessories',2500),
('P13','Smart Watch','Electronics','Wearables',12000),
('P14','Television','Electronics','Home',80000),
('P15','Refrigerator','Electronics','Home',100000);

-- =========================
-- dim_customer (12 customers, AUTO_INCREMENT keys 1–12)
-- =========================
INSERT INTO dim_customer (customer_id,customer_name,city,state,customer_segment) VALUES
('C01','Amit Shah','Mumbai','Maharashtra','Retail'),
('C02','Neha Verma','Mumbai','Maharashtra','Corporate'),
('C03','Ravi Kumar','Bengaluru','Karnataka','Retail'),
('C04','Sneha Rao','Bengaluru','Karnataka','Retail'),
('C05','Arjun Mehta','Delhi','Delhi','Corporate'),
('C06','Pooja Singh','Delhi','Delhi','Retail'),
('C07','Kiran Patel','Ahmedabad','Gujarat','Retail'),
('C08','Mehul Jain','Ahmedabad','Gujarat','Corporate'),
('C09','Anita Das','Mumbai','Maharashtra','Retail'),
('C10','Rahul Nair','Bengaluru','Karnataka','Corporate'),
('C11','Vikram Joshi','Delhi','Delhi','Retail'),
('C12','Priya Malhotra','Ahmedabad','Gujarat','Retail');

-- =========================
-- fact_sales (40 transactions, ONLY valid keys)
-- =========================
INSERT INTO fact_sales (date_key,product_key,customer_key,quantity_sold,unit_price,discount_amount,total_amount) VALUES
(20240106,9,1,2,50000,0,100000),
(20240107,10,2,1,30000,1000,29000),
(20240113,14,5,1,80000,5000,75000),
(20240114,15,6,1,100000,10000,90000),
(20240120,8,3,1,35000,2000,33000),
(20240121,9,4,1,50000,0,50000),
(20240127,10,7,2,30000,2000,58000),
(20240203,11,8,1,25000,0,25000),
(20240204,12,9,3,2500,0,7500),
(20240105,1,10,10,100,0,1000),
(20240108,2,11,8,150,0,1200),
(20240109,3,12,2,1200,0,2400),
(20240110,4,1,1,900,0,900),
(20240111,5,2,1,7500,500,7000),
(20240112,6,3,1,15000,1000,14000),
(20240115,7,4,1,9000,0,9000),
(20240116,8,5,1,35000,3000,32000),
(20240117,9,6,1,50000,0,50000),
(20240118,10,7,1,30000,0,30000),
(20240119,11,8,1,25000,1000,24000),
(20240122,12,9,2,2500,0,5000),
(20240123,13,10,1,12000,0,12000),
(20240124,14,11,1,80000,5000,75000),
(20240125,15,12,1,100000,10000,90000),
(20240126,5,1,2,7500,0,15000),
(20240106,6,2,1,15000,0,15000),
(20240107,7,3,1,9000,0,9000),
(20240113,8,4,1,35000,2000,33000),
(20240114,9,5,1,50000,0,50000),
(20240120,10,6,1,30000,0,30000),
(20240121,11,7,2,25000,2000,48000),
(20240127,12,8,4,2500,0,10000),
(20240106,13,9,1,12000,0,12000),
(20240107,14,10,1,80000,4000,76000),
(20240113,15,11,1,100000,8000,92000),
(20240114,9,12,1,50000,0,50000),
(20240120,10,1,1,30000,0,30000),
(20240121,11,2,1,25000,0,25000);
