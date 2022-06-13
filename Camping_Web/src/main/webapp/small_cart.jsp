<%@page import="src.camping.entity.ShoppingCart"%>
<%@page import="src.camping.entity.Color"%>
<%@page import="src.camping.entity.Product"%>
<%@page import="src.camping.entity.CartItem"%>
<%@ page pageEncoding="UTF-8" %>
<script>
	var cartQty={"totalQuantity" : "${sessionScope.cart.totalQuantity}"};
</script>
<%
	ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
	if(cart==null || cart.isEmpty()) {
%>
<% }else{ %>
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

<% } %>