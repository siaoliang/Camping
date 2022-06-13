SELECT * FROM camping.products;

INSERT INTO products (name, unitPrice, stock, discount)
		VALUES('Coleman 氣候達人BREATHE圓頂帳', 16500, 3, 10);
        
INSERT INTO products (id, name, unitPrice, stock, photoUrl, description, shelfDate, discount)
		VALUES(0, 'Coleman4S露營帳', 19900, 3, 'https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzMyOTY2NjkwLzE2MTIyNTczMTZfOTA3OTY0NWE2OGUxMTg5MTUxZmUuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=b1904df0457eb857', '', curdate(), 10);