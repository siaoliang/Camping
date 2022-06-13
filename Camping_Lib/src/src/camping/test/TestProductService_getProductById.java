package src.camping.test;

import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

import src.camping.entity.Color;
import src.camping.entity.Product;
import src.camping.exeception.CAMPException;
import src.camping.service.ProductService;


public class TestProductService_getProductById {
	
	public static void main(String[] args) {
		ProductService pService = new ProductService();
		try {
			Product p = pService.getProductsById("1");
			System.out.println(p);
			
			if(p.getColorsMapSize()>0) {
				Collection<Color> collection = p.getColors();
				System.out.println(collection);
				for(Color color:collection) {
					System.out.println(color);
				}
			}
			
//			Color pink = new Color();
//			pink.setName("pink");
//			collection.add(pink);
//			System.out.println(collection);
			
		}catch(CAMPException e) {
			Logger.getLogger("測試產品查詢").log(Level.SEVERE, e.getMessage(), e);
		}
	}
}
