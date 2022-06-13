package src.camp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.camping.entity.Customer;
import src.camping.exeception.CAMPException;
import src.camping.exeception.DataInvalidException;
import src.camping.service.CustomerService;





/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/camp/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<String> errors = new ArrayList<>();
		HttpSession session = request.getSession();
		Customer member = (Customer)session.getAttribute("member");
		
		if(member==null) {
			errors.add("請重新登入");
			request.getRequestDispatcher("/camp/Login.jsp");
			return;
		}
		//1. 讀取request中的FormData，並檢查之
		//			email,name,password1,password2,gender,birthday,
		//   		address,phone,bloodType,subscribed,
		//   		captcha
		
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password"); //old密碼
		String changePwd = request.getParameter("changePwd"); //有值才要改
		String password1 = request.getParameter("password1"); //new密碼
		String password2 = request.getParameter("password2"); //new密碼確認
		String subscribed = request.getParameter("subscribed");
		String captcha = request.getParameter("captcha");
		
		//檢查必要欄位哪些沒有輸入
		if(email==null || !email.equals(member.getEmail())) {
			errors.add("帳號不得變更");
		}else {
			password = member.getPassword();
		}
		
		if(password==null || !password.equals(member.getPassword())) {
			errors.add("原密碼不正確");
		}
		
		if(changePwd!=null) {
			if(password1==null || !password1.equals(password2)) {
				errors.add(String.format("必須輸入長度為%d~%d且內容一致的密碼與確認密碼", 
						Customer.MINLENGTH_PATTERN,Customer.MAXLENGTH_PATTERN));
			}else {
				password=password1;
			}
		}
		
		if(name==null || name.length()==0) {
			errors.add("必須輸入姓名");
		}
		
		if(phone==null || phone.length()==0) {
			errors.add("必須輸入手機號碼");
		}
		
		if(birthday==null || birthday.length()==0) {
			errors.add("必須輸入生日");
		}
		
		if(address==null || address.length()==0) {
			errors.add("必須輸入地址");
		}
		
		if(captcha==null || captcha.length()==0) {
			errors.add("必須輸入驗證碼");
		}else {
			String oldCaptcha = (String)session.getAttribute("RegisterCaptchaServlet");
			if(!captcha.equals(oldCaptcha)) {
				errors.add("驗證碼不正確");
			}
		}
		session.removeAttribute("RegisterCaptchaServlet");
		
		//2.若檢查無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			Customer c = new Customer();
			try {
				c.setEmail(member.getEmail());
				c.setPassword(password);
//				if(password1==null) {
//					c.setPassword(member.getPassword());				
//				}else{ //要改密碼
//					c.setPassword(password1);
//					password=password1;
//				}
				
				c.setName(name);
				c.setGender(gender.charAt(0));
				c.setBirthday(birthday);	
				c.setAddress(address);
				c.setPhone(phone);
				c.setSubscribed(subscribed!=null);
				
				CustomerService service = new CustomerService();
				service.modify(c);
				
				Customer newMember = service.login(member.getEmail(), password);
				session.setAttribute("member", newMember);
				request.setAttribute("customer", c);
				request.getRequestDispatcher("/").forward(request, response);			
				return;
			} catch(DataInvalidException e) {
				errors.add(e.getMessage()); //輸出到網頁上
			} catch (CAMPException e) {
				this.log("資料修改失敗", e);   //寫給admin, tester
				errors.add(e.getMessage()); //輸出到網頁上
			} catch(Exception e) {	
				this.log("會員資料修改失敗", e);   //寫給admin, tester, developer
				errors.add(e.getMessage()+"，請聯絡系統管理員"); //輸出到網頁上
			}
		}
		System.out.println(errors);
	
		//3.2產生失敗回應
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/camp/Modify.jsp");
		dispatcher.forward(request, response);
	}

}
