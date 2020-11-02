/*Answer 1*/ 
USE om;

SELECT CONCAT(customer_last_name, ', ' ,  customer_first_name) as "Customer Name",
	CONCAT( 'Contact #: ' , SUBSTRING(customer_phone, 1, 3), '-', SUBSTRING(customer_phone, 4, 3), '-', SUBSTRING(customer_phone, 7, 4)) as "Customer Contact Number",
	CONCAT(customer_address, ', ' , customer_city, ', ' , customer_state, ', ' , customer_zip) as "Customer Address"
FROM customers
WHERE customer_last_name > "B" and customer_last_name < "F"
ORDER BY customer_last_name;


/*Answer 2*/ 
USE om;

SELECT order_id AS "Order ID", 
CONCAT(customer_first_name, ' ' , customer_last_name) AS "Customer Name",
order_date,
shipped_date
FROM orders
	JOIN customers
    USING(customer_id)
    WHERE (order_id >= 772 AND order_id <= 830) AND shipped_date IS NOT NULL
    UNION
SELECT order_id AS "Order ID", 
CONCAT(customer_first_name, ' ' , customer_last_name) AS "Customer Name",
order_date,
"Not Yet Shipped" AS shipped_date
FROM orders
	JOIN customers
    USING(customer_id)
    WHERE (order_id > 772 and order_id < 830) AND shipped_date IS NULL
    ORDER BY order_date, shipped_date;
	


/*Answer 3*/ 
USE ap;

SELECT vendor_name as "Vendor Name",
CONCAT(first_name, ' ', last_name) AS "Contact Full Name",
invoice_id AS "Invoice ID",
CONCAT(invoice_total - payment_total -credit_total) AS "Balance Due"
FROM invoices p

RIGHT JOIN vendors k
On p.vendor_id = k.vendor_id
INNER JOIN vendor_contacts l
on l.vendor_id = k.vendor_id
ORDER BY vendor_name,  invoice_total- payment_total ;

/*Answer 4*/ 
USE ap;

SELECT terms_description, vendor_state, vendor_name, vendor_id
FROM terms
	INNER JOIN vendors
on terms.terms_id = vendors.default_terms_id
WHERE vendor_state < 'Q' AND vendor_state > 'N'
ORDER BY terms_description;
    



