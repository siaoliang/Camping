SELECT id, member_email, created_date, created_time, payment_type, payment_fee, shipping_type, shipping_fee, status 
	FROM orders WHERE member_email='ellis04@PChome.com.tw';
    
SELECT id, member_email, created_date, created_time, payment_type, payment_fee, shipping_type, shipping_fee, status,
	product_id, color_name, price, quantity
	FROM orders
    WHERE member_email='ellis04@PChome.com.tw';

/*歷史訂單用*/    
SELECT id, member_email, created_date, created_time, payment_type, payment_fee, shipping_type, shipping_fee, status,
	SUM(price * quantity) as total_amount
	FROM orders LEFT JOIN order_items ON id=order_id
    WHERE member_email='ellis04@PChome.com.tw'
    GROUP BY orders.id;