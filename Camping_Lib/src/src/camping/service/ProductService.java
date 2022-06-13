package src.camping.service;

import java.util.List;


import src.camping.entity.Product;
import src.camping.exeception.CAMPException;

public class ProductService {
	
	private ProductsDAO dao = new ProductsDAO();
	public List<Product> getAllProducts() throws CAMPException {
		return dao.selectAllProducts();
	}
	
	public List<Product> getProductsByName(String keyword) throws CAMPException{
		return dao.selectProductsByName(keyword);
	}
	
	public List<Product> getProductsBySort(String sort) throws CAMPException{
		return dao.selectProductsByName(sort);
	}
	
	public Product getProductsById(String id) throws CAMPException{
		return dao.selectProductsById(id);
	}
}
