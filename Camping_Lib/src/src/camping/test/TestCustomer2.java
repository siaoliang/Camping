package src.camping.test;

import java.time.LocalDate;

import src.camping.entity.Customer;

public class TestCustomer2 {

	public static void main(String[] args) {
		int i=1;
		int j = i;
		i++;
		System.out.println("i:" + i); //2
		System.out.println("j:" + j); //1
		
		Customer customer = new Customer("A123456789", "  錢多多  ", "asdf123456", LocalDate.of(2000, 10, 10));
		
//		customer.id="A123456789";
		customer.setId("A123456789");		
		customer.setName("一二三四五六七八九十一");
		customer.setEmail("ellis@PChome.com.tw");
		customer.setPassword("asdf123456");
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
		
		//計算年齡
		int thisYear = LocalDate.now().getYear();
		int birthYear = customer.getBirthday().getYear();
		int age = thisYear-birthYear;
		System.out.println("age:" + customer.getAge());
		
		Customer customer2 = new Customer(null, null, null, null);
//		customer2.id="A123456798";
		customer2.setId("A123456798");
		customer2.setName("錢少少");
		customer2.setEmail("ellis@PChome.com");
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
		
		//計算年齡
		int thisYear1 = LocalDate.now().getYear();
		int birthYear1 = customer2.getBirthday().getYear();
		int age1 = thisYear1-birthYear1;
		System.out.println("age:" + customer2.getAge());
		
	}

}
