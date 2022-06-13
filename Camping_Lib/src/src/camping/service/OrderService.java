package src.camping.service;

import java.time.LocalDateTime;
import java.util.List;

import src.camping.entity.Customer;
import src.camping.entity.Order;
import src.camping.entity.OrderStatusLog;
import src.camping.exeception.CAMPException;

public class OrderService {
	private OrdersDAO dao = new OrdersDAO();
	
	public void createOrder(Order order) throws CAMPException {
		dao.insert(order);
	}
	
	public List<Order> getOrdersHistory(Customer member) throws CAMPException{
		if(member == null) 
			throw new IllegalArgumentException("查詢歷史訂單時member物件不得為null");
		return dao.selectOrdersByCustomer(member.getEmail());
	}

	public Order getOrderById(Customer member, String orderId) throws CAMPException{
		return dao.selectOrdersByCustomer(member.getEmail(), orderId);
	}
	
	public void updateOrderStatusToTransfered(Customer member, String id, 
            String bank, String last5Code, String amount, String date, String time) throws CAMPException {        
        if(member==null || member.getEmail().length()==0) throw new IllegalArgumentException("通知轉帳必須傳入member email");
        if(id==null || id.length()==0) throw new IllegalArgumentException("通知轉帳必須傳入order id");
        String paymentNote = "銀行:" + bank + ","
                + "帳號後5碼:" + last5Code + ","
                + "金額:" + amount + ","
                + date + " " + time+"完成轉帳";

        dao.updateOrderStatusToTransfered(member.getEmail(), Integer.parseInt(id), paymentNote);
    }	
    
    public List<OrderStatusLog> getOrderStatusLog(String orderId)throws CAMPException{
    	return dao.selectOrderStatusLog(orderId);
    }
    
    public void updateOrderStatusToPAID(String memberEmail,String orderId, String cardF6, String cardL4,
            String auth, String paymentDate, String amount) throws CAMPException {
        StringBuilder paymentNote = new StringBuilder("信用卡號:");
       paymentNote.append(cardF6==null?"4311-95":cardF6).append("**-****").append(cardL4==null?2222:cardL4);
       paymentNote.append(",授權碼:").append(auth==null?"777777":auth);
       paymentNote.append(",交易時間:").append(paymentDate==null?LocalDateTime.now():paymentDate);
//        paymentNote.append(",刷卡金額:").append(amount);
       System.out.println("orderId = " + orderId);
       System.out.println("memberEmail = " + memberEmail);
       System.out.println("paymentNote = " + paymentNote);
       dao.updateOrderStatusToPAID(memberEmail, Integer.parseInt(orderId), paymentNote.toString());
    }
}
