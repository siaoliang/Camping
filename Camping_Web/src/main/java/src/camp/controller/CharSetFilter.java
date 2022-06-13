package src.camp.controller;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class CharSetFilter
 */
@WebFilter(
		dispatcherTypes = {DispatcherType.REQUEST,DispatcherType.ERROR}, 
		urlPatterns = {"*.jsp","*.do"})

public class CharSetFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CharSetFilter() {
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
		// TODO:前置處理
		request.setCharacterEncoding("UTF-8");
		request.getParameterNames(); //鎖住request的CharacterEncoding
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter(); //鎖住request的CharacterEncoding
		
		chain.doFilter(request, response);  //交給下一棒(Filter/Servlet,JSP) 絕不可移掉,否則Filter內的.jsp跟.do都會掛掉
	
		//無後續處理
	}
}
