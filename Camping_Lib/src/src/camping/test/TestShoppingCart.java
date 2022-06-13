package src.camping.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import src.camping.entity.CartItem;
import src.camping.entity.Customer;
import src.camping.entity.Product;
import src.camping.entity.ShoppingCart;
import src.camping.exeception.CAMPException;
import src.camping.service.CustomerService;
import src.camping.service.ProductService;

public class TestShoppingCart {
	
	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		ProductService pService = new ProductService();
		try {
			Customer member = cService.login("ellis04@PChome.com.tw", "asdf1236");
			
			Product p4 = pService.getProductsById("4");
			ShoppingCart cart = new ShoppingCart();
			cart.setMember(member);
			cart.addToCart(p4, null, 1);
			
			Product p6 = pService.getProductsById("6");
			cart.addToCart(p6, "橄欖綠", 2);
			Product p7 = pService.getProductsById("7");
			cart.addToCart(p7, null, 3);
			System.out.println("**********");
			System.out.println(cart);
			
//測試用1			
//			for(CartItem item:cart.getCartItemSet()) {
//				if(String.valueOf(item.hashCode()).equals("1005")) {
//					String quantity = "1"; //request.getParameter("");
//					cart.updateCart(item, Integer.parseInt(quantity));
//				}
//			}
//測試用2				
//			CartItem item = new CartItem();
//			item.setProduct(p6);
//			item.setColor(p6.getColor("綠"));
//			
//			cart.updateCart(item, 3);
//			System.out.println("****************");
//			System.out.println(cart);
			
		} catch (CAMPException e) {
			Logger.getLogger("測試[加入購物車]").log(Level.SEVERE, "加入購物車失敗", e);
		}
			
	}
}
