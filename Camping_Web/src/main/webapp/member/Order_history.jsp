<%@page import="src.camping.service.OrderService" %>
<%@page import="src.camping.entity.Order" %>
<%@page import="java.util.List"%>
<%@page import="src.camping.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CAMP</title>
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
			float: right;
			padding-right: 100px;
		}
		h4 {
			border-bottom: 1px solid #c0c0c0;
			padding-bottom: 2px;
		}
		#Inquire {
		    border: none;
		    border-radius: 3px; 
		    color: #ffffff;
		    letter-spacing: 5px;
		    padding: 3px;
		    font-size: 16px;
		}
		.Inquire:hover {
	    	background-color: #deb887;
		}
		.Inquire {
	    	background-color: #C39D6F;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#backTop").click(function(){ 
				$("html,body").animate({scrollTop:0}, 300);
			});
			$(window).scroll(function() {
				if ( $(this).scrollTop() > 300 ){
					$("#backTop").fadeIn(300);
				} else {
					$("#backTop").stop().fadeOut(300);
				}
			}).scroll();
		});
		
	</script>
</head>
<body>
<%@ include file="/subviews/header.jsp" %>
	<div id="main">
		<%
			Customer member = (Customer)session.getAttribute("member");
			OrderService oService = new OrderService();			
			List<Order> list = null;
			if(member!=null){
				list = oService.getOrdersHistory(member);
			}					
		%>
		<aside>
			<% if(list==null || list.isEmpty()) {%>
			<p>查無歷史訂單</p>
			<%}else{ %>
			<h2>歷史訂單</h2>
				<table id="products">
					<thead>
						<tr>
							<th>No.</th>
							<th>日期時間</th>
							<th>付款方式</th>
							<th>貨運方式</th>
							<th>處理狀況</th>
							<th>總金額</th>
							<th>檢視明細</th>
						</tr>
					</thead>
					<tbody>
						<% 
							
							for(Order order:list) {
								
						%>
						<tr>
							<td><%=order.getId() %></td>
							<td><%=order.getCreatedDate() %> <%=order.getCreatedTime() %></td>
							<td><%=order.getPaymentType()!=null?order.getPaymentType().getDescription():"付款資料錯誤" %></td>
							<td><%=order.getShippingType()!=null?order.getShippingType().getDescription():"貨運資料錯誤" %></td>
							<td><%=order.getStatusString() %></td>
							<td>NT$<%=order.getTotalAmountWithFee() %>元</td>
							<td><a id="Inquire" class="Inquire" href='check_out.jsp?orderId=<%= order.getId()%>'>訂單明細</a></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			<% } %>
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
	</div>
	<button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
<%@ include file="/subviews/footer.jsp" %>
</body>
</html>