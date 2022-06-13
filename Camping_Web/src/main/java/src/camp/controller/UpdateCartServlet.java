package src.camp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import src.camping.entity.CartItem;
import src.camping.entity.ShoppingCart;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/camp/update_cart.do")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(cart!=null && cart.size()>0) {
			for(CartItem item:cart.getCartItemSet()) {
			//1.取得Form Data
				String quantity = request.getParameter("quantity" + item.hashCode());
				String delete = request.getParameter("delete" + item.hashCode());
				System.out.println("quantity" + item.hashCode() + ":" + quantity);  //for test
				System.out.println("delete" + item.hashCode() + ":" + delete);  //for test
			//2.呼叫商業邏輯
				if(delete==null) {
					//修改數量
					if(quantity!=null && quantity.matches("\\d+")) {
						int qty = Integer.parseInt(quantity);
						if(qty>0) {
							cart.updateCart(item, qty);
						}else {
							cart.remove(item); //可能發生runtimeException,java.util.ConcurrentModificationException
						}
					}
				}else {
					//刪除這筆cartItem
					cart.remove(item); //可能發生runtimeException,java.util.ConcurrentModificationException
				}
			}
		}
		
		//3.redirect購物車(重新導向)
		String check_out = request.getParameter("check_out");
		if(check_out!=null) {
			request.getRequestDispatcher("/member/check_out.do").forward(request, response);
		
		}else response.sendRedirect(request.getContextPath()+"/member/ShoppingCart.jsp");
	
	}

}
