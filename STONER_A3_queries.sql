####QUESTION 1####
USE my_guitar_shop;

SELECT product_name,
COUNT(*) AS num_orders,
quantity AS num_products,
CONCAT('$' , FORMAT(AVG(discount_amount), 2 )) AS avg_discount

FROM products p 
JOIN order_items o 
ON p.product_id = o.item_id
GROUP BY product_name, quantity
ORDER BY product_name, num_orders, num_products;




###QUESTION 2###
USE my_guitar_shop;

SELECT CONCAT('$' , list_price) AS 'Product List Price',
product_name AS 'Product',
description AS 'Description'
FROM products
WHERE list_price <= (SELECT AVG(list_price)
FROM products
WHERE category_id = '1')
ORDER BY list_price, product_name;

###QUESTION 3###
USE my_guitar_shop;

SELECT CONCAT(last_name, ', ', first_name) AS 'Customer Name',
COUNT(DISTINCT ship_date) AS num_orders,
COUNT(customer_id) AS num_items,
CONCAT('$' , FORMAT(SUM(quantity *(item_price - discount_amount)), 2 ))AS order_total
FROM order_items i
JOIN orders o
USING (order_id)
JOIN customers c
USING (customer_id)
WHERE ship_date IS NOT NULL
GROUP BY o.customer_id
ORDER BY num_orders DESC, num_items DESC, order_total DESC;




