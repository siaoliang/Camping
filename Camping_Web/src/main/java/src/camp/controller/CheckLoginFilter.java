package src.camp.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.camping.entity.Customer;

/**
 * Servlet Filter implementation class CheckLoginFilter
 */
@WebFilter("/member/*")
public class CheckLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CheckLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		HttpSession session = httpRequest.getSession();
		Customer member = (Customer)session.getAttribute("member");
		if(member!=null) {
			chain.doFilter(request, response); //轉交給下一棒
		}else {
			String uri = httpRequest.getRequestURI();
			String queryString = httpRequest.getQueryString();
			//System.out.println(uri);  //for test
			httpRequest.getSession().setAttribute("previous_uri", uri);
			httpRequest.getSession().setAttribute("previous_query_string", queryString);
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/camp/Login.jsp");
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
