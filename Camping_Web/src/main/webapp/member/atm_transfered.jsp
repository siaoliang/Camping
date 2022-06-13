<%@page import="src.camping.service.OrderService" %>
<%@page import="src.camping.entity.Order" %>
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
		h2 {
			border-left: 4px solid #C39D6F;
			padding-left: 10px;
		}
		input[type="text"],[type="date"] {
			width: 40%;
			height: 30px;
		    border: 1px solid #a9a9a9;
	  		border-radius: 5px;
	  		padding-left: 20px;
	  		font-size: 15px;
		}
		#time {
			width: 20%;
			height: 30px;
		    border: 1px solid #a9a9a9;
	  		border-radius: 5px;
	  		padding-left: 20px;
	  		font-size: 15px;
		}
		#btn2 {
			width: 20.5%;
		    border: 1px solid #000000;
		    border-radius: 5px; 
		    color: #ffffff;
		    letter-spacing: 10px;
		    padding: 7px;
		    font-size: 15px;
		    font-weight:bold;
		    text-align: center;
		    cursor:pointer;
		}
		.btn2:hover {
	    	background-color: #deb887;
		}
		.btn2 {
			background-color: #C39D6F;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.0.0.js" 
			integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
			crossorigin="anonymous"></script>
	<script>
		$(init);
		function init(){
			<% if("POST".equals(request.getMethod())){ %>
				repopulateForm();
			<%}%>
		}
		
		function repopulateForm(){
			$('input[name="orderId"]').val(${param.orderId});
			$('input[name="bank"]').val('${param.bank}');
			$('input[name="last5Code"]').val('${param.last5Code}');
			$('input[name="amount"]').val('${param.amount}');
			$('input[name="date"]').val('${param.date}');
			$('select[name="time"]').val('${param.time}');
		}
	</script>
</head>
<body>
	<%@ include file="/subviews/header.jsp" %>
	<div id="main">
	<%		
		String orderId=request.getParameter("orderId");
        Customer member = (Customer)session.getAttribute("member");
    	OrderService oService = new OrderService();	
		Order order = null;
		if(member!=null && orderId!=null){
			order = oService.getOrderById(member, orderId);
		}
	%>
		<aside>
			<%if(order!=null){ %>
		${requestScope.errors}
        <form class='atmForm' action="atm_transfered.do" method="POST">
        <h2>ATM轉帳資訊</h2>
            ${requestScope.errors}
                <p>
                    <label><b>訂單編號:</b></label>
                    <br>
                    <input type="text" readonly name="orderId" value="<%= order.getId() %>">
                </p>
                <p>
                    <label><b>轉帳銀行:</b></label>
                    <br>
                    <input type="text" required name="bank" placeholder="請輸入轉帳銀行名稱" value="${param.bank}">
                </p>                    
                <p>
                    <label><b>帳號後5碼:</b></label>
                    <br>
                    <input type="text" required name="last5Code" placeholder="請輸入轉帳帳號後5碼"
                    	value="${param.last5Code}">
                </p>                     
                <p>
                    <label><b>轉帳金額:</b></label>
                    <br>
                    <input type="text" required type="number" min="1" name="amount" 
                    	value="<%= request.getParameter("amount")==null?order.getTotalAmountWithFee():request.getParameter("amount") %>" >
                </p>                    
                <p>
                    <label><b>轉帳日期:</b></label>
                    <br>
                    <input type="date" required name="date" min="<%= order.getCreatedDate() %>" max="<%= LocalDate.now() %>" value="${param.date}">
                    
                    <label><b>時間:</b></label>&ensp;<b>約</b>
                      <select id="time" required name="time">
                      	<option value="">請選擇...</option>
                      	<% for(int i=0;i<24;i++) {%>
                      		<option value="<%=i%>:00"><%=i%>:00</option>
				    		<option value="<%=i%>:30"><%=i%>:30</option>
                      	<% } %>
                      </select>
                </p>
                <br>           
                <input id="btn2" class="btn2" type="reset" value="還原"/>
                &ensp;
                <input id="btn2" class="btn2" type="submit" value="確定"/>
            </form> 
            <%}else{%>
            <p>查無此訂單</p>            
        <%}%>
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