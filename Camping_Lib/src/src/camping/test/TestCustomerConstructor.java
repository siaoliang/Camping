package src.camping.test;

import java.time.LocalDate;

import src.camping.entity.Customer;

public class TestCustomerConstructor {

	public static void main(String[] args) {
		Customer customer = 
				new Customer("A123456789", "  錢多多  ", "asdf123456");
		
//		customer.setId("A123456789");		
//		customer.setName("  錢多多  ");
		customer.setEmail("ellis@PChome.com.tw");
//		customer.setPassword("asdf123456");
		customer.setBirthday(LocalDate.of(2000, 10, 10));
		customer.setGender('M');
		customer.setPhone("26222220");
		customer.setAddress("台北市復興北路99號14F");
		
//		System.out.println(customer.getId());
//		System.out.println(customer.getName());
//		System.out.println(customer.getEmail());
//		System.out.println(customer.getPassword());
//		System.out.println(customer.getBirthday()); //2000-10-10, ISO 8601
//		System.out.println(customer.getGender());
//		System.out.println(customer.getAddress());
//		System.out.println(customer.getPhone());
//		System.out.println(customer.isSubscribed());
		
		System.out.println(customer.toString());
	}

}
