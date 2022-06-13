SELECT orders.id, member_email, created_date, created_time,
    order_id, order_items.product_id, products.name as product_name,products.photoUrl, 
    order_items.color_name, product_colors.color_name as p_color_name, 
    product_colors.photoUrl as color_photo,
    price, quantity, 
	recipient_name, recipient_email, recipient_phone, shipping_address, 
    payment_type, payment_fee, payment_note, 
    shipping_type, shipping_fee, shipping_note, status
    FROM orders JOIN order_items ON orders.id=order_items.order_id
			JOIN products ON order_items.product_id = products.id
            LEFT JOIN product_colors ON order_items.product_id = product_colors.product_id
				AND order_items.color_name = product_colors.color_name
    WHERE member_email='ellis04@PChome.com.tw' AND orders.id = '3';