##Dalton Stoner##

##QUESTION 1##

USE my_guitar_shop;
DROP TABLE order_items_copy, products_copy;
CREATE TABLE order_items_copy AS
	SELECT *
	FROM order_items;
	CREATE TABLE products_copy AS
	SELECT *
	FROM products;

##QUESTION 2##
USE my_guitar_shop;
INSERT INTO products_copy
	(product_id, category_id, product_code, product_name, description,
	list_price, discount_percent, date_added)
VALUES
	( DEFAULT, '4', 'P45B', 'Yamaha P45B', 'The p45 is an 88 note weighted
    keyboard digital piano', '519.99' , '10.00' , '2019-06-26');

##QUESTION 3##
USE my_guitar_shop;
INSERT INTO order_items_copy
	(item_id, order_id, product_id, item_price, discount_amount, 
    quantity)
VALUES
	( DEFAULT, '9', product_id , '519.99' , '467.99' , '2');
    
    
##QUESTION 4##
USE my_guitar_shop;
SET SQL_SAFE_UPDATES=0;
UPDATE products_copy
	SET list_price = '598.00',
    discount_percent = '15'
    WHERE category_id = '4' ;
    
##QUESTION 5##
USE my_guitar_shop;
UPDATE order_items_copy
	SET item_price = '349.50'
    WHERE product_id = 5;
    
##QUESTION 6##
DELETE FROM order_items_copy
WHERE product_id = 11;
DELETE FROM products_copy
WHERE product_code = 'P45B';




    




