package src.camp.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.camping.entity.Customer;
import src.camping.entity.Order;
import src.camping.entity.PaymentType;
import src.camping.entity.ShippingType;
import src.camping.entity.ShoppingCart;
import src.camping.exeception.CAMPException;
import src.camping.service.OrderService;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/member/check_out.do")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer member = (Customer)session.getAttribute("member");
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		List<String> errors = new ArrayList<>();
		//1.取得Form Data
		String paymentType = request.getParameter("paymentType");
		String shippingType = request.getParameter("shippingType");
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String shippingAddress = request.getParameter("shippingAddress");
		
		PaymentType pType = null;
		ShippingType sType = null;
		if(cart==null || cart.isEmpty()) {
			errors.add("購物車是空的");
		}
		
		if(paymentType==null || paymentType.length()==0) {
			errors.add("必須選擇付款方式");
		}else {
			try {
				pType = PaymentType.valueOf(paymentType);
			}catch(RuntimeException ex) {
				errors.add("付款方式不正確");
			}
		}
		
		if(shippingType==null || shippingType.length()==0) {
			errors.add("必須選擇貨運方式");
		}else {
			try {
				sType = ShippingType.valueOf(shippingType);
			}catch(RuntimeException ex) {
				errors.add("貨運方式不正確");
			}
		}
		
		if(name==null || name.length()==0) {
			errors.add("必須輸入收件人姓名");
		}
		
		if(phone==null || phone.length()==0) {
			errors.add("必須輸入收件人手機");
		}
		if(email==null || email.length()==0) {
			errors.add("必須輸入收件人email");
		}
		
		if(shippingAddress==null || shippingAddress.length()==0) {
			errors.add("必須輸入收件地址");
		}
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			Order order = new Order();
			try {
				order.setMember(member);
				order.setCreatedDate(LocalDate.now());
				order.setCreatedTime(LocalTime.now());
				
				order.setPaymentType(pType);
				order.setPaymentFee(pType.getFee());
				order.setShippingType(sType);
				order.setShippingFee(sType.getFee());
				
				order.setRecipientName(name);
				order.setRecipientEmail(email);
				order.setRecipientPhone(phone);
				order.setShippingAddress(shippingAddress);
				order.add(cart);
				
				OrderService oService = new OrderService();
				oService.createOrder(order);
				
				//3.1 成功redirect to 歷史訂單(/member/Order_history.jsp)
				session.removeAttribute("cart");
			    if(order.getPaymentType()==PaymentType.CARD){         
			    	request.setAttribute("order", order);
			        request.getRequestDispatcher("/WEB-INF/credit_card.jsp").forward(request, response);                  
			        return;
			    }	
				
				response.sendRedirect(request.getContextPath()+"/member/check_out.jsp?orderId="+ order.getId());
				return;				
			}catch(CAMPException e) {
				this.log("建立訂單失敗", e);
				errors.add(e.getMessage());
			}catch(Exception e) {
				this.log("建立訂單失敗發生非預期錯誤", e);
				errors.add("建立訂單發生錯誤:"+e.getMessage());
			}			
		}
		//3.2 error:forward給check_out.jsp
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
	}

}
