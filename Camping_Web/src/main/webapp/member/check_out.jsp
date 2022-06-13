<%@page import="src.camping.entity.PaymentType"%>
<%@page import="src.camping.entity.OrderStatusLog" %>
<%@page import="src.camping.entity.OrderItem" %>
<%@page import="src.camping.entity.Order" %>
<%@page import="src.camping.service.OrderService" %>
<%@page import="src.camping.entity.CartItem" %>
<%@page import="src.camping.entity.Color" %>
<%@page import="src.camping.entity.ShoppingCart"%>
<%@page import="src.camping.entity.Outlet"%>
<%@page import="src.camping.entity.Product"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>結帳</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/camp.css" />
<script type="text/javascript" src="../jquery.js"></script>
<style>
	#main > article,#main > aside{
		margin: 5px;
		padding: 5px;
		border-radius: 5pt;
	}
	#main > article {
		width: 250px;
		border: 1px solid #dcdcdc;
		background-color: #ffffff;
		flex-grow: 0.2;
		margin: 190px auto 0px 15%;
		min-height: 800px;
	}

	#main > aside {
		width: 600px;
		flex-grow: 3;
		margin: 190px 15% 0px 30px;
	}
	@media screen and (max-width: 500px){
	#main {
		flex-direction: column;
		}
	}
	@media screen and (min-width: 400px) and (max-width: 600px){
		#main > article {
			display: none;
		}
	}
	@media screen {
		#main > article {
			order: 1;
		}
		#main > aside {
			order: 2;
		}
	}
	#lefts {
		width: 150px;
		height: 18px;
		border-bottom: 1px solid #dcdcdc;
		text-align: left;
		padding: 10px;
		margin-right: 0px;
		margin-bottom: 10px;
		float: left;
		list-style-type: none;
	}
	#products {
		font-family: Arial, Helvetica, sans-serif;
		border-collapse: collapse;
		width: 100%;
	}
	#products td, #products th {
	  	border: 1px solid #ddd;
	  	padding: 8px;
	  	text-align: center;
	}
	#products th {background-color: #f5f5f5;}
	
	h2 {
		border-left: 4px solid #C39D6F;
		padding-left: 10px;
	}
	.client {
		float: left;
	}
	.client1 {
		float: left;
		padding-right: 200px;
	}
	h4 {
		border-bottom: 1px solid #c0c0c0;
		padding-bottom: 2px;
	}
	#notice {
		color: red;
	}
	#notice:hover {
		color: #ff6347;
	}
	/* .statusDiv {
		display:inline-block;width:3.2em;height:1.75em;
		background-color:#00A19D;color:white;text-align:center;		
		border:#88E0EF 1px solid;padding:1ex;
		border-radius: 1ex;
	} */
</style>
</head>
<body>
<%@ include file="/subviews/header.jsp" %>
	<div id="main">
		<aside>
			<%
				session.removeAttribute("cart");
		
				Customer member = (Customer)session.getAttribute("member");
				String orderId = request.getParameter("orderId");
				Order order = null;
				OrderService oService = new OrderService();
				List<OrderStatusLog> logList = null;
				if(member!=null && orderId!=null){
					order = oService.getOrderById(member, orderId);
				}	
			%>
			<form action="check_out.jsp" method="GET">
				<%if(order==null){%>
				<p>查無此訂單(<%=orderId %>)</p>
				<%}else{ %>
				<h2>訂單明細</h2>
				<div class="client">
					<h4>訂單編號:&ensp;<%= order.getId()%> &emsp; 
						處理狀態:&ensp;<%= order.getStatusString()%> &emsp; 
						訂購日期:&ensp;<%= order.getCreatedDate()%>  <%= order.getCreatedTime()%></h4>
					<h4>訂購人:&ensp;<%=c!=null?c.getName():"" %> &emsp; 
						付款方式:&ensp;<%= order.getPaymentType().getDescription()%> 
						<%= order.getPaymentFee()>0?order.getPaymentFee()+"元":"" %>
						<% if(order.getPaymentType()==PaymentType.ATM && order.getStatus()==0){%>
							&ensp;<a id="notice" href='atm_transfered.jsp?orderId=<%= order.getId() %>'>[通知已轉帳]</a>
						<% } %></h4>
					<h4>貨運方式:&ensp;<%= order.getShippingType().getDescription()%>, 
						<%= order.getShippingFee()>0?order.getShippingFee()+"元":"" %>
						<%= order.getShippingNote()!=null && order.getShippingNote().length()>0?"<br>":""%>
						<%= order.getShippingNote()%></h4>
					<h4>訂購人電話:&ensp;<%=c!=null?c.getPhone():"" %></h4>
					<h4>電子郵件:&ensp;<%=c!=null?c.getEmail():"" %></h4>
				</div>
				<div class="client1">
					<br>
					<h4>收件人:&ensp;<%= order.getRecipientName()%></h4>
					<h4>收件人電話:&ensp;<%= order.getRecipientPhone()%></h4>
					<h4>收件人地址:&ensp;<%= order.getShippingAddress()%></h4>
					<h4>電子郵件:&ensp;<%= order.getRecipientEmail()%></h4>
				</div>
				<%-- <div style='clear:both;padding:2em 1ex 2em'>
					<div class='statusDiv' title='<%=order.getCreatedDate() %> <%=order.getCreatedTime() %>'>下單</div>	
					<% logList = oService.getOrderStatusLog(orderId);
						if(logList!=null && logList.size()>0){
							for(OrderStatusLog log:logList){
					%>		
					>	<div class='statusDiv' title='<%= log.getLogTime() %>'><%=order.getStatusString(log.getStatus()) %></div>
					<% }} %>
				</div> --%>
				<div>
					<table id="products">
						<thead>
							<tr>
								<th>商品名稱</th><th>顏色</th><th>單價</th>
								<th>數量</th><th>小計</th>
							</tr>
						<thead>
						<tbody>
							<% 
								for(OrderItem orderItem:order.getOrderItemSet()){ 
									Product p = orderItem.getProduct();
									Color color = orderItem.getColor();					
							%>
							<tr>
								<td><%= p.getName() %></td>
								<td><%= color!=null?color.getName():"" %></td>
								<td><%= orderItem.getPrice() %></td>
								<td><%= orderItem.getQuantity() %></td>
								<td><%= orderItem.getPrice()*orderItem.getQuantity() %></td>
							</tr>
							<% } %>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><%=order.size() %>項商品,共<%=order.getTotalQuantity() %>件</td>
								<td>總計:<%=order.getTotalAmount() %>元</td>
							</tr>
						<tfoot>
					</table>
					<div class='totalAmountWithFee'><b>總金額(含手續費):<%=order.getTotalAmountWithFee() %>元</b></div>
				</div>
			</form>
		</aside>
		<article>
			<div>
				<ul>
					<li id="lefts"><a href="<%= request.getContextPath() %>/camp/Modify.jsp"><b>修改個人資訊</b></a></li>
					<li id="lefts"><a href="<%= request.getContextPath() %>/member/Order_history.jsp"><b>訂單查詢</b></a></li>
					<li id="lefts"><a href="<%= request.getContextPath() %>/member/ShoppingCart.jsp"><b>購物車內容</b></a></li>
				</ul>
			</div>
		</article>
	<% } %>	
	</div>
	<button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
<%@ include file="/subviews/footer.jsp" %>
</body>
</html>