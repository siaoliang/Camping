package src.camping.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import src.camping.entity.Customer;
import src.camping.exeception.CAMPException;
import src.camping.exeception.LoginFailException;
import src.camping.service.CustomerService;

public class TestCustomerService_login {

	public static void main(String[] args) { //boundary, controller
		CustomerService cService = new CustomerService();
		Customer c;
		try {
			c = cService.login("A123456798", "asdf123456");
			System.out.println(c);
		} catch (LoginFailException e) {
			System.out.println(e.getMessage()); //for user(呈現在網頁上)
		} catch (CAMPException e) {
			Logger.getLogger("測試客戶登入").log(Level.SEVERE,"客戶登入時發生錯誤(BUG)"+e.getMessage(),e); //for admin, developer, tester
			System.out.println(e.getMessage()); //for user(呈現在網頁上)
		} catch (Exception e) {
			Logger.getLogger("測試客戶登入").log(Level.SEVERE,e.getMessage(),e); //
			System.out.println("客戶登入發生錯誤: "+e.getMessage()); //for user(呈現在網頁上)
		}
		
	}

}
