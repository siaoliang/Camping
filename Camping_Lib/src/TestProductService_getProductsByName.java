import java.util.logging.Level;
import java.util.logging.Logger;

import src.camping.exeception.CAMPException;
import src.camping.service.ProductService;

public class TestProductService_getProductsByName {
	public static void main(String[] args) {
		ProductService pService = new ProductService();
		try {
			System.out.println(pService.getProductsByName("休閒"));
		} catch (CAMPException e) {
			Logger.getLogger("測試產品查詢").log(Level.SEVERE, e.getMessage(), e);
		}
	}

}
