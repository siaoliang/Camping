package src.camping.test;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;

import src.camping.entity.CartItem;
import src.camping.entity.Customer;
import src.camping.entity.Order;
import src.camping.entity.PaymentType;
import src.camping.entity.Product;
import src.camping.entity.ShippingType;
import src.camping.entity.ShoppingCart;
import src.camping.exeception.CAMPException;
import src.camping.service.CustomerService;
import src.camping.service.OrderService;
import src.camping.service.ProductService;

public class TestOrder {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		ProductService pService = new ProductService();
	try {
		Customer member = cService.login("ellis04@PChome.com.tw", "asdf1236");
		
		Product p8 = pService.getProductsById("8");
		ShoppingCart cart = new ShoppingCart();
		cart.setMember(member);
		cart.addToCart(p8, "灰", 1);
		//System.out.println(cart); //for test
		
		Product p13 = pService.getProductsById("13");
		cart.addToCart(p13, null, 2);
		
//		CartItem item = new CartItem();
//		item.setProduct(p8);
//		item.setColor(p8.getColor("灰"));
//		cart.updateCart(item, 1);
//		System.out.println(cart);
		
		System.out.println("**************");
		
		Order order = new Order();
		
		order.setMember(member);
		order.setCreatedDate(LocalDate.now());
		order.setCreatedTime(LocalTime.now());
		
		PaymentType ptype = PaymentType.valueOf("ATM");
		order.setPaymentType(ptype);
		order.setPaymentFee(ptype.getFee());
		
		order.setShippingType(ShippingType.valueOf("HOME"));
		order.setShippingFee(ShippingType.valueOf("HOME").getFee());
		
		order.setRecipientName("錢錢");
		order.setRecipientEmail("ellis04@PChome.com.tw");
		order.setRecipientPhone("0987654322");
		order.setShippingAddress("台北市復興北路99號14F");
		
		order.add(cart);
		
		System.out.println(order);
		
		OrderService oService = new OrderService();
		oService.createOrder(order);
		
		System.out.println(order);
	
	}catch(CAMPException e) {
		Logger.getLogger("測試[加入購物車/建立訂單失敗]").log(Level.SEVERE, "加入購物車失敗/建立訂單失敗", e);
	}
	
	}

}
