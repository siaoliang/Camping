package src.camping.test;

import src.camping.entity.VIP;

public class TestVIP {

	public static void main(String[] args) {
		VIP vip = new VIP();
		
		vip.setId("A123456789");
		vip.setName("  錢多多   ");
		vip.setEmail("ellis@PChome.com.tw");
		vip.setPassword("asdf123456");
		vip.setDiscount(5);
		
//		System.out.println(vip.getId());
//		System.out.println(vip.getName());
//		System.out.println(vip.getEmail());
//		System.out.println(vip.getPassword());
//		System.out.println(vip.getDiscountString());
	
		System.out.println(vip.toString());
	}
}
