UPDATE orders SET status=1, 
            payment_note='銀行:恆逸銀行,帳號後5碼54321,金額:1942.0元,於2022-01-20 08:30轉帳' 
			WHERE id=1 AND member_id= 'A123456789'
            AND status=0 AND payment_type='ATM'