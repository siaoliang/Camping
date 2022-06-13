<%@page import="src.camping.entity.CartItem" %>
<%@page import="src.camping.entity.Color" %>
<%@page import="src.camping.entity.ShoppingCart"%>
<%@page import="src.camping.entity.Outlet"%>
<%@page import="src.camping.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="src.camping.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>

<!-- header.jsp start -->
<header class="head">
    	<div class="testdiv">
	  		<div class="ul">
				<button class="dropdown"><img src="<%= request.getContextPath() %>/camp/images/member1.png">
					<div class="dropdown-content">
						<%
							Customer c = (Customer)session.getAttribute("member");
						%>
						<%-- 登入前 --%>
						<% if(c==null){ %>
						<p><a href="<%= request.getContextPath() %>/camp/Login.jsp"><b>會員登入</b></a></p>
						<p><a href="<%= request.getContextPath() %>/camp/Register.jsp"><b>會員註冊</b></a></p>
						<% }else{ %>
						<%-- 登入後 --%>
						<p><a href="<%= request.getContextPath() %>/camp/Modify.jsp"><b>會員資料修改</b></a></p>
						<p><a href="<%= request.getContextPath() %>/member/Order_history.jsp"><b>訂單查詢</b></a></p>
						<p><a href="<%= request.getContextPath() %>/camp/logout.do"><b>會員登出</b></a></p>
						<% } %>
					</div>
				</button>
				<button class="dropdown"><img src="<%= request.getContextPath() %>/camp/images/shopping-cart1.png">
					<div id="cartQ">
						<li class="cartQty">${sessionScope.cart.getTotalQuantity()}</li>
					</div>
				<%
					ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
					if(cart==null || cart.isEmpty()) {
				%>
				<% }else{ %>
					<div id='theCart' class="dropdown-content-pp">
						<table id="pp">
							<thead>
								<tr>
									<th>商品名稱</th><th>顏色</th><th>數量</th>
								</tr>
							<thead>
							<tbody>
								<%
									for(CartItem item:cart.getCartItemSet()){ 
									Product p = item.getProduct();
									Color color = item.getColor();
									int qty = cart.getQuantity(item);
									int stock = color!=null?color.getStock():p.getStock();
								%>
								<tr>
									<td><%= p.getName() %></td>
									<td><%= color!=null?color.getName():"" %></td>
									<td><%= qty %>件</td>
								</tr>
								<% } %>
							</tbody>
						</table>
						<p><a href="<%= request.getContextPath() %>/member/ShoppingCart.jsp"><b>立即結帳</b></a></p>
					</div>
				<% } %>
				</button>
				<button class="dropdown"><img src="<%= request.getContextPath() %>/camp/images/loupe1.png">
					<div class="dropdown-content">
						<form action="/camp/camp/Product_ajax.jsp" method="GET">
							<input id="text99" class="text99" type="search" name="keyword" placeholder="SEARCH">
							<input id="btn99" class="btn99" type="submit" value="搜尋">
						</form>
					</div>
				</button>
				<span class="welcome"><%=c!=null?c.getName()+" 你好":"" %></span>
			</div>
		</div>
		<div class="logo">
			<a href="<%= request.getContextPath() %>/camp/index.jsp"><img src="<%= request.getContextPath() %>/camp/images/logo1.png"></a>				
		</div>
		<div class="menu up">
				<a href=#><b>最新優惠</b></a>
			<div class="dropdown">
				<a href=#><b>商品分類</b></a>
				<div type="dropdw" class="dropdown-content1">
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp"><b>全部商品</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=帳篷"><b>帳篷系列</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=椅子"><b>家具系列</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=燈具"><b>燈具照明</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=爐具"><b>爐具</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=焚火"><b>野炊系列</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=保冷"><b>保冷裝備</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=睡眠"><b>睡眠系列</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=咖啡or茶"><b>咖啡用品</b></a></li>
				</div>
			</div>	
				<a href="<%= request.getContextPath() %>/camp/News.jsp"><b>最新消息</b></a>
			<div class="dropdown">
				<a href=#><b>常見問題</b></a>
				<div class="dropdown-content1">
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Instruction.jsp"><b>購物說明</b></a></li>
					<li class="ll"><a class="item" href="<%= request.getContextPath() %>/camp/Sales_Service.jsp"><b>售後服務</b></a></li>
					<li class="ll"><a class="item" href=#><b>客服中心</b></a></li>
				</div>
			</div>
		</div>	
</header>
<!-- header.jsp end -->