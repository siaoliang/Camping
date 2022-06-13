INSERT INTO orders
	(id, member_email, created_date, created_time,
		recipient_name,	recipient_email, recipient_phone, shipping_address,
        payment_type, payment_fee, 
        shipping_type, shipping_fee, status)
        VALUES(?,?,?,?,?,?,?,?,?,?,?,?,0);

INSERT INTO order_items
	(order_id, product_id, color_name, price, quantity)
    VALUES(?,?,?,?,?);