package src.camping.service;

import src.camping.entity.Customer;
import src.camping.exeception.CAMPException;

public class CustomerService {
	private CustomersDAO dao = new CustomersDAO(); //deldgation model
	
	public Customer login(String email, String pwd) throws CAMPException {
		if(email==null || (email.length()==0) ||
				pwd==null || pwd.length()==0)
			throw new IllegalArgumentException("帳號密碼必須有值");
		

		Customer c = dao.selectCustomerById(email);
		if(c!=null && c.getPassword()!=null &&
				c.getPassword().equals(pwd)){
			return c;
		}
		throw new CAMPException("登入失敗，帳號密碼輸入錯誤");
		
	}
	
	public void register(Customer c)throws CAMPException {
		if(c==null)
			throw new IllegalArgumentException("新增客戶時customer物件不得為null");
		
			dao.insert(c);
		
	}

	public void modify(Customer c) throws CAMPException {
		if(c==null) 
			throw new IllegalArgumentException("修改客戶時customer物件不得為null");
		dao.modify(c);
	}
}
