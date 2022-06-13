package src.camping.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import src.camping.entity.Color;
import src.camping.entity.Customer;
import src.camping.entity.Order;
import src.camping.entity.OrderItem;
import src.camping.entity.OrderStatusLog;
import src.camping.entity.PaymentType;
import src.camping.entity.Product;
import src.camping.entity.ShippingType;
import src.camping.exeception.CAMPException;
import src.camping.exeception.CAMPStockShortageException;

class OrdersDAO {
	
	private static final String UPDATE_PRODUCTS_STOCK="UPDATE products "
			+ "SET stock=stock-? WHERE stock>=? AND id = ?";	
	private static final String UPDATE_PRODUCT_COLORS_STOCK="UPDATE product_colors "
			+ "SET stock=stock-? WHERE stock>=? AND product_id=? AND color_name=?";
	
	private static final String INSERT_ORDERS="INSERT INTO orders "
			+ "(id, member_email, created_date, created_time,"
			+ "	recipient_name,	recipient_email, recipient_phone, shipping_address,"
			+ " payment_type, payment_fee,"
			+ " shipping_type, shipping_fee, status)"
			+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,0)";
	private static final String INSERT_ORDER_ITEMS="INSERT INTO order_items "
			+ " (order_id, product_id, color_name, price, quantity) "
			+ " VALUES(?,?,?,?,?)";
	void insert(Order order) throws CAMPException {
		if(order == null) throw new IllegalArgumentException("新增訂單時order物件不得為null");
		
		try(
				Connection connection = RDBConnection.getConnection(); //1,2 取得連線
				PreparedStatement pstmt01=connection.prepareStatement(UPDATE_PRODUCTS_STOCK);
				PreparedStatement pstmt02=connection.prepareStatement(UPDATE_PRODUCT_COLORS_STOCK);
				PreparedStatement pstmt1 = connection.prepareStatement(INSERT_ORDERS, Statement.RETURN_GENERATED_KEYS); //3.準備pstmt1 //java固定寫法,自動給號(防止回傳時問題)(important)
				PreparedStatement pstmt2 = connection.prepareStatement(INSERT_ORDER_ITEMS); //3.準備pstmt2
			) {
			
			connection.setAutoCommit(false); //類似begin trans
			try {
				//修改庫存
				for(OrderItem orderItem:order.getOrderItemSet()) {
					Product p = orderItem.getProduct();
					Color color = orderItem.getColor();
					int qty = orderItem.getQuantity();
					
					PreparedStatement pstmt0;
					if(color!=null) {
						pstmt0 = pstmt02;
						pstmt0.setString(4, color.getName());
					}else{
						pstmt0 = pstmt01;
					}
					
					pstmt0.setInt(1, qty);
					pstmt0.setInt(2, qty);
					pstmt0.setInt(3, p.getId());
					
					int row=pstmt0.executeUpdate();
					if(row==0) throw new CAMPStockShortageException(orderItem);						
				}
				//新增訂單
				//3.1 傳入pstmt1 ? 的值
				pstmt1.setInt(1, order.getId());
				pstmt1.setString(2, order.getMember().getEmail());
				pstmt1.setString(3, order.getCreatedDate().toString());
				pstmt1.setString(4, order.getCreatedTime().toString());
				pstmt1.setString(5, order.getRecipientName());
				pstmt1.setString(6, order.getRecipientEmail());
				pstmt1.setString(7, order.getRecipientPhone());
				pstmt1.setString(8, order.getShippingAddress());
				pstmt1.setString(9, order.getPaymentType().name());
				pstmt1.setDouble(10, order.getPaymentFee());
				pstmt1.setString(11, order.getShippingType().name());
				pstmt1.setDouble(12, order.getShippingFee());
				//4.執行 pstmt1 指令
				pstmt1.executeUpdate();
				
				//TODO:讀取key...
				try(
					ResultSet rs = pstmt1.getGeneratedKeys();
				){
					while(rs.next()) order.setId(rs.getInt(1));
//						int id = rs.getInt(1);
//						order.setId(id);
				}
				//新增訂單明細
				for(OrderItem orderItem:order.getOrderItemSet()) {
					Product p = orderItem.getProduct();
					Color color = orderItem.getColor();
					//3.1傳入pstmt2 ? 的值
					pstmt2.setInt(1, order.getId());
					pstmt2.setInt(2, p.getId());
					pstmt2.setString(3, color!=null?color.getName():"");
					pstmt2.setDouble(4, orderItem.getPrice());
					pstmt2.setInt(5, orderItem.getQuantity());
					
					//4.執行pstmt2指令
					pstmt2.executeUpdate();
				}
				connection.commit(); //commit
			}catch(Exception e) {
				connection.rollback(); //rollback
				throw e;
			}finally {
				connection.setAutoCommit(true);
			}
		} catch (SQLException e) {
			throw new CAMPException("新增訂單失敗", e);
		}
	}
	
	private static final String SELECT_ORDERS_BY_CUSTOMER=
			"SELECT id, member_email, created_date, created_time, payment_type, payment_fee, shipping_type, shipping_fee, status,"
			+ "	SUM(price * quantity) as total_amount"
			+ "	FROM orders LEFT JOIN order_items ON id=order_id"
			+ "    WHERE member_email=?"
			+ "    GROUP BY orders.id";
	
	List<Order> selectOrdersByCustomer(String customerEmail) throws CAMPException{
		if(customerEmail==null || customerEmail.length()==0)
			throw new IllegalArgumentException("查詢歷史訂單時memberId必須有值");
		List<Order> list = new ArrayList<>();
		
		try (Connection connection = RDBConnection.getConnection(); //1,2 取得連線
				 PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDERS_BY_CUSTOMER); //3.準備指令
					) {
			//3.1傳入?的值
			pstmt.setString(1, customerEmail);
			
			try(ResultSet rs = pstmt.executeQuery();			//4.執行指令
					){
					//5.處理rs
					while(rs.next()) {
						Order order = new Order();
						order.setId(rs.getInt("id"));
						
						Customer c = new Customer();
						c.setEmail(rs.getString("member_email"));
						order.setMember(c);
						
						order.setCreatedDate(LocalDate.parse(rs.getString("created_date")));
						order.setCreatedTime(LocalTime.parse(rs.getString("created_time")));
						
						String pType = rs.getString("payment_type");
						try {
							PaymentType paymentType = PaymentType.valueOf(pType);
							order.setPaymentType(paymentType);					
						}catch(Exception e) {
							System.err.println ("付款方式不正確: " + pType);
						}
						
						order.setPaymentFee(rs.getDouble("payment_fee"));
						
						String sType = rs.getString("shipping_type");
						try {
							ShippingType shippingType = ShippingType.valueOf(sType);
							order.setShippingType(shippingType);					
						}catch(Exception e) {
							System.out.println ("貨運方式不正確: " + pType);
						}
						
						order.setShippingFee(rs.getInt("shipping_fee"));
					
						order.setStatus(rs.getInt("status"));
						order.setTotalAmount(rs.getInt("total_amount"));
						
						list.add(order);
					}
				}			
				
			} catch (SQLException e) {
				throw new CAMPException("查詢歷史訂單失敗",e);
			}
			
			return list;
		}
	
	private static final String SELECT_ORDER_BY_ID=
			"SELECT orders.id, member_email, created_date, created_time,"
			+ "    order_id, order_items.product_id, products.name as product_name,products.photoUrl, "
			+ "    order_items.color_name, product_colors.color_name as p_color_name, "
			+ "    product_colors.photoUrl as color_photo,"
			+ "    price, quantity, "
			+ "	recipient_name, recipient_email, recipient_phone, shipping_address, "
			+ "    payment_type, payment_fee, payment_note, "
			+ "    shipping_type, shipping_fee, shipping_note, status"
			+ "    FROM orders JOIN order_items ON orders.id=order_items.order_id"
			+ "			JOIN products ON order_items.product_id = products.id"
			+ "            LEFT JOIN product_colors ON order_items.product_id = product_colors.product_id"
			+ "				AND order_items.color_name = product_colors.color_name"
			+ "    WHERE member_email=? AND orders.id = ?";
	Order selectOrdersByCustomer(String customerEmail, String orderId) throws CAMPException {
		Order order = null;
		try (Connection connection = RDBConnection.getConnection(); //1,2 取得連線
				 PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_BY_ID); //3.準備指令
			) {
			//3.1傳入?的值
			pstmt.setString(1, customerEmail);
			pstmt.setString(2, orderId);
			
			try(ResultSet rs = pstmt.executeQuery();			//4.執行指令
					){
					//5.處理rs
					while(rs.next()) {
						if(order==null) {
							order = new Order();
							order.setId(rs.getInt("id"));
							
							Customer c = new Customer();
							c.setEmail(rs.getString("member_email"));
							order.setMember(c);						
							order.setCreatedDate(LocalDate.parse(rs.getString("created_date")));
							order.setCreatedTime(LocalTime.parse(rs.getString("created_time")));						
							String pType = rs.getString("payment_type");
							try {
								PaymentType paymentType = PaymentType.valueOf(pType);
								order.setPaymentType(paymentType);					
							}catch(Exception e) {
								System.err.println ("付款方式不正確: " + pType);
							}
							
							order.setPaymentFee(rs.getDouble("payment_fee"));
							order.setPaymentNote(rs.getString("payment_note"));
							String sType = rs.getString("shipping_type");
							try {
								ShippingType shippingType = ShippingType.valueOf(sType);
								order.setShippingType(shippingType);					
							}catch(Exception e) {
								System.out.println ("貨運方式不正確: " + pType);
							}						
							
							order.setShippingFee(rs.getDouble("shipping_fee"));
							order.setShippingNote(rs.getString("shipping_note"));
							order.setStatus(rs.getInt("status"));
							
							order.setRecipientName(rs.getString("recipient_name"));
							order.setRecipientEmail(rs.getString("recipient_email"));
							order.setRecipientPhone(rs.getString("recipient_phone"));
							order.setShippingAddress(rs.getString("shipping_address"));
						}
						
						OrderItem orderItem = new OrderItem();
						
						Product p = new Product();
						p.setId(rs.getInt("product_id"));
						p.setName(rs.getString("product_name"));
						p.setPhotoUrl(rs.getString("photoUrl"));
						orderItem.setProduct(p);
						
						String colorName = rs.getString("p_color_name");
						Color color = null;
						if(colorName!=null) {
							color = new Color();
							color.setName(rs.getString("color_name"));
							color.setPhotoUrl(rs.getString("color_photo"));
							orderItem.setColor(color);
						}					
						
						orderItem.setPrice(rs.getDouble("price"));
						orderItem.setQuantity(rs.getInt("quantity"));	
						
						order.add(orderItem);
					}
				}
			
		} catch (SQLException e) {
			throw new CAMPException("查詢歷史訂單失敗",e);
		}
		return order;
	}
	
	private static final String UPDATE_ORDER_STATUS_TO_TRANSFERED = "UPDATE orders SET status=1, " //狀態設定為已通知付款
            + "payment_note=? WHERE id=? AND member_email=? "
            + "AND status=0 AND payment_type='" + PaymentType.ATM.name() + "'";
    void updateOrderStatusToTransfered(String memberEamil, int id,String paymentNote) throws CAMPException {
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(UPDATE_ORDER_STATUS_TO_TRANSFERED);) {

            //3.1 傳入?的值
            pstmt.setString(1, paymentNote);            
            pstmt.setInt(2, id);
            pstmt.setString(3, memberEamil);
            //4.執行指令
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            throw new CAMPException("[修改訂單狀態為已轉帳]失敗", ex);
        }
    }
    
    private static final String SELECT_ORDER_STATUS_LOG = "SELECT order_id, old_status, new_status, old_payment_note, "
    		+ "new_payment_note, update_time FROM camp.order_status_log WHERE order_id=?";
    List<OrderStatusLog> selectOrderStatusLog(String orderId)throws CAMPException{
    	List<OrderStatusLog> list = new ArrayList<>();
		try(Connection connection = RDBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_STATUS_LOG);
				){
			//3.1 傳入?的值
			pstmt.setString(1, orderId);
			
			//4. 執行指令
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					OrderStatusLog log = new OrderStatusLog();
					log.setId(rs.getInt("order_id"));
					log.setOldStatus(rs.getInt("old_status"));
					log.setStatus(rs.getInt("new_status"));
					log.setLogTime(rs.getString("update_time"));
					list.add(log);
				}				
			}
			return list;
		}catch(SQLException ex) {
			throw new CAMPException("查詢訂單狀態Log失敗", ex);
		}    	
    }
    
    private static final String UPDATE_STATUS_TO_ENTERED = "UPDATE orders SET status=2" //狀態設定為已付款
            + ", payment_note=? WHERE member_email=? AND id=?"
            + " AND status=0" + " AND payment_type='" + PaymentType.CARD.name() + "'"; 
    public void updateOrderStatusToPAID(String memberEmail, int orderId, String paymentNote) throws CAMPException {
        try (Connection connection = RDBConnection.getConnection(); //2. 建立連線
                PreparedStatement pstmt = connection.prepareStatement(UPDATE_STATUS_TO_ENTERED) //3. 準備指令
                ) {
            //3.1 傳入?的值
            pstmt.setString(1, paymentNote);
            pstmt.setString(2, memberEmail);
            pstmt.setInt(3, orderId);

            //4. 執行指令

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("修改信用卡付款入帳狀態失敗-" + ex);
            throw new CAMPException("修改信用卡付款入帳狀態失敗!", ex);
        }
    }
}
