package src.camping.test;

import src.camping.entity.Customer;
import src.camping.entity.Product;
import src.camping.entity.VIP;

public class TestEquals {

	public static void main(String[] args) {
		
		int i = 1;
		double j = 1.0;
		System.out.println(1==1.0); //true
		System.out.println(true==false); //false
		System.out.println(i==j); //true
		
		String s1 = "Hello";
		String s2 = "Hello";
		System.out.println(s1==s2); //true
		
		String s3 = "Hello";
		String s4 = new String("Hello");
		System.out.println(s3==s4); //false
		System.out.println(s1.equals(s4)); //true ,若要相同必須在Customer增加equals,否則兩者為false
		System.out.println("\t"+s4.equals(s1)); //true
		
		Customer c1 = new Customer("A123456789", "錢多多", "asdf123456");
		Customer c2 = new VIP("A123456789", "錢多多", "asdf123456");
		System.out.println(c1==c2); //false
//		System.out.println(c1.equals(c2)); //false
		System.out.println(c1.equals(c2)); //true
		
		c2=c1;
		System.out.println(c1==c2); //true
		
		Product p1 = new Product(1, "LED營燈", 700);
		Product p2 = new Product(1, "LED營燈", 700);
		System.out.println(p1==p2); //false
		System.out.println(p1.equals(p2)); //true
		

	}

}
