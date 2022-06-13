package src.camping.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import src.camping.entity.Customer;
import src.camping.exeception.CAMPException;
import src.camping.service.CustomerService;
import src.camping.service.OrderService;

public class TestOrderSrevice_getOrdersHistory {
	
	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		try {
			Customer member = cService.login("ellis04@PChome.com.tw", "asdf1236");
			OrderService oService = new OrderService();
			System.out.println(oService.getOrdersHistory(member));
			System.out.println("************");
			System.out.println(oService.getOrderById(member, "2"));
			
		} catch (CAMPException e) {
			Logger.getLogger("測試歷史訂單查詢").log(
					Level.SEVERE, e.getMessage(),e
			);
		}
	}
}
