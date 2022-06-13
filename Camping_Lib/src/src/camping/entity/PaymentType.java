package src.camping.entity;

public enum PaymentType {
	SHOP("門市付款", 0, new ShippingType[]{ShippingType.SHOP}),
	ATM("ATM轉帳", ShippingType.STORE,ShippingType.HOME),
	STORE("超商付款", ShippingType.STORE),
	CARD("信用卡", new ShippingType[] {ShippingType.STORE,ShippingType.HOME}),
	HOME("貨到付款", 80, new ShippingType[] {ShippingType.HOME});
	
	private final String description;
	private final double fee;
	private final ShippingType[] shippingTypeArray;
	
	
	private PaymentType(String description,ShippingType... shippingTypeArray) {
		this(description,0,shippingTypeArray);
	}

	private PaymentType(String description, double fee, ShippingType[] shippingTypeArray) {
		this.description = description;
		this.fee = fee;
		this.shippingTypeArray = shippingTypeArray;
	}

	public String getDescription() {
		return description;
	}

	public double getFee() {
		return fee;
	}
	
	public ShippingType[] getShippingTypeArray() {
		return shippingTypeArray.clone();
	}
	
	public String getShippingArrayString() {
		String data="";
		for(ShippingType sType:shippingTypeArray) {
			if(data.length()>0) data+=",";
			data+=sType.name();
		}
		return data;
	}

	@Override
	public String toString() {
		return description + (fee>0?"," + fee + "元":"");
	}
	
	
}
