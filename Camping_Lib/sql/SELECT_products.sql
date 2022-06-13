SELECT id, name, unitPrice, stock, photoUrl, description, shelfDate, discount, sort, video, format, photoUrl2, photoUrl3, photoUrl4, photoUrl5 FROM products;

SELECT id, name, unitPrice, stock, photoUrl, description, shelfDate, discount, sort FROM products
	WHERE name LIKE '%椅子%';
    
SELECT id, name, unitPrice, stock, photoUrl, description, shelfDate, discount, sort FROM products
	WHERE sort = '帳篷';

SELECT id, name, unitPrice, stock, photoUrl, description, shelfDate, discount, sort FROM products
	WHERE unitPrice BETWEEN 1 AND 10000;
    
SELECT id, name, unitPrice, stock, photoUrl, description, shelfDate, discount, sort FROM products
	WHERE description LIKE '%休閒%';