use Bikestore;
--1. Write a query to display customer list by the first name in descending order. select * from SALES.customers order by first_name desc ; --2. Write a query to display the first name, last name, and city of the customers. It sorts the customer list by the city first and then by the first name. select first_name,last_name,city from SALES.customers order by city,first_name; --3. Write a query to returns the top three most expensive products. select top(3)* from production.products order by list_price DESC; -----4. Write a query to finds the products whose list price is greater than 300 and model year is 2018.
SELECT * FROM production.products WHERE list_price>300 AND model_year=2018

---5. Write a query to finds products whose list price is greater than 3,000 or model year is 2018. Any product that meets one of these conditions is included in the result set.
SELECT * FROM production.products WHERE list_price>300 OR model_year=2018

---6. Write a query to find the products whose list prices are between 1,899 and 1,999.99.
SELECT * FROM production.products WHERE list_price > 1899 AND list_price < 1999.99

---7.Write a query uses the IN operator to find products whose list price is 299.99 or 466.99 or 489.99.
SELECT * FROM production.products WHERE list_price IN(299.99,466.99,489.99)

---8. Write a query to the customers where the first character in the last name is the letter in the range A through C
SELECT * FROM sales.customers WHERE last_name LIKE ('A%') OR last_name LIKE ('B%')OR last_name LIKE'C%'

---9. Write a query using NOT LIKE operator to find customers where the first character in the first name is not the letter A
SELECT * FROM sales.customers WHERE last_name NOT LIKE ('A%')

---10. Write a query to return the number of customers by state and city group state and city.
SELECT CITY,state, COUNT(*) AS CUSTOMER_COUNT FROM sales.customers GROUP BY state,city

---11. Write a query to return the number of orders placed by the customer group by customer id and year.
SELECT customer_id,YEAR(order_date) AS ORDER_YEAR, COUNT(*) AS CUSTOMER_COUNT FROM sales.orders GROUP BY customer_id,YEAR(order_date)

---12. Write query to finds the maximum and minimum list group by category id.Then, it filters out the category which has the maximum list price greater than 4,000 or the minimum list price less than 500.
SELECT category_id,MAX(list_price) AS MAX_LIST_PRICE,MIN(list_price) AS MIN_LIST_PRICE FROM production.products GROUP BY category_id HAVING MAX(list_price)>4000 AND MIN(list_price)<500