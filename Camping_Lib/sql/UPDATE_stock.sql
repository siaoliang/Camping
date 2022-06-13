/*三個客戶同時下單
	買的剛好是同一個產品(id=1),(id=11, the_color_name='紫'), 
		(id=13, the_color_name='白', size_name='S'), (id=14, the_color_name='', size_name='L')*/    
SELECT * FROM vgb.product_real_time_stock
	WHERE id IN (1, 11,12, 13, 14); 
    
UPDATE products SET stock=stock-3 WHERE stock>=3 AND id = 1;
UPDATE products SET stock=stock-2 WHERE stock>=2 AND id = 1;
UPDATE products SET stock=stock-1 WHERE stock>=1 AND id = 1;

UPDATE product_colors SET stock=stock-3 WHERE stock>=3 AND product_id = 11 AND color_name='紫' ;
UPDATE product_colors SET stock=stock-2 WHERE stock>=2 AND product_id = 11 AND color_name='紫' ;
UPDATE product_colors SET stock=stock-1 WHERE stock>=1 AND product_id = 11 AND color_name='紫' ;

UPDATE product_color_sizes SET stock=stock-3 WHERE stock>=3 AND product_id = 13 AND color_name='白' AND size='L' ;
UPDATE product_color_sizes SET stock=stock-2 WHERE stock>=2 AND product_id = 13 AND color_name='白' AND size='L' ;
UPDATE product_color_sizes SET stock=stock-1 WHERE stock>=1 AND product_id = 13 AND color_name='白' AND size='L' ;

UPDATE product_color_sizes SET stock=stock-3 WHERE stock>=3 AND product_id = 14 AND color_name='' AND size='S' ;
UPDATE product_color_sizes SET stock=stock-2 WHERE stock>=2 AND product_id = 14 AND color_name='' AND size='S' ;
UPDATE product_color_sizes SET stock=stock-1 WHERE stock>=1 AND product_id = 14 AND color_name='' AND size='S' ;