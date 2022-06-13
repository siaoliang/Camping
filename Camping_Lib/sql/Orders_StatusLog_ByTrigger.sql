USE vgb;

/* 確實已存在orders table, 且其中有status欄位  */
DROP TABLE IF EXISTS `order_status_log`;
CREATE TABLE  `order_status_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `old_status` int unsigned NOT NULL,
  `new_status` int unsigned NOT NULL,
  `old_payment_note` varchar(100) DEFAULT NULL,
  `new_payment_note` varchar(100) DEFAULT NULL,
  `old_shipping_note` varchar(100) DEFAULT NULL,
  `new_shipping_note` varchar(100) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TRIGGER IF EXISTS log_orders_status;
delimiter //
CREATE TRIGGER log_orders_status AFTER UPDATE ON orders FOR EACH ROW
  BEGIN
    IF (old.status != new.status) THEN
            INSERT INTO order_status_log(order_id, old_status, new_status, 
            old_payment_note, new_payment_note, old_shipping_note, new_shipping_note) 
		VALUES (new.id, old.status, new.status, old.payment_note,new.payment_note,
			old.shipping_note, new.shipping_note);        
    END IF;    
  END;//
delimiter ;orders