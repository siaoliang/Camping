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

import src.camping.entity.Color;
import src.camping.entity.Product;
import src.camping.entity.ShoppingCart;
import src.camping.exeception.CAMPException;
import src.camping.service.ProductService;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/camp/add_to_cart.do")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<String>();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		//1.取得Form Data
		String productId = request.getParameter("productId");
		String colorName = request.getParameter("color");
		String quantity = request.getParameter("quantity");
//		String buy = request.getParameter("buy");
//		System.out.println("************");
//		System.out.println(":" + buy);
		
		if(productId!=null && productId.length()>0) {
			//2.呼叫商業邏輯
			ProductService pService = new ProductService();
			try {
				Product p = pService.getProductsById(productId);
				if(p!=null) {
					if(quantity!=null && quantity.matches("\\d+")) {
						ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
						if(cart==null) {
							cart = new ShoppingCart();
							session.setAttribute("cart", cart);
						}
						cart.addToCart(p, colorName, Integer.parseInt(quantity));
					}
				}else {
					errors.add("加入購物車失敗,查無此產品(productId:" + productId +")");
				}
			} catch (CAMPException e) {
				errors.add("加入購物車失敗");
			}
		}else {
			errors.add("加入購物車失敗");
		}
		
		
		if(errors.size()>0) {
			System.out.println(errors);
		}
		//3.redirect購物車(重新導向)
		String ajax = request.getParameter("ajax");
		if(ajax==null) {
			response.sendRedirect(request.getContextPath()+"/member/ShoppingCart.jsp");
		}else {
			request.getRequestDispatcher("/small_cart.jsp").forward(request, response);
		}
	}

}
