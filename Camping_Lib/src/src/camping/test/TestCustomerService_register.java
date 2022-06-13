package src.camping.test;


import java.util.logging.Level;
import java.util.logging.Logger;

import src.camping.entity.Customer;
import src.camping.exeception.CAMPException;
import src.camping.exeception.DataInvalidException;
import src.camping.service.CustomerService;

public class TestCustomerService_register {

	public static void main(String[] args) {
		try {
			Customer c = new Customer();
			c.setId("A169241293");
			c.setName("老天爺");
			c.setEmail("ellis07@PChome.com.tw");
			c.setPassword("asdf12355");
			c.setBirthday("1988-08-08");
			c.setGender(Customer.MALE);
			c.setPhone("0912345678");
			c.setAddress("台北市復興北路99號14F");
			c.setSubscribed(true);
			
			CustomerService cService = new CustomerService();
		
			cService.register(c); //SQLIntegrityConstraintViolationException (Column cannot be null,帳號或email重複註冊 Java6.0以上會看到此錯誤)
		}catch(DataInvalidException e) {
			System.out.println(e.getMessage());
		}catch(CAMPException e) {
			Logger.getLogger("測試註冊會員").log(Level.SEVERE,
					e.getMessage(), e);
			System.out.println(e.getMessage());
		}catch(Exception e) {
			Logger.getLogger("測試註冊會員").log(Level.SEVERE,
					"註冊會員發生非預期錯誤"+e.getMessage(), e);
			System.out.println("註冊會員發生錯誤"+e.getMessage());
		}

	}

}
