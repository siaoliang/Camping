package src.camping.test;

import src.camping.entity.Customer;
import src.camping.entity.VIP;

public class TestInstanceof {

	public static void main(String[] args) {
		Object o = new Object();
		Customer c = new Customer();
		VIP vip = new VIP();
		
//		VIP vip = (VIP)o;  //無法向下轉型
		
//		Object o = new VIP(); //強制轉型
//		VIP vip = (VIP)o; //但須先做instanceof檢查
						
		System.out.println(o instanceof Object); //true
		System.out.println(c instanceof Object); //true
		System.out.println(vip instanceof Object); //true
		
		System.out.println(o instanceof Customer); //false
		System.out.println(c instanceof Customer); //true
		System.out.println(vip instanceof Customer); //true
		
		System.out.println(o instanceof VIP); //false
		System.out.println(c instanceof VIP); //false
		System.out.println(vip instanceof VIP); //true
		
		System.out.println(o instanceof String); //false
//		System.out.println(c instanceof String); //compile-time error
//		System.out.println(vip instanceof String); //compile-time error
		
		Object o1 = null;
		Customer c1 = null;
		VIP vip1 = null;
		
		System.out.println(o1 instanceof Object); //false
		System.out.println(c1 instanceof Object); //false
		System.out.println(vip1 instanceof Object); //false

	}

}
