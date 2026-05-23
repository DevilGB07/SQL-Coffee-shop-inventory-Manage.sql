USE Coffee_Shop_Sales;

 SHOW TABLES;

SELECT * FROM items;
SELECT * FROM login_logs;
SELECT * FROM orders;
SELECT * FROM organizations;
SELECT * FROM security_incidents;
SELECT * FROM shift;
SELECT * FROM staff;
SELECT * FROM systems;
SELECT * FROM users;

select sum(round(item_price,0))
from items;



  
# 1 Most Ordered Items
  
 SELECT 
    item_id,
    COUNT(*) AS total_orders
FROM orders
GROUP BY item_id
ORDER BY total_orders DESC;

# 2 Customer with Most Orders

SELECT 
    cust_name,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY cust_name
ORDER BY total_orders DESC;

# 3 Orders with Item Details

SELECT 
    orders.order_id,
    orders.cust_name,
    items.item_name,
    orders.quantity
FROM orders
JOIN items
ON orders.item_id = items.item_id;

# 4 Orders Type Analysis

SELECT 
    in_or_out,
    COUNT(*) AS total_orders
FROM orders
GROUP BY in_or_out;

# 5 Staff Salary Analysis

SELECT 
    position,
    AVG(sal_per_hour) AS avg_salary
FROM staff
GROUP BY position;
 
# 5  Daily Order Count
 
 SELECT 
    DATE(created_at) AS order_date,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE(created_at)
ORDER BY order_date;


# 7 Top Customers

SELECT 
    cust_name,
    SUM(quantity) AS total_items
FROM orders
GROUP BY cust_name
ORDER BY total_items DESC
LIMIT 5;

# 8 Ranking Customers using  Window Function

SELECT 
    cust_name,
    quantity,
    RANK() OVER(ORDER BY quantity DESC) AS ranking
FROM orders;

# make an sum of all order by ading whole no.
select sum(round(item_price,0))
from items;