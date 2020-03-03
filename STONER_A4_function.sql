###QUESTION 3###
/* Calculate the room price using the room type, check-in date, and check-out date:
	- Determine the base price using the room type.
	- If the length of stay is greater than 10 days, apply a 15% discount to the base price.
    - If the length of stay is greater than 5 days, apply a 10% discount to the base price.
	- Return a value that represents the price for the full reservation: multiply the (possibly discounted) base price by the length of stay.
*/

USE ForestGlenInn;
DROP FUNCTION IF EXISTS CalcRoomPrice;

DELIMITER //

CREATE FUNCTION CalcRoomPrice(
		/* three input parameters for room type_code, check-in date, and check-out date */
		room_type_code_param VARCHAR(10),
		checkin_date_param DATE,
		checkout_date_param DATE
	)
RETURNS DECIMAL(6,2)

BEGIN
	DECLARE base_price_var DECIMAL(6,2);
	DECLARE price_var INT;
  
	SET price_var = 0;
    
	/* create a variable that contains the calculated value of the length_of_stay */
   length_of_stay = DATEDIFF(check_out_date, check_in_date)
  
	/* query the database to get the base price of the room type */
    /* HINT: write a SELECT statement which queries the room_type table using the room type parameter. 
		Use the INTO keyword to store the price into the local variable base_price_var declared above */
	SELECT room_type_code
    FROM room_types
    INTO base_price_var
  
	/* Calculate the full price of the person's reservation using the base price and the calculated length of stay */
    /* HINT: first SET the price_var to base price, then use an IF statement to conditionally apply the discount. Then multiply by the length of stay.*/
	SET price_var to base_price
    IF(length_of_stay > 10 ,  base_price *.85)
    IF (length_of_stay > 5, base_price * .9)
    total = base_price * length_of_stay
	/* Don't forget to return the value! */
    SELECT total
    
END; 

DELIMITER ;
