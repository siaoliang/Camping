package src.camping.test;

import java.time.LocalDate;

import src.camping.entity.Customer;

public class TestCustomer {

	public static void main(String[] args) {
		int i=1;
		int j = i;
		i++;
		System.out.println("i:" + i); //2
		System.out.println("j:" + j); //1
		
		Customer customer = new Customer(null, null, null, null);
		
//		customer.id="A123456789";
		customer.setId("A123465789");
		customer.setName("錢多多");
		customer.setEmail("ellis@PChome.com.tw");
		customer.setPassword("asdf123456");
		
//		customer.birthday=LocalDate.of(Integer.parseInt("2000"),
//				Integer.parseInt("10"),Integer.parseInt("10"));
		
//		customer.birthday = LocalDate.of(2000, 10, 10);
		customer.setBirthday("2000-10-10");
		customer.setBirthday(2000,10,10);
		
		
		customer.setBirthday(LocalDate.of(2000, 10, 10));
		customer.setGender('M');
		customer.setPhone("26222220");
		customer.setAddress("台北市復興北路99號14F");
		
		System.out.println(customer.getId());
		System.out.println(customer.getName());
		System.out.println(customer.getEmail());
		System.out.println(customer.getPassword());
		System.out.println(customer.getBirthday()); //2000-10-10, ISO 8601
		System.out.println(customer.getGender());
		System.out.println(customer.getAddress());
		System.out.println(customer.getPhone());
		System.out.println(customer.isSubscribed());
		
		Customer customer2 = new Customer(null, null, null, null);
//		customer2.id="A123456798";
		customer2.setId("A123465798");
		customer2.setName("錢少少");
		customer2.setEmail("ellis@PChome.com.tw");
		customer2.setBirthday(LocalDate.of(2002, 10, 10));
		customer2.setPassword("asdf654321");
		customer2.setAddress(customer.getAddress());
		customer2.setPhone(customer.getPhone());
		
		
		System.out.println(customer2.getId());
		System.out.println(customer2.getName());
		System.out.println(customer2.getEmail());
		System.out.println(customer2.getPassword());
		System.out.println(customer2.getBirthday());
		System.out.println(customer.getGender());
		System.out.println(customer.getAddress());
		System.out.println(customer.getPhone());
		System.out.println(customer.isSubscribed());
		
	}

}
