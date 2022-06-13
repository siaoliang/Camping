package src.camping.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

public class Order {
	private int id;	//PKey, Auto-increment 		 
	private Customer member; //required
	private LocalDate createdDate; //required	 
	private LocalTime createdTime=LocalTime.now(); //required
	 
	private String recipientName; //required	 
	private String recipientEmail; //required
	private String recipientPhone; //required	 
	private String shippingAddress; //required
	
	private int status=0; //0:新訂單, 1:已轉帳, 2:已入帳, 3:已出貨,...
	
	private PaymentType paymentType; //required
	private double paymentFee;
	private String paymentNote; //optional,付款後才有資料
	
	private ShippingType shippingType; //required
	private double shippingFee;
	private String shippingNote;
	
	private Set<OrderItem> orderItemSet = new HashSet<>(); //required
	private double totalAmount;
	
	//orderItemSet's accessor
	public Set<OrderItem> getOrderItemSet(){
		return new HashSet<>(orderItemSet);
	}
	
	public int size() {
		return orderItemSet.size();
	}
	public int getTotalQuantity() {
		int sum = 0;
		for(OrderItem item:orderItemSet) {
			sum += item.getQuantity();
		}
		return sum;
	}
	public int getTotalAmount() {
		if(orderItemSet.size()>0) {
			int sum = 0;
			for(OrderItem item:orderItemSet) {
				sum += item.getPrice() * item.getQuantity();
			}
			return Math.round(sum);
		}else {
			return (int) this.totalAmount;
		}
	}
	
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getTotalAmountWithFee() {
		return (int) (getTotalAmount()+paymentFee+shippingFee);
	}

	//orderItemSet's mutator
	public void add(OrderItem item) {  //for OrdersDAO: 查詢訂單明細後將orderItem記錄在order物件中
		orderItemSet.add(item);
	}
	public void add(ShoppingCart cart) {  //for CheckoutServletOrdersDAO: 將cartItem轉為orderItem放在order物件中
		if(cart==null || cart.isEmpty()) {
			throw new IllegalArgumentException("結帳時購物車不得為null或必須有明細");
		}
		for(CartItem cartItem:cart.getCartItemSet()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setColor(cartItem.getColor());
			orderItem.setPrice(cartItem.getProduct().getUnitPrice());
			orderItem.setQuantity(cart.getQuantity(cartItem));
			
			orderItemSet.add(orderItem);
		}
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getMember() {
		return member;
	}
	public void setMember(Customer member) {
		this.member = member;
	}
	public LocalDate getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(LocalDate createdDate) {
		this.createdDate = createdDate;
	}
	public LocalTime getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(LocalTime createdTime) {
		this.createdTime = createdTime;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getRecipientEmail() {
		return recipientEmail;
	}
	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}
	public String getRecipientPhone() {
		return recipientPhone;
	}
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public int getStatus() {
		return status;
	}
	public String getStatusString() {
		return Status.getDescription(status);
	}
	public String getStatusString(int status) {
		return Status.getDescription(status);
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public PaymentType getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}
	public double getPaymentFee() {
		return paymentFee;
	}
	public void setPaymentFee(double paymentFee) {
		this.paymentFee = paymentFee;
	}
	public String getPaymentNote() {
		return paymentNote;
	}
	public void setPaymentNote(String paymentNote) {
		this.paymentNote = paymentNote;
	}
	public ShippingType getShippingType() {
		return shippingType;
	}
	public void setShippingType(ShippingType shippingType) {
		this.shippingType = shippingType;
	}
	public double getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}
	public String getShippingNote() {
		return shippingNote;
	}
	public void setShippingNote(String shippingNote) {
		this.shippingNote = shippingNote;
	}

	@Override
	public String toString() {
		return "訂單 [編號=" + id + ", 訂購日期與時間=" + createdDate + createdTime + ", 處理狀態=" + status
				+ ",\n 訂購人=" + member
				+ ",\n 收件人=" + recipientName
				+ ",\n 收件人信箱=" + recipientEmail
				+ ",\n 收件人電話=" + recipientPhone
				+ ",\n 收件地址=" + shippingAddress
				+ ",\n 付款方式=" + paymentType
				+ ",\n 付款費用=" + paymentFee
				+ ",\n 付款資訊=" + paymentNote
				+ ",\n 收件方式與費用=" + shippingType + shippingFee
				+ ",\n 收件資訊=" + shippingNote
				+ ",\n orderItemSet=" + orderItemSet
				+ ",\n 共" + size() + "項商品"+ getTotalQuantity() + "件"
				+ ",\n 總計=" + getTotalAmount() + "元"
				+ ",\n 總金額(+手續費)=" + getTotalAmountWithFee()
				+ "]";
	} 
	
	public enum Status{
		NEW("新訂單"),TRANSFORED("已轉帳"),PAID("已入帳"),
		SHIPPED("已出貨"),ARRIVED("已到貨"),CHECKED("已簽收"),COMPLETE("完結");
		
		private final String description;

		private Status(String description) {
			this.description = description;
		}

		public String getDescription() {
			return description;
		}
		
		public static String getDescription(int status) {
			if(status>=0 && status<values().length)
				return values()[status].getDescription();
			else {
				return String.valueOf(status);
			}
		}
	}
}
