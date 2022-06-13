package src.camping.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import src.camping.entity.Color;
import src.camping.entity.Outlet;
import src.camping.entity.Product;
import src.camping.exeception.CAMPException;

class ProductsDAO {
	
	private static final String SELECT_ALL_PRODUCTS=
			"SELECT id, name, unitPrice, stock, photoUrl,"
			+"description, shelfDate, discount, sort, video, format,"
			+"photoUrl2, photoUrl3, photoUrl4, photoUrl5, photoUrl6 FROM products";
	
	List<Product> selectAllProducts() throws CAMPException {
		List<Product> list = new ArrayList<>();
		
		
		try (Connection connection = RDBConnection.getConnection(); //1,2 取得連線
			PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_PRODUCTS); //3.準備指令
			ResultSet rs = pstmt.executeQuery(); //4.執行指令
			) {
			//5.處理rs
			while(rs.next()) {
				Product p;
				int discount = rs.getInt("discount");
				if(discount>0) {
					p = new Outlet();
					((Outlet)p).setDiscount(discount);
				}else {
					p = new Product();
				}
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setUnitPrice(rs.getInt("unitPrice"));
				p.setStock(rs.getInt("stock"));
				p.setPhotoUrl(rs.getString("photoUrl"));
				p.setPhotoUrl2(rs.getString("photoUrl2"));
				p.setPhotoUrl3(rs.getString("photoUrl3"));
				p.setPhotoUrl4(rs.getString("photoUrl4"));
				p.setPhotoUrl5(rs.getString("photoUrl5"));
				p.setPhotoUrl6(rs.getString("photoUrl6"));
				p.setDescription(rs.getString("description"));
				p.setShelfDate(LocalDate.parse(rs.getString("shelfDate")));
				p.setVideo(rs.getString("video"));
				p.setFormat(rs.getString("format"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			throw new CAMPException("商品查詢失敗", e);
		}
		
		return list;
	}
	
	private static final String SELECT_PRODUCTS_BY_NAME="SELECT id, name, unitPrice, stock, photoUrl, description, shelfDate, discount, sort "
			+ "FROM products"
			+ "	WHERE name LIKE ? OR sort=? OR description LIKE ?";
	List<Product> selectProductsByName(String keyword) throws CAMPException{
		List<Product> list = new ArrayList<>();
		//TODO:完成關鍵字查詢
		
		try (
				Connection connection = RDBConnection.getConnection(); //1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_NAME);//3.準備指令
			){
		//3.1傳入?的值
			pstmt.setString(1, '%'+keyword+'%');
			pstmt.setString(2, keyword);
			pstmt.setString(3, '%'+keyword+'%');
			
		try(
			ResultSet rs = pstmt.executeQuery(); //4.執行指令
		){
			//5.處理rs
			while(rs.next()) {
				Product p;
				int discount = rs.getInt("discount");
				if(discount>0) {
					p = new Outlet();
					((Outlet)p).setDiscount(discount);
				}else {
					p = new Product();
				}
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setUnitPrice(rs.getInt("unitPrice"));
				p.setStock(rs.getInt("stock"));
				p.setPhotoUrl(rs.getString("photoUrl"));
				p.setDescription(rs.getString("description"));
				p.setShelfDate(LocalDate.parse(rs.getString("shelfDate")));
				
				list.add(p);
			}
		}
			
		} catch (SQLException e) {
			throw new CAMPException("商品查詢失敗", e);
		} 
		
		return list;
	}
	
	private static final String SELECT_PRODUCTS_BY_ID=
			"SELECT id, name, unitPrice, products.stock, products.photoUrl, description, shelfDate, discount, sort, video, format,"
			+ " photoUrl2, photoUrl3, photoUrl4, photoUrl5, photoUrl6,"
			+ "	product_id, color_name,"
			+ " products.stock, product_colors.stock AS color_stock,"
			+ " products.photoUrl, product_colors.photoUrl AS color_photo"
			+ " FROM products LEFT JOIN product_colors ON id=product_id"
			+ " WHERE id = ?";
	Product selectProductsById(String id) throws CAMPException {
		Product p = null;
		try (
				Connection connection = RDBConnection.getConnection(); //1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_ID);//3.準備指令
			){
		
		pstmt.setString(1, id);
		
		try(
				ResultSet rs = pstmt.executeQuery(); //4.執行指令
			){
		
		//5. 處理rs
			while(rs.next()) {
				//第一筆才需要建立產品物件並將讀取的產品資料指派給屬性
				if(p==null) {
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);
					}else {
						p = new Product();
					}
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getInt("unitPrice"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photoUrl"));
					p.setPhotoUrl2(rs.getString("photoUrl2"));
					p.setPhotoUrl3(rs.getString("photoUrl3"));
					p.setPhotoUrl4(rs.getString("photoUrl4"));
					p.setPhotoUrl5(rs.getString("photoUrl5"));
					p.setPhotoUrl6(rs.getString("photoUrl6"));
					p.setDescription(rs.getString("description"));
					p.setShelfDate(LocalDate.parse(rs.getString("shelfDate")));
					p.setVideo(rs.getString("video"));
					p.setFormat(rs.getString("format"));
				}
				
				//讀取color並加入產品中
				String colorName = rs.getString("color_name");
				if(colorName!=null) {
				Color color = new Color();
					color.setName(colorName);
					color.setStock(rs.getInt("color_stock"));
					color.setPhotoUrl(rs.getString("color_photo"));
					System.out.println(color);
					p.add(color);
				}	
				System.out.println(p);
			}
		}
			
		} catch (SQLException e) {
			throw new CAMPException("關鍵字查詢失敗", e);
		}
		return p;
	}
	
}
