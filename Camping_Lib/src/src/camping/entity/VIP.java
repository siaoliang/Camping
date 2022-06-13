package src.camping.entity;

import java.time.LocalDate;

public class VIP extends Customer {
	
	
	
	
	public VIP() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VIP(String id, String name, String password) {
		super(id, name, password);
		// TODO Auto-generated constructor stub
	}

	public VIP(String id, String name, String password , int discount) {
		super(id, name, password);
		this.setDiscount(discount);
		// TODO Auto-generated constructor stub
	}

	private int discount; //5% off
	
	public int getDiscount() {
		return discount;
		
	}
	
	public void setDiscount(int discount) {
		if(discount>=2 && discount<100) {
			this.discount = discount;
		}else {
			System.err.println("discount不正確");
			//TODO:第13章要改成throw Exception
		}
		
	}
	
	public String getDiscountString() { //10% off:9折,15% off:85折
		int discount = 100-this.discount;
		if (discount%10==0) {
			discount = discount/10;
		}
		
		return discount+"折";
	}

	@Override
	public String toString() {
		return super.toString() +
				"\n 優惠:"+ getDiscountString();
	}
	
	
}
