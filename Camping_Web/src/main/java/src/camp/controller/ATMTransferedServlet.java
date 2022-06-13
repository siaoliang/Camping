package src.camp.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
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
import src.camping.exeception.CAMPException;
import src.camping.service.OrderService;

/**
 * Servlet implementation class ATMTransferedServlet
 */
@WebServlet(name = "ATMTransferedServlet", urlPatterns = {"/member/atm_transfered.do"})
public class ATMTransferedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer member = (Customer) session.getAttribute("member");
        List<String> errors = new ArrayList<>();
        if (member == null) {
            errors.add("請重新登入");
        }
        //1. 讀取request中Form的輸入值: orderId,bank,last5Code,amount,date,time
        String orderId = request.getParameter("orderId");
        String bank = request.getParameter("bank");
        String last5Code = request.getParameter("last5Code");
        String amount = request.getParameter("amount");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        if (orderId == null || !orderId.matches("\\d+")) {
            errors.add("訂單編號不正確");
        }
        if (bank == null || bank.length() == 0) {
            errors.add("必須輸入轉帳銀行");
        }
        if (last5Code == null || last5Code.length() == 0) {
            errors.add("必須輸入帳號後5碼");
        }
        if (amount == null || amount.length() == 0) {
            errors.add("必須輸入轉帳金額");
        }

        try {
            LocalDate.parse(date);
        } catch (Exception ex) {
            errors.add("必須輸入轉帳日期");
        }

        try {
            LocalTime.parse(time, DateTimeFormatter.ofPattern("H:mm"));
        } catch (Exception ex) {
            errors.add("必須輸入轉帳時間");
        }
        
        if(errors.isEmpty()){
            try{
                OrderService service = new OrderService();                
                Order order = service.getOrderById(member, orderId);
                if(order!=null){
                    service.updateOrderStatusToTransfered(member,orderId, bank, last5Code, amount, date, time);                    
                    //3.1 redirect到歷史訂單
                    response.sendRedirect("Order_history.jsp?orderId="+orderId);
                    return;
                }else{
                    errors.add("訂單編號不正確");
                }   
            }catch(CAMPException ex){
                if(ex.getCause()!=null){
                    this.log("通知轉帳失敗", ex);                    
                }
                errors.add(ex.toString());
            }catch(Exception ex){
                this.log("通知轉帳發生非預期錯誤", ex);     
                errors.add("通知轉帳發生非預期錯誤" + ex);
            }
        }
        
        //3.2 forward回paid.jsp
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("atm_transfered.jsp").forward(request, response);
    }
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	@Override
	public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
