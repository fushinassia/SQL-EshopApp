CREATE DATABASE eshop_app;
USE eshop_app;


CREATE TABLE eshop (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    product_name VARCHAR(100),
    product_category ENUM('Computers', 'Mobile', 'Accessories', 'Screens'),
    product_price INT,
    product_amount INT
);


INSERT INTO eshop (customer_name, customer_email, product_name, product_category, product_price, product_amount) VALUES
('Νίκος Παππάς', 'nikos@mail.gr', 'Laptop', 'Computers', 850, 1),
('Μαρία Ιωάννου', 'maria@mail.gr', 'Mouse', 'Accessories', 25, 2),
('Νίκος Παππάς', 'nikos@mail.gr', 'Keyboard', 'Accessories', 45, 1),
('Γιώργος Νικολάου', 'george@mail.gr', 'Laptop', 'Computers', 850, 2),
('Μαρία Ιωάννου', 'maria@mail.gr', 'Monitor', 'Screens', 200, 1),
('Νίκος Παππάς', 'nikos@mail.gr', 'Mouse', 'Accessories', 25, 3),
('Γιώργος Νικολάου', 'george@mail.gr', 'Keyboard', 'Accessories', 45, 2),
('Ελένη Δημητρίου', 'eleni@mail.gr', 'Smartphone', 'Mobile', 500, 2),
('Ελένη Δημητρίου', 'eleni@mail.gr', 'Mouse', 'Accessories', 25, 1);

SELECT * FROM eshop;


CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_category ENUM('Computers', 'Mobile', 'Accessories', 'Screens'),
    product_price INT
);

INSERT INTO products (product_name, product_category, product_price) VALUES
('Mouse', 'Accessories', 25),
('Monitor', 'Screens', 200),
('Smartphone', 'Mobile', 500),
('Keyboard', 'Accessories', 45),
('Laptop', 'Computers', 850);

SELECT * FROM products;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100) UNIQUE
);
INSERT INTO customers (customer_name, customer_email) VALUES
('Νίκος Παππάς', 'nikos@mail.gr'),
('Μαρία Ιωάννου', 'maria@mail.gr'),
('Γιώργος Νικολάου', 'george@mail.gr'),
('Ελένη Δημητρίου', 'eleni@mail.gr');

SELECT * FROM customers;

CREATE TABLE orders ( 
	order_id INT PRIMARY KEY AUTO_INCREMENT, 
	product_id INT, 
	customer_id INT,
	product_amount INT, 
	checkout_price INT, 
	FOREIGN KEY (product_id) REFERENCES products(product_id), 
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id) );

INSERT INTO orders (product_id, customer_id, product_amount, checkout_price) 
VALUES 
(5, 1, 1, 850), 
(1, 2, 2, 50), 
(4, 1, 1, 45), 
(5, 3, 2, 1700),
(2, 2, 1, 200), 
(1, 1, 3, 75), 
(4, 3, 2, 90), 
(3, 4, 2, 1000), 
(1, 4, 1, 25);
       
SELECT * FROM orders;

SELECT o.order_id, c.customer_name, p.product_name, o.product_amount, o.checkout_price 
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id 
JOIN products p ON o.product_id = p.product_id;
