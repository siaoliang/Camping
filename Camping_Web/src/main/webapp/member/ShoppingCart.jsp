<%@page import="src.camping.service.OrderService" %>
<%@page import="src.camping.entity.OrderItem" %>
<%@page import="src.camping.entity.Order" %>
<%@page import="src.camping.entity.PaymentType"%>
<%@page import="src.camping.entity.ShippingType"%>
<%@page import="src.camping.entity.CartItem" %>
<%@page import="src.camping.entity.Color" %>
<%@page import="src.camping.entity.ShoppingCart"%>
<%@page import="src.camping.entity.Outlet"%>
<%@page import="src.camping.entity.Product"%>
<%@page import="src.camping.service.ProductService" %>
<%@page import="java.util.List"%>
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
			h2 {
				border-left: 4px solid #C39D6F;
				padding-left: 10px;
			}
			#products {
			  font-family: Arial, Helvetica, sans-serif;
			  border-collapse: collapse;
			  width: 100%;
			}
			#products td, #products th {
			  border: 1px solid #ddd;
			  padding: 8px;
			}
			#products th {background-color: #f5f5f5;}
			
			input[type="text"] {
				width: 90%;
				height: 30px;
			    border: 1px solid #a9a9a9;
		  		border-radius: 5px;
		  		padding-left: 20px;
		  		font-size: 15px;
			}
			.mb-1 {
		    	margin-bottom: 5em;
			}
			.w-100 {
		    	width: 90%;
			}
			button[type="submit"]:hover {
		    	background-color: #deb887;
			}
			button[type="submit"] {
			    background-color: #C39D6F;
			    border: none;
			    border-radius: 5px; 
			    color: #ffffff;
			    letter-spacing: 10px;
			    height: 50px;
			    font-size: 16px;
			}
			.btn:hover {
		    	background-color: #deb887;
			}
			.btn {
			    background-color: #C39D6F;
			    border: none;
			    border-radius: 5px; 
			    color: #ffffff;
			    letter-spacing: 10px;
			    height: 50px;
			    font-size: 16px;
			    cursor:pointer;
			}
			#back {
			    border: none;
			    border-radius: 3px; 
			    color: #ffffff;
			    letter-spacing: 5px;
			    padding: 3px;
			    font-size: 16px;
			}
			.back:hover {
		    	background-color: #deb887;
			}
			.back {
		    	background-color: #C39D6F;
			}
			.shipping {
				font-size: 16px;
			}
			#errors {
				color: red;
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
		<script>
			$(init);
			function init(){
				<%if("POST".equals(request.getMethod())){%>
				repopulateFormDate();
				<%}%>
			}
			
			function repopulateFormDate(){
				$("select[name='paymentType']").val('<%= request.getParameter("paymentType")%>');
				changePaymentType();
				$("select[name='shippingType']").val('<%= request.getParameter("shippingType")%>');
				var theShippingType = document.getElementById("shippingType"); 
				changeShippingType(theShippingType);
				
				$("input[name='name']").val('<%= request.getParameter("name")%>');
				$("input[name='email']").val('<%= request.getParameter("email")%>');
				$("input[name='phone']").val('<%= request.getParameter("phone")%>');
				$("input[name='shippingAddress']").val('<%= request.getParameter("shippingAddress")%>');
			}
			
			function goBackMall(){
				location.href='<%= request.getContextPath() %>/Product_ajax.jsp';
			}
			
			function calculateFee(){
				console.log($("select[name='shippingType'] option:selected").val(), 
						$("select[name='shippingType'] option:selected").val());
				
				var totalAmnt = Number($("#totalAmount").text());
				var totalFee=0;
				if($("select[name='paymentType'] option:selected").val()!=""){
					totalFee += Number($("select[name='paymentType'] option:selected").attr('data-fee'));
					
				}
				if($("select[name='shippingType'] option:selected").val()!=""){
					totalFee += Number($("select[name='shippingType'] option:selected").attr('data-fee'));
				}
				
				console.log(totalAmnt+totalFee);
				$("#amountTitle").text("?????????(+?????????): ");
				$("#totalAmountWithFee").text(totalAmnt+totalFee+" ???");
			}
			
			function changePaymentType(thePaymentType){
				disableShippingTypeOptions($(thePaymentType).val());
				calculateFee();
			}
			
			function disableShippingTypeOptions(){
				var dataShipping = $("select[name='paymentType'] option:selected").attr("data-shipping");
				var selectedShipping = $("select[name='shippingType']").val();
				
				console.log( "??????: ", $("select[name='paymentType'] option:selected").val(),dataShipping);
				console.log( "??????: ", selectedShipping);
				if(dataShipping) dataShipping=dataShipping.split(",");
				$("select[name='shippingType'] option").prop('disabled', false);
				if(dataShipping.length>0){				 
					$("select[name='shippingType'] option").prop('disabled', true);
					for(i=0;i<dataShipping.length;i++){
						console.log($("select[name='shippingType'] option[value='"+dataShipping[i]+"']").val(),
								$("select[name='shippingType'] option[value='"+dataShipping[i]+"']").prop('disabled'));
						$("select[name='shippingType'] option[value='"+dataShipping[i]+"']").prop('disabled', false);
					}
				}
				$("select[name='shippingType']").val('');
				if(selectedShipping){
					if($("select[name='shippingType'] option[value='"+selectedShipping+"']").prop('disabled')!=true){
						$("select[name='shippingType']").val(selectedShipping);
					}
				}
			}
			
			function changeShippingType(theShippingType){
				changeAddressInput(theShippingType);
				calculateFee();	
			}
			
			function changeAddressInput(theShippingType){
				var shipping = $(theShippingType).val();
				//alert(shipping);
				$('input[name="shippingAddress"]').attr('autocomplete','off');
				$("#chooseStoreBtn").css('display','none');
				if(shipping=='STORE'){
					$('input[name="shippingAddress"]').val('')
					$('input[name="shippingAddress"]').attr('list', "storelist");
					$("#chooseStoreBtn").css('display','inline');
				}else if(shipping=='SHOP'){
					$('input[name="shippingAddress"]').val('')
					$('input[name="shippingAddress"]').attr('list', "shoplist");
				}else{
					$('input[name="shippingAddress"]').removeAttr('list');
					$('input[name="shippingAddress"]').attr('autocomplete','on');
				}
				resizeAddress();
			}
			
			function resizeAddress(){
				var phoneWidth = Number($("input[name='phone']").css('width').replace('px', ''));
				console.log(phoneWidth);
				if($("select[name='shippingType']").val()=="STORE"){
					$("input[name='shippingAddress']").css('width',Number(phoneWidth)-73.5);
				}else{
					$("input[name='shippingAddress']").css('width',phoneWidth);
				}
			}
		</script>
		<script>                        	
			function goEzShip() {//??????EZShip????????????
				$("input[name='name']").val($("input[name='name']").val().trim());
				$("input[name='email']").val($("input[name='email']").val().trim());
				$("input[name='phone']").val($("input[name='phone']").val().trim());
				$("input[name='shippingAddress']").val($("input[name='shippingAddress']").val().trim());
				
				var protocol = "<%= request.getProtocol().toLowerCase().substring(0, request.getProtocol().indexOf("/")) %>";
				var ipAddress = "<%= java.net.InetAddress.getLocalHost().getHostAddress()%>";
				var url ="https://" + ipAddress + ":" + location.port + "<%=request.getContextPath()%>/member/ezship_callback.jsp";                   
				$("#rtURL").val(url);
				
				//$("#webPara").val($("form[action='check_out.do']").serialize()); 
				$("#webPara").val($("#cartForm").serialize());
				
				//alert(url); //???????????????????????????????????????comment
				//alert($("#webPara").val()) //???????????????????????????????????????comment
				
				$("#ezForm").submit();
				
			}
		</script>
	</head>
	<body>
		<%@ include file="/subviews/header.jsp" %>
		<div id="main">
			<aside>
				<%
					Customer member = (Customer)session.getAttribute("member");
					if(cart==null || cart.isEmpty()){
				%>
					<p>??????????????????!</p>
				<% } else{ %>
					<p id="errors">${requestScope.errors}</p>
				<form id="cartForm" action="<%= request.getContextPath() %>/camp/update_cart.do" method="POST">
				<h2>???????????????</h2>
				<div>
					<table id="products">
						<thead>
							<tr>
								<th>????????????</th><th>??????</th><th>??????</th>
								<th>??????</th><th>??????</th><th></th><th>????????????</th>
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
								<td><%= p instanceof Outlet?((Outlet)p).getListPrice():p.getUnitPrice() %></td>
								<td><input style="width:50px" type="number" name="quantity<%= item.hashCode() %>" value="<%= qty %>" min="<%= stock>0?1:0 %>" max="<%= stock %>"></td>
								<td><%= item.getColorName() %></td>
								<td><%= p.getUnitPrice() * qty %></td>
								<td><input id="delete" type="submit" name="delete<%= qty %>" value="????????????"></td>
								<td><input type="checkbox" name="delete<%= item.hashCode() %>" value="????????????"></td>
							</tr>
							<% } %>
						</tbody>
						<tfoot>
							<tr>
								<!-- <td><input id="back" value="????????????" onclick="goBackMall()"></td> -->
								<td><a id="back" class="back" href="<%= request.getContextPath() %>/camp/Product_ajax.jsp">????????????</a></td>
								<td></td>
								<td><%= cart.size() %>?????????,???<%= cart.getTotalQuantity() %>???</td>
								<td></td>
								<td>??????:<%= cart.getTotalAmount() %>???</td>
								<td></td>
								<td></td>
							</tr>
						<tfoot>
						
					</table>
				</div>
				<h2>??????????????????</h2>
				<div>
					<table>
						<span><b>????????????</b></span>
						<br>
						<select name='paymentType' onchange="changePaymentType(this)">
							<option value=''>?????????...</option>
							<%for(PaymentType pType:PaymentType.values()) {%>
							<option value='<%= pType.name() %>'
									 data-fee='<%= pType.getFee() %>'
									 data-shipping='<%=pType.getShippingArrayString() %>'>
								<%=pType%>
							</option>
							<% } %>
						</select>
						<br>
						<br>
					</table>
					<br>
					<table>
					<span><b>????????????</b></span>
					<br>
						<select name='shippingType' onchange="changeShippingType(this)">
							<option value=''>?????????...</option>
							<%for(ShippingType sType:ShippingType.values()) {%>
							<option value='<%= sType.name() %>' data-fee='<%= sType.getFee() %>'>
								<%=sType%>
							</option>
							<% } %>
						</select>
					<br>
					<br>
					<input id='chooseStoreBtn' name="chooseStoreBtn" type='button' style='display:none' value='????????????' onclick='goEzShip()'>
					</table>
					
					<datalist id="shoplist">
					    <option value="?????????????????????99???12F(???????????????)">????????????:?????????????????????99???12F</option>
					    <option value="?????????????????????????????????309???2???(????????????)">????????????:?????????????????????????????????309???2???</option>
					    <option value="??????????????????????????????2???25???(????????????)">????????????:??????????????????????????????2???25???</option>
					</datalist>
					<datalist id="storelist">
					    <option value="?????? ?????????">
					    <option value="7-11 ?????????">
					    <option value="????????? ???????????????">
					</datalist>
				</div>
				<h2>???????????????</h2>
				<div>
					<table>
						<span><b>??????</b></span>
						<br>
						<input type="text" name="name" value="<%=c!=null?c.getName():"" %>">
						<br>
						<span><b>????????????</b></span>
						<br>
						<input type="text" name="phone" value="<%=c!=null?c.getPhone():"" %>">
						<br>
						<span><b>????????????</b></span>
						<br>
						<input type="text" name="email" value="<%=c!=null?c.getEmail():"" %>">
						<br>
						<span><b>??????</b></span>
						<br>
						<input type="text" name="shippingAddress" value="<%=c!=null?c.getAddress():"" %>">
					</table>
				</div>
				<br>
				<div>
					<input class="btn w-100 mb-1 submit" name="check_out" type="submit" value="??????">
				</div>
				</form>
				
				<form id="ezForm" method="post" name="simulation_from" action="https://map.ezship.com.tw/ezship_map_web.jsp">
					<input type="hidden" name="suID"  value="test01@camp.com"> <!-- ????????? ezShip ???????????????, ????????? -->
					<input type="hidden" name="processID" value="CAMP20220100000008"> <!-- ???????????????????????????????????????, ????????? -->
					<input type="hidden" name="stCate"  value=""> <!-- ???????????????????????? -->
					<input type="hidden" name="stCode"  value=""> <!-- ?????????????????? -->
					<input type="hidden" name="rtURL" id="rtURL" value=""> <!-- ??????????????????????????? -->
					<input type="hidden" id="webPara" name="webPara" value=""> <!-- ???????????????cartForm???????????????????????????ezShip?????????????????????????????????????????? -->
				</form>
			</aside>
	        <article>
	        	<div>
					<ul>
						<li id="lefts"><a href="<%= request.getContextPath() %>/camp/Modify.jsp"><b>??????????????????</b></a></li>
						<li id="lefts"><a href="<%= request.getContextPath() %>/member/Order_history.jsp"><b>????????????</b></a></li>
						<li id="lefts"><a href="<%= request.getContextPath() %>/member/ShoppingCart.jsp"><b>???????????????</b></a></li>
					</ul>
				</div>
	        </article>
	        <% } %>
		</div>
		<button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>