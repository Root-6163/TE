"
4 Design at least  SQL queries for suitable database application using SQL DML statements: all types of Join, Sub-Query .
Tables:- Salesman(Saleman_id,name,city,commission)
Customers(Customer_id,customer_name,city,grade,Saleman_id)
orders(ord_no, ord_date, purch_amt, Customer_id, Saleman_id)
1.Find the name and city of those customers and salesmen who lives in the same city.
2 .Find the names of all customers along with the salesmen who works for them.
3 .Display all those orders by the customers not located in the same cities where their salesmen live.
4.Display all the orders which values are greater than the average order value for 10th October 2012.
5.Find all orders attributed to salesmen in Paris.
"

--create Table 
-- Create Salesman table
CREATE TABLE Salesman (
    Salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5,2)
);

-- Create Customer table
CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    Salesman_id INT,
    FOREIGN KEY (Salesman_id) REFERENCES Salesman(Salesman_id)
);

-- Create Orders table
CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    ord_date DATE,
    purch_amt DECIMAL(10,2),
    Customer_id INT,
    Salesman_id INT,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Salesman_id) REFERENCES Salesman(Salesman_id)
);

-- Insert Data

-- Insert Salesmen
INSERT INTO Salesman VALUES
(5001, 'James', 'Paris', 0.15),
(5002, 'Nina', 'Rome', 0.12),
(5003, 'Alex', 'London', 0.13),
(5004, 'Sophia', 'Paris', 0.14),
(5005, 'Raj', 'Mumbai', 0.10);

-- Insert Customers
INSERT INTO Customer VALUES
(3001, 'Ramesh', 'Mumbai', 200, 5005),
(3002, 'John', 'London', 300, 5003),
(3003, 'Priya', 'Rome', 400, 5002),
(3004, 'Mira', 'Paris', 250, 5001),
(3005, 'Arun', 'Delhi', 150, 5005),
(3006, 'Sofia', 'Paris', 350, 5004);

-- Insert Orders
INSERT INTO Orders VALUES
(7001, '2012-10-10', 1500.00, 3001, 5005),
(7002, '2012-10-10', 1200.00, 3004, 5001),
(7003, '2012-10-10', 1800.00, 3006, 5004),
(7004, '2012-10-15', 3000.00, 3002, 5003),
(7005, '2012-11-01', 1000.00, 3005, 5005);

-- Find the name and city of those customer and salesmen who live in the same city
SELECT c.customer_name, c.city AS customer_city,
       s.name AS salesman_name, s.city AS salesman_city
FROM Customer c
JOIN Salesman s ON c.city = s.city;

-- Find the names of all customers along with the salesman who work for them 
SELECT c.customer_name, s.name AS salesman_name
FROM Customer c
JOIN Salesman s ON c.Salesman_id = s.Salesman_id;

-- DIsplay all the those orders by the customers not located in the same cities where their salesmen live

SELECT o.ord_no, o.ord_date, o.purch_amt, 
       c.customer_name, c.city AS customer_city,
       s.name AS salesman_name, s.city AS salesman_city
FROM Orders o
JOIN Customer c ON o.Customer_id = c.Customer_id
JOIN Salesman s ON o.Salesman_id = s.Salesman_id
WHERE c.city <> s.city;

"
MariaDB [root]> SELECT o.ord_no,o.ord_date,o.purch_amt,
    -> c.customer_name , c.city AS customer_city,
    -> s.name AS salesman_name ,s.city AS salesman_city
    -> from Orders o
    -> JOIN Customer c ON o.Customer_id = c.Customer_id
    -> JOIN Salesman s ON o.Salesman_id = s.Salesman_id
    -> ;
+--------+------------+-----------+---------------+---------------+---------------+---------------+
| ord_no | ord_date   | purch_amt | customer_name | customer_city | salesman_name | salesman_city |
+--------+------------+-----------+---------------+---------------+---------------+---------------+
|   7001 | 2012-10-10 |   1500.00 | Ramesh        | Mumbai        | Raj           | Mumbai        |
|   7002 | 2012-10-10 |   1200.00 | Mira          | Paris         | James         | Paris         |
|   7003 | 2012-10-10 |   1800.00 | Sofia         | Paris         | Sophia        | Paris         |
|   7004 | 2012-10-15 |   3000.00 | John          | London        | Alex          | London        |
|   7005 | 2012-11-01 |   1000.00 | Arun          | Delhi         | Raj           | Mumbai        |
+--------+------------+-----------+---------------+---------------+---------------+---------------+
5 rows in set (0.001 sec)

MariaDB [root]> SELECT o.ord_no,o.ord_date,o.purch_amt, c.customer_name , c.city AS customer_city, s.name AS salesman_name ,s.city AS salesman_city from Orders o JOIN Customer c ON o.Customer_id = c.Customer_id JOIN Salesman s ON
o.Salesman_id = s.Salesman_id WHERE c.city <> s.city;
+--------+------------+-----------+---------------+---------------+---------------+---------------+
| ord_no | ord_date   | purch_amt | customer_name | customer_city | salesman_name | salesman_city |
+--------+------------+-----------+---------------+---------------+---------------+---------------+
|   7005 | 2012-11-01 |   1000.00 | Arun          | Delhi         | Raj           | Mumbai        |
+--------+------------+-----------+---------------+---------------+---------------+---------------+
1 row in set (0.001 sec)

MariaDB [root
  "

-- Display all orders whose Values are greater than the average order value for 10th October 2012
SELECT o.ord_no, o.ord_date, o.purch_amt, 
       c.customer_name, c.city AS customer_city,
       s.name AS salesman_name, s.city AS salesman_city
FROM Orders o
JOIN Customer c ON o.Customer_id = c.Customer_id
JOIN Salesman s ON o.Salesman_id = s.Salesman_id
WHERE c.city <> s.city;
"
MariaDB [root]> Select * from Orders
    -> Where purch_amt > (Select AVG(purch_amt) From Orders Where ord_date='2012-10-10');
+--------+------------+-----------+-------------+-------------+
| ord_no | ord_date   | purch_amt | Customer_id | Salesman_id |
+--------+------------+-----------+-------------+-------------+
|   7003 | 2012-10-10 |   1800.00 |        3006 |        5004 |
|   7004 | 2012-10-15 |   3000.00 |        3002 |        5003 |
+--------+------------+-----------+-------------+-------------+
2 rows in set (0.001 sec)
"
--Find all orders attributed to salesman in Paris
SELECT o.ord_no, o.ord_date, o.purch_amt, s.name AS salesman_name
FROM Orders o
JOIN Salesman s ON o.Salesman_id = s.Salesman_id
WHERE s.city = 'Paris';

--Alternate
SELECT *
FROM Orders
WHERE Salesman_id IN (
    SELECT Salesman_id FROM Salesman WHERE city = 'Paris'
);



