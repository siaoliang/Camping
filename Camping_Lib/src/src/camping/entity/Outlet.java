package src.camping.entity;

public class Outlet extends Product {
	
	
	
	
	public Outlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Outlet(int id, String name, double unitPrice, int stock) {
		super(id, name, unitPrice, stock);
		// TODO Auto-generated constructor stub
	}

	public Outlet(int id, String name, double unitPrice, int stock, int discount) {
		super(id, name, unitPrice, stock);
		this.setDiscount(discount);
		// TODO Auto-generated constructor stub
	}

	private int discount=5; //5% off
	
	public int getDiscount() {
		return discount;
		
	}
	
	public void setDiscount(int discount) {
		if(discount>=1 && discount<100) {
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
	/**
	 * 查售價
	 * @return 折扣後的售價
	 */
	@Override
	public double getUnitPrice() { //用overriding method來定義查售價
		return super.getUnitPrice() * (100d - discount) / 100;
	}
	/**
	 * 查定價
	 * @return 折扣前的定價
	 */
	public double getListPrice() {
		return super.getUnitPrice();
	}

	@Override
	public String toString() {
		return super.toString() +
				"\n 折扣:" + getDiscountString() +
				"\n 原價:" + getListPrice() +
				"\n 優惠價:" + getUnitPrice();
	}

//	@Override
//	public int hashCode() {
//		final int prime = 31;
//		int result = super.hashCode();
//		result = prime * result + discount;
//		return result;
//	}
//
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (!super.equals(obj))
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		Outlet other = (Outlet) obj;
//		if(!super.equals(obj))  return false; //自行產生
//		if (discount != other.discount)
//			return false;
//		return true;
//	}

	
	
	
	

}
