DROP DATABASE IF EXISTS coffee_shop_db;
CREATE DATABASE coffee_shop_db;
USE coffee_shop_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(8,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    payment_method VARCHAR(30),
    store_location VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Aarav','Surat','2025-01-10'),
(2,'Ishita','Ahmedabad','2025-02-15'),
(3,'Rohan','Mumbai','2025-01-20'),
(4,'Neha','Pune','2025-03-02'),
(5,'Kabir','Surat','2025-01-25'),
(6,'Anaya','Delhi','2025-02-18'),
(7,'Vihaan','Surat','2025-02-11'),
(8,'Meera','Mumbai','2025-01-05'),
(9,'Arjun','Pune','2025-02-10'),
(10,'Diya','Ahmedabad','2025-03-05'),
(11,'Reyansh','Delhi','2025-01-18'),
(12,'Saanvi','Surat','2025-03-10'),
(13,'Aditya','Mumbai','2025-03-14'),
(14,'Kavya','Pune','2025-01-08'),
(15,'Yash','Ahmedabad','2025-02-25');

INSERT INTO products VALUES
(101,'Latte','Coffee',180),
(102,'Cappuccino','Coffee',170),
(103,'Espresso','Coffee',150),
(104,'Cold Coffee','Coffee',210),
(105,'Mocha','Coffee',220),
(106,'Brownie','Dessert',120),
(107,'Croissant','Bakery',140),
(108,'Cheesecake','Dessert',250),
(109,'Sandwich','Food',200),
(110,'Muffin','Bakery',130);

-- Orders batch 1 (1-10)
INSERT INTO orders VALUES
(1,1,101,'2025-04-01',2,'UPI','Surat'),
(2,2,103,'2025-04-01',1,'Card','Ahmedabad'),
(3,3,104,'2025-04-02',2,'Cash','Mumbai'),
(4,4,108,'2025-04-02',1,'UPI','Pune'),
(5,5,105,'2025-04-03',3,'Card','Surat'),
(6,6,109,'2025-04-03',2,'UPI','Delhi'),
(7,7,101,'2025-04-04',1,'Cash','Surat'),
(8,8,102,'2025-04-04',2,'UPI','Mumbai'),
(9,9,106,'2025-04-05',4,'Card','Pune'),
(10,10,104,'2025-04-05',1,'UPI','Ahmedabad');

-- Orders batch 2 (11-20)
INSERT INTO orders VALUES
(11,11,103,'2025-04-06',2,'Cash','Delhi'),
(12,12,108,'2025-04-06',1,'Card','Surat'),
(13,13,110,'2025-04-07',3,'UPI','Mumbai'),
(14,14,109,'2025-04-07',1,'Cash','Pune'),
(15,15,101,'2025-04-08',2,'Card','Ahmedabad'),
(16,1,102,'2025-04-08',1,'UPI','Surat'),
(17,2,106,'2025-04-09',2,'Cash','Ahmedabad'),
(18,3,109,'2025-04-09',1,'Card','Mumbai'),
(19,4,101,'2025-04-10',3,'UPI','Pune'),
(20,5,108,'2025-04-10',1,'Cash','Surat');

-- Orders batch 3 (21-30)
INSERT INTO orders VALUES
(21,6,103,'2025-04-11',2,'UPI','Delhi'),
(22,7,104,'2025-04-11',1,'Card','Surat'),
(23,8,105,'2025-04-12',2,'Cash','Mumbai'),
(24,9,110,'2025-04-12',1,'UPI','Pune'),
(25,10,107,'2025-04-13',4,'Card','Ahmedabad'),
(26,11,108,'2025-04-13',1,'UPI','Delhi'),
(27,12,102,'2025-04-14',2,'Cash','Surat'),
(28,13,106,'2025-04-14',3,'Card','Mumbai'),
(29,14,104,'2025-04-15',2,'UPI','Pune'),
(30,15,109,'2025-04-15',1,'Cash','Ahmedabad');

-- Orders batch 4 (31-45)
INSERT INTO orders VALUES
(31,1,105,'2025-04-16',1,'Card','Surat'),
(32,2,107,'2025-04-16',2,'UPI','Ahmedabad'),
(33,3,110,'2025-04-17',1,'Cash','Mumbai'),
(34,4,103,'2025-04-17',3,'Card','Pune'),
(35,5,108,'2025-04-18',2,'UPI','Surat'),
(36,6,101,'2025-04-18',1,'Cash','Delhi'),
(37,7,106,'2025-04-19',2,'Card','Surat'),
(38,8,109,'2025-04-19',3,'UPI','Mumbai'),
(39,9,102,'2025-04-20',1,'Cash','Pune'),
(40,10,108,'2025-04-20',1,'Card','Ahmedabad'),
(41,11,104,'2025-04-21',2,'UPI','Delhi'),
(42,12,101,'2025-04-21',3,'Cash','Surat'),
(43,13,102,'2025-04-22',1,'Card','Mumbai'),
(44,14,105,'2025-04-22',2,'UPI','Pune'),
(45,15,110,'2025-04-23',1,'Cash','Ahmedabad');

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;