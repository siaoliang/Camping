package src.camping.entity;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ShoppingCart {
	private Customer member;
	private Map<CartItem, Integer> cartMap = new HashMap<>();
	
	
	public Customer getMember() {
		return member;
	}
	public void setMember(Customer member) {
		this.member = member;
	}
	
	//access(es) for cartMap: 多半可以用Delegate Method來加
	public int size() {
		return cartMap.size();
	}
	public boolean isEmpty() { //可用size()==0來取代這個方法
		return cartMap.isEmpty();
	}
	public Set<CartItem> getCartItemSet() {  //回傳集合元件時不得為原本的參考,必須回傳複本元件
		return new HashSet<>(cartMap.keySet()); //回傳複本
//		return cartMap.keySet();  //可能有錯(參照UpdateCartServlet.java : 51行
//		return Collections.unmodifiableSet(cartMap.keySet());
	}
	
	
//	public Collection<Integer> values() {
//		return colorsMap.values();
//	}
	
	public int getQuantity(CartItem item) {
		Integer quantity = cartMap.get(item);
		return quantity==null?0:quantity;
	}
	
	public int getTotalQuantity() {
		int sum = 0;
//		Collection<Integer> values = cartMap.values();
//		Iterator<Integer> iterator = values.
		for(Integer quantity:cartMap.values()) {
			if(quantity!=null) {
//				sum=sum+quantity;
				sum+=quantity;
			}
		}
		return sum;
	}
	
	public double getTotalAmount() {
		double sum = 0;
		for(CartItem item:cartMap.keySet()) {
			double price = item.getProduct().getUnitPrice();
			Integer qty = cartMap.get(item);
			if(qty!=null) sum = sum + price*qty;
		}
		return sum;
	}
	
	//mutator(s) for cartMap: add, update, remove
	public void addToCart(Product product, String colorName, int quantity) {
		if(product==null)
			throw new IllegalArgumentException("加入購物車產品不得為null");
		
		Color color = null;
		if(colorName!=null && colorName.length()>0) {
			color = product.getColor(colorName);
		}
		//TODO:檢查前端傳入的colorName與後端產品清單的對應是否正確
		/*
		 else if(){
		 */
		if(quantity<=0)
			throw new IllegalArgumentException("加入購物車數量不得小於1");
		
		CartItem item = new CartItem();
		item.setProduct(product);
		item.setColor(color);
		
		//找出之前是否加入相同的(product, colorName, size)產品的數量
		Integer oldQuantity = cartMap.get(item);
		if(oldQuantity!=null) {
			quantity+=oldQuantity;
		}
		
		cartMap.put(item, quantity);
	}
	
	public void updateCart(CartItem item, int quantity) {
		if(item==null) throw new IllegalArgumentException("加入購物車產品不得為null");
		//找出之前是否加入相同的(product, colorName, size)產品的數量
		Integer oldQuantity = cartMap.get(item);
		if(oldQuantity!=null) {
			cartMap.put(item, quantity);
		}
	}
	
	public void remove(CartItem item) {
		cartMap.remove(item);
	}
	
	@Override
	public String toString() {
		return this.getClass().getSimpleName()
				+ "\n 訂購人 = " + member
				+ ",\n 訂購商品 = " + cartMap
				+ ",\n " + size() + "項商品"
				+ ",\n 共 = " + getTotalQuantity() + "件"
				+ ",\n 總價 = " + getTotalAmount() + "元";
	}
	
}
