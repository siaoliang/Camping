package src.camping.test;

import src.camping.entity.BloodType;
import src.camping.entity.Customer;

public class TestCustomerGenderBloodType {

	public static void main(String[] args) {
		Customer c1 = new Customer("A123456789", "錢多多", "asdf123456");
//		try {
		c1.setGender(Customer.MALE);
		
		System.out.println(c1.getGender());
//		}catch(c1!=MALE || c1!=FEMALE || c1!=OTHER) {
//			System.err.println("錯誤");
//		}	
//		c1.setBloodType(BloodType.O);
//		System.out.println(c1.getBloodType());
//		System.out.println(c1.getBloodType().ordinal());
//		System.out.println(c1.getBloodType().name());
		
		for(int i=0;i<BloodType.values().length;i++) {
			BloodType bType = BloodType.values()[i];
//		for(BloodType bType:BloodType.values()) {
			System.out.println(bType);
//			System.out.println(bType.name());
//			System.out.println(bType.ordinal());
		}
	}
}