/*CROSS JOIN*/
SELECT id, name, unitPrice, products.stock, products.photoUrl, description, shelfDate, discount, sort,
	product_id, color_name, product_colors.stock, product_colors.photoUrl
    FROM products JOIN product_colors
    WHERE id = 8;

/*INNER JOIN*/
SELECT id, name, unitPrice, products.stock, products.photoUrl, description, shelfDate, discount, sort,
	product_id, color_name, product_colors.stock, product_colors.photoUrl
    FROM products JOIN product_colors ON id=product_id
    WHERE id = 8;

/*LEFT OUTER JOIN [檢視產品明細]*/
SELECT id, name, unitPrice, products.stock, products.photoUrl, description, shelfDate, discount, sort,
	product_id, color_name,
    products.stock, product_colors.stock AS color_stock,
    products.photoUrl, product_colors.photoUrl AS color_photo 
    FROM products LEFT JOIN product_colors ON id=product_id
    WHERE id = 6;

/*RIGHT OUTER JOIN*/
SELECT id, name, unitPrice, products.stock, products.photoUrl, description, shelfDate, discount, sort,
	product_id, color_name, product_colors.stock, product_colors.photoUrl
    FROM products RIGHT JOIN product_colors ON id=product_id
    WHERE id = 6;

/*FULL OUTER JOIN (MySQL不支援full outer join)*/
/*
SELECT id, name, unitPrice, products.stock, products.photoUrl, description, shelfDate, discount, sort,
	product_id, color_name, product_colors.stock, product_colors.photoUrl
    FROM products FULL JOIN product_colors ON id=product_id
    WHERE id = 6;