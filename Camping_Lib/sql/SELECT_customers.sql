SELECT id, name, email, password, 
		birthday, gender, address, phone, subscribed, discount 
	FROM customers;

SELECT id, name, email, password, 
		birthday, gender, address, phone, subscribed, discount 
	FROM customers
    WHERE id='A123456789' AND password='asdf123456';