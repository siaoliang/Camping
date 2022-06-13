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
import src.camping.service.MailService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/camp/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		//TODO: 1.取得request中的FormData: id, name, password1, password2, email, birthday, gender, address, phone....
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		String subscribed = request.getParameter("subscribed");
		String captcha = request.getParameter("captcha");
		
		if(name==null || name.length()==0) {
			errors.add("必須輸入姓名");
		}
		
		if(email==null || email.length()==0) {
			errors.add("必須輸入email");
		}
		
		if(phone==null || phone.length()==0) {
			errors.add("必須輸入手機號碼");
		}
		
		if(birthday==null || birthday.length()==0) {
			errors.add("必須輸入生日");
		}
		
		if(password==null || password.length()==0 ||
			!password.equals(password1)) {
			errors.add("必須輸入密碼與確認密碼一致");
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
		
		//TODO: 剩下的檢查
		
		//TODO: 2.若無物則呼叫商業邏輯
		if(errors.isEmpty()) {
			Customer c = new Customer();
			try {
				c.setName(name);
				c.setEmail(email);
				c.setPhone(phone);
				c.setBirthday(birthday);
				c.setPassword(password);
				c.setSubscribed(subscribed!=null);
				
				CustomerService cService = new CustomerService();
				cService.register(c);
				//TODO: 3.1 轉交給register.jsp
				request.setAttribute("member", c);
				RequestDispatcher dispatcher =
						request.getRequestDispatcher("Register_ok.jsp"); 
				MailService.sendHelloMailWithLogo(c.getEmail());
				dispatcher.forward(request, response);
				return;
			}catch(DataInvalidException e) {
				errors.add(e.getMessage());
			}catch (CAMPException e) {
				this.log("註冊失敗", e);
				errors.add(e.getMessage()); //for Admin,Developer, Tester
			}catch (Exception e) {
				this.log("註冊失敗,發生非預期錯誤", e); //for Admin,Developer, Tester
				errors.add(e.getMessage());
			}
		}
			
		
		//3.2產生失敗回應
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/camp/Register.jsp");
		dispatcher.forward(request, response);
		
	}

}
