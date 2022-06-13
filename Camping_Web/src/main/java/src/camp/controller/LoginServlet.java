package src.camp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import src.camping.entity.Customer;
import src.camping.exeception.CAMPException;
import src.camping.exeception.LoginFailException;
import src.camping.service.CustomerService;
import src.camping.service.MailService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="src.camp.controller.LoginServlet",urlPatterns = {"/camp/login.do"}) //http://localhost:8080/camp/
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<String> errors = new ArrayList<String>();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		// 1.取得request的Form Data: id, password, captcha並檢查之
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
//		System.out.println("email:" + email); //for test
//		System.out.println("password:" + password); //for test
//		System.out.println("captcha:" + captcha); //for test
		//TODO: 檢查
		if(email==null || email.length()==0) {
			errors.add("必須輸入帳號");
		}
		if(password==null || password.length()==0) {
			errors.add("必須輸入密碼");
		}
		if(captcha==null || captcha.length()==0) {
			errors.add("必須輸入驗證碼");
		}else {
			String oldCaptcha = (String)session.getAttribute("LoginCaptchaServlet");
			if(!captcha.equals(oldCaptcha)) {
				errors.add("驗證碼不正確");
			}
		}
		session.removeAttribute("LoginCaptchaServlet");
		
		
		//2.若無錯誤則呼叫商業邏輯
		if(errors.isEmpty()) {
			CustomerService cService = new CustomerService();
			try {
				Customer c = cService.login(email, password);
				//3.1 forward(內部轉交)to View: login_ok.html(/login_ok.html)
				//request.setAttribute("member", c); //改用session來記錄會員
				session.setAttribute("member", c);
//				session.setMaxInactiveInterval(10); //單位秒, 當加在web.xml所有都套用  (time out的時間)
				//add cookies(name, auto)
				String auto = request.getParameter("auto");
				Cookie emailCookie = new Cookie("email", email);
				Cookie autoCookie = new Cookie("auto", "checked");
				if(auto!=null){		//要記住帳號, 有效時間: 7天
                    int expDays = 7*24*60*60;  //秒數
                    emailCookie.setMaxAge(expDays);
                    autoCookie.setMaxAge(expDays);
                }else{				//不要記住帳號並清除舊的cookie資料
                	emailCookie.setMaxAge(0); //秒數為0,則表示刪除此cookie
                    autoCookie.setMaxAge(0);
                }
                response.addCookie(emailCookie);
                response.addCookie(autoCookie);
				//3. 轉交給首頁(內部)-作法1
				//RequestDispatcher dispatcher = request.getRequestDispatcher("/camp");
				//dispatcher.forward(request, response);
                String uri = (String)session.getAttribute("previous_uri");
				String queryString = (String)session.getAttribute("previous_query_string");

				if(uri!=null) request.setAttribute("previous_uri", uri);
				if(queryString!=null)request.setAttribute("previous_query_string", queryString);
				session.removeAttribute("previous_uri");
				session.removeAttribute("previous_query_string");				
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("/camp");
				dispatcher.forward(request, response);
				
				//3.轉交給首頁(外部)-作法2
//				response.sendRedirect(request.getContextPath());
				
				
				return;
			}catch (LoginFailException e) {
				errors.add(e.getMessage());
			}catch (CAMPException e) {
				this.log("登入失敗", e);
				errors.add(e.getMessage()); //for Admin,Developer, Tester
			}catch (Exception e) {
				this.log("登入失敗,發生非預期錯誤", e); //for Admin,Developer, Tester
				errors.add(e.getMessage());
			}
		}
		
		
		//3.2產生失敗回應
		request.setAttribute("errors", errors);
		MailService.sendHelloMailWithLogo2("ellis992960@gmail.com");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/camp/Login.jsp");
		dispatcher.forward(request, response);
		
	}

}
