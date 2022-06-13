package src.camping.test;

import src.camping.entity.Customer;
import src.camping.entity.Outlet;
import src.camping.entity.Product;


public class TestPolymorphism {

	public static void main(String[] args) {
		Object o = new Object();
		String s = "Hello";
		
		System.out.println(o);
		
		Object o1 = new String("Hello"); //polymorphic declaration
		
		System.out.println(o.toString()); //java.lang.Object@7d6f77cc
		System.out.println(o.getClass().getSimpleName()); //Object
		
		System.out.println(s.toString()); //Hello
		System.out.println(s.getClass().getSimpleName()); //String
		System.out.println(s.length()); //5
		
		System.out.println(o1.toString());
		System.out.println(o1.getClass().getSimpleName());
//		System.out.println(o1.length()); //compile-time error
		System.out.println(((String)o1).length()); //5 這為轉型
		
		Customer c1 = new Customer("A123456789", "錢多多", "asdf123456");
		System.out.println(c1.toString()); 
		System.out.println(c1.getClass().getSimpleName()); //Customer
		System.out.println(c1.getName()); //錢多多
		
		o1 = new Customer("A123456789", "錢多多", "asdf123456"); //polymorphic declaration
		System.out.println(o1.toString()); //Customer: id:A123456798, ...
		System.out.println(o1.getClass().getSimpleName()); //Customer
//		System.out.println(o1.getName()); //compile-time error
		System.out.println(((Customer)o1).getName()); //錢多多 這為轉型
		
		Product p = new Outlet(1, "LED營燈", 750, 1); //polymorphic declaration
		System.out.println(p.getId());
		System.out.println(p.getName());
//		System.out.println(p);
		if(p instanceof Outlet) {
			((Outlet)p).setDiscount(20); //抓出新方法來
			System.out.println(((Outlet)p).getListPrice());
			System.out.println(((Outlet)p).getDiscountString());
			System.out.println(((Outlet)p).getUnitPrice());
		}
		
	}

}
