package src.camping.test;


import java.util.logging.Level;
import java.util.logging.Logger;

import src.camping.entity.Customer;
import src.camping.exeception.CAMPException;
import src.camping.exeception.DataInvalidException;
import src.camping.exeception.LoginFailException;
import src.camping.service.CustomerService;

public class TestCustomerService_update {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		Customer c;
		try {
			c = cService.login("ellis04@PChome.com.tw", "asdf1236");
			System.out.println(c);
			
			c.setName("錢錢多");
			
			cService.modify(c);
			
			c = cService.login("ellis04@PChome.com.tw", "asdf1236");
			System.out.println(c);
		
		}catch(LoginFailException e) {
			System.out.println(e.getMessage());
		}catch(CAMPException e) {
			Logger.getLogger("測試會員登入").log(Level.SEVERE,
					e.getMessage(), e);
			System.out.println(e.getMessage());
		}catch(Exception e) {
			Logger.getLogger("測試會員登入").log(Level.SEVERE,
					"會員登入發生非預期錯誤"+e.getMessage(), e);
			System.out.println("會員登入發生錯誤"+e.getMessage());
		}
	}

}
