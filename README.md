# Online Book Store SQL Project

This is my SQL project on Online Book Store. I made this project using PostgreSQL.

I have created 3 tables for this project:
- Books Table -> Book_ID, Title, Author, Genre, Published_Year, Price, Stock
- Customer Table -> Customer_ID, B_name, Email, Phone, City, Country  
- Orders Table -> Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount

What I did in this project:

Basic Queries:
- Find fiction books, books published after 1950
- Find customers from Canada
- Orders in Nov 2023
- Total stock, most expensive book, lowest stock
- Total revenue

Intermediate Queries:
- Total books sold per genre using Group By
- Average price of Fantasy books
- Customers who placed more than 2 orders
- Most frequently ordered book
- Top 3 expensive Fantasy books
- Total quantity sold by each author

Tools Used: PostgreSQL, pgAdmin 4

I learned Joins, Group By, Having Clause and Aggregate functions from this project.

How to run: Just create database and run sql-project-1.sql file.

Thank you
