DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10,2),
    Stock INT
);



DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    Customer_ID INT PRIMARY KEY,
    B_name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100)
);



DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
Order_ID INT PRIMARY KEY,
Customer_ID int REFERENCES Customer(Customer_ID),
Book_ID  int REFERENCES Books (Book_ID),
Order_Date DATE,
Quantity int,
Total_Amount NUMERIC(10,5)
);


SELECT * FROM Books;
SELECT * FROM customer;
SELECT * FROM orders;

 
  ----- BASIC-----


-- (1)Retrieve all books in the fiction genere
SELECT * FROM Books
WHERE genre = 'Fiction';

-- 2) Find books published after the year 1950
SELECT genre, published_year FROM Books 
WHERE published_year > 1950;

-- 3) List all customers from the Canada
SELECT * FROM customer
WHERE country = 'Canada';

-- 4) Show orders placed in November 2023
SELECT * FROM orders 
WHERE order_date BETWEEN  '2023-11-1' AND '2023-11-30';
 
-- 5) Retrieve the total stock of books available
SELECT sum(stock) AS total_s from books;

-- 6) Find the details of the most expensive book
SELECT * FROM books ORDER BY price DESC limit 1;
      
-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT c.b_name, o.Quantity FROM customer c inner join orders o
ON c.customer_id = o.customer_id  WHERE quantity > 8;

-- 8) Find the customer who spent the most on orders
SELECT c.b_name, o.total_amount FROM customer c inner join orders o
ON c.customer_id = o.customer_id order by total_amount DESC LIMIT 1;

-- 9) List all genres available in the Books table
SELECT DISTINCT genre FROM books;
 
-- 10) Find the book with the lowest stock
SELECT Title, genre, stock FROM books ORDER BY stock ASC limit 1;

-- 11) Calculate the total revenue generated from all orders
SELECT SUM(total_amount) AS total_amt FROM orders;

  
  -----ADVANCE-----

  
-- 1) Retrieve the total number of books sold for each genre
SELECT genre, SUM(stock) as total FROM books GROUP BY genre;

-- 2) Find the average price of books in the "Fantasy" genre
SELECT genre, AVG(price) AS avg_price from Books
WHERE genre = 'Fantasy' GROUP by genre;

-- 3) List customers who have placed at least 2 orders
SELECT c.b_name, COUNT(o.customer_id) AS total_orders
FROM customer c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.b_name
HAVING COUNT(o.customer_id) >= 2;

-- 4) Find the most frequently ordered book
SELECT b.book_id, COUNT(*) AS order_count
FROM books b
INNER JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.book_id, b.book_
ORDER BY order_count DESC
LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 
SELECT book_id, title, price, genre FROM Books 
WHERE genre = 'Fantasy' ORDER BY price DESC  Limit 3;

-- 6) Retrieve the total quantity of books sold by each author
SELECT B.author, SUM(o.quantity) AS total_q FROM Books B INNER JOIN orders o on B.book_id = o.book_id
GROUP BY B.author;

-- 7) List the cities where customers who spent over $30 are located
SELECT c.City, total_amount FROM customer c INNER JOIN orders o 
on c.customer_id = o.customer_id WHERE total_amount > 30;

-- 8) Find the customer who spent the most on orders
SELECT c.b_name, SUM(o.total_amount) AS total_spent
FROM customer c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.b_name
ORDER BY total_spent DESC
LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders
SELECT b.title,
b.stock - SUM(o.quantity) AS remaining_stock
FROM Books b	
INNER JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock;
     

