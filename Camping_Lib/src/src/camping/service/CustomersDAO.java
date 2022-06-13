package src.camping.service;
import java.io.DataInputStream;
import java.sql.*;

import src.camping.entity.BloodType;
import src.camping.entity.Customer;
import src.camping.entity.VIP;
import src.camping.exeception.CAMPException;
import src.camping.exeception.DataInvalidException;


class CustomersDAO {  //package-friendly
	
	private static final String SELECT_CUSTOMER = 
			"SELECT id, name, email, password, "
			+ "birthday, gender, address, phone, subscribed, discount "
			+ "FROM customers WHERE email=?";
	
	Customer selectCustomerById(String email) throws CAMPException {
		Customer c = null;
		
		
		try(
				Connection connection = RDBConnection.getConnection(); //1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_CUSTOMER); //3.準備指令
			) {
			//3.1傳入?的值
			pstmt.setString(1, email);
			
			try(
			ResultSet rs = pstmt.executeQuery(); //4.執行指令
			){
			//5.處理rs
				
				while(rs.next()) {
					int discount = rs.getInt("discount");
					
					if(discount>0) {
						c = new VIP();
						((VIP)c).setDiscount(discount);
					}else c = new Customer();
					
//					c = new Customer();
//					c.setId(rs.getString("id"));
					c.setName(rs.getString("name"));
					c.setEmail(rs.getString("email"));
					c.setPassword(rs.getString("password"));
					
					//以下兩種寫法請查資料庫data->String後格式來判斷
//					c.setBirthday(rs.getDate("birthday").toString());
					c.setBirthday(rs.getString("birthday"));
					
//					c.setGender(rs.getString("gender").charAt(0));
					c.setAddress(rs.getString("address"));
					c.setPhone(rs.getString("phone"));
					c.setSubscribed(rs.getBoolean("subscribed"));
					
//					//可不做bType
//					c.setBloodType(rs.getString("blood_type"));
//					String bType = rs.getString("blood_type"); //null, O, A, B, AB
//					if(bType!=null) {
//						try {
//							c.setBloodType(BloodType.valueOf(bType));
//						}catch(RuntimeException ex) {
//							System.out.println("血型不正確");
//						}
//					}
					
				}
			}
		} catch (SQLException e) {
			throw new CAMPException("用帳號查詢客戶失敗", e);
		}
		return c;
	}
	
	private static final String INSERT_CUSTOMER = "INSERT INTO customers"
			+ "(name, email, password, birthday, subscribed, phone)"
			+ "VALUES(?,?,?,?,?,?)";
	void insert(Customer c) throws CAMPException {
		
		try (
				Connection connection = RDBConnection.getConnection(); //1,2. 取得連線
				PreparedStatement pstmt = connection.prepareStatement(INSERT_CUSTOMER); //3.準備指令
				){
			//3.1傳入?的值
//			pstmt.setString(1, c.getId());
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getEmail());
			pstmt.setString(3, c.getPassword());
			pstmt.setString(4, c.getBirthday().toString());
//			pstmt.setString(6, String.valueOf(c.getGender()));
			pstmt.setBoolean(5, c.isSubscribed());
//			pstmt.setString(8, c.getAddress());
			pstmt.setString(6, c.getPhone());
//			pstmt.setString(10, c.getBloodType()!=null?c.getBloodType().name():null);

				int rows = pstmt.executeUpdate(); //4.執行指令
				System.out.println(rows); //for test
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(e.getErrorCode()+","+e.getMessage());
			if(e.getMessage().indexOf("PRIMARY")>0) {
				throw new DataInvalidException("帳號已重複註冊", e);
			}else if(e.getMessage().indexOf("email_UNIQUE")>0) {
				throw new DataInvalidException("email已重複註冊", e);
			}else {
				throw new CAMPException("新增客戶失敗,欄位不得為null", e);
			}
		}catch (SQLException e) {
			throw new CAMPException("新增客戶失敗", e);
		}
	}
	
	private static final String UPDATE_CUSTOMER ="UPDATE customers SET"
			+ "	name=?, password=?, birthday=?, gender=?, address=?, phone=?, subscribed=?"
			+ "    WHERE email=?";
		void modify(Customer c) throws CAMPException {
			try (
					Connection connection = RDBConnection.getConnection(); //1,2. 取得連線
					PreparedStatement pstmt = connection.prepareStatement(UPDATE_CUSTOMER); //3.準備指令
					){
				
				//3.1傳入?的值
				pstmt.setString(1, c.getName());
				pstmt.setString(2, c.getPassword());
				pstmt.setString(3, c.getBirthday().toString());
				pstmt.setString(4, String.valueOf(c.getGender()));
				pstmt.setString(5, c.getAddress());
				pstmt.setString(6, c.getPhone());
				pstmt.setBoolean(7, c.isSubscribed());
				
				pstmt.setString(8, c.getEmail());

				int rows = pstmt.executeUpdate(); //4.執行指令
				//System.out.println(rows); //for test
					
			} catch (SQLIntegrityConstraintViolationException e) {
				System.out.println(e.getErrorCode()+","+e.getMessage());
				if(e.getMessage().indexOf("PRIMARY")>0) {
					throw new DataInvalidException("帳號已重複註冊", e);
				}else if(e.getMessage().indexOf("email_UNIQUE")>0) {
					throw new DataInvalidException("email已重複註冊", e);
				}else {
					throw new CAMPException("修改會員失敗,欄位不得為null", e);
				}
			}catch (SQLException e) {
				throw new CAMPException("修改會員失敗", e);
		}
		
	}
	
}


