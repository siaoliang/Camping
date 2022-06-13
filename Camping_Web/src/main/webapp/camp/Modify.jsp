<%@ page import="src.camping.entity.Customer" %>
<%@ page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>CAMP</title>
		<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/camp.css" />
		<script src="https://code.jquery.com/jquery-3.0.0.js" 
				integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
				crossorigin="anonymous" type="text/javascript"></script>

		<style>
			#captchaImg{vertical-align: middle}
			#refreshIcon{width: 20px;vertical-align: middle}
			
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
			
			#demo {
				border: 1px solid #a9a9a9;
				background: #e9e9e9;
				padding: 10%;
			}
			
			h2	{
				width: 200px;
				height: 30px;
				border: none;
				border-left: 4px solid #C39D6F;
				padding-left: 10px;
			}
			::placeholder {
				color: #c0c0c0;
				opacity: 0.7;
			}
			input[type="text"],[type="password"],[type="date"]{
				width: 100%;
				height: 50px;
			    border: 1px solid #a9a9a9;
		  		border-radius: 5px;
		  		padding-left: 20px;
		  		font-size: 15px;
			}
			input[type="code"]{
				width: 40%;
				height: 35px;
			    border: 1px solid #a9a9a9;
		  		border-radius: 5px;
		  		padding-left: 20px;
		  		font-size: 15px;
			}
			#refreshIcon {
				width: 35px;
				height: 35px;
				border: none;
				padding: 5px 15px 15px 10px;
				margin: 10px;
				background: url(images/refresh.png) no-repeat;
				background-size: contain;
			}
			.mb-1 {
		    	margin-bottom: 0.25rem;
			}
			.w-100 {
		    	width: 100%;
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
			    cursor:pointer;
			}
			.errors {
				color: red;
			}
			.email {
				opacity: 0.4;
			}
			.birthday {
				opacity: 0.4;
			}
		</style>
		<script>
		$(document).ready(init);
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
			
			function changePwdDisplay() {
				//alert(displayPwd.checked);
				if (displayPwd.checked){
					password1.type="text";
					password2.type="text";
				}else{
					password1.type="password";
					password2.type="password";
				}
			}
			
			function refreshCaptcha(){
				captchaImg.src="images/reg_captcha.png?test=" + parseInt(new Date().getTime(2000));
			}
			
			function init() {
				repopulateForm();
			}
			function repopulateForm(){
				<% if("POST".equals(request.getMethod())){ %>
					//alert("請依照格式正確輸入");
					$("input[name='email']").val('<%= request.getParameter("email") %>');
					$("input[name='email']").val('${param.email}');
					
					$("input[name='name']").val('<%= request.getParameter("name") %>');
					$("input[name='password1']").val('<%= request.getParameter("password1") %>');
					$("input[name='password2']").val('<%= request.getParameter("password2") %>');
					$("input[name='phone']").val('<%= request.getParameter("phone") %>');
					$("textarea[name='address']").val('<%= request.getParameter("address")%>');
					$(".gender[value='<%= request.getParameter("gender")%>']").prop('checked', true);
					$("input[name='birthday']").val('<%= request.getParameter("birthday") %>');
					$("input[name='subscribed']").prop('checked', <%= request.getParameter("subscribed")!=null %>);
				<% }else{
					Customer member = (Customer)session.getAttribute("member");
					if(member!=null){
				%>
					//$("input[name='email']").val('<%= member.getEmail() %>');
					$("input[name='email']").val('${sessionScope.member.email}');
					
					$("input[name='name']").val('<%= member.getName() %>');
					$("input[name='password1']").val('');
					$("input[name='password2']").val('');
					$("textarea[name='address']").val('${sessionScope.member.address}');
					$(".gender[value='<%= member.getGender()%>']").prop('checked', true);
					$("input[name='phone']").val('<%= member.getPhone() %>');
					$("input[name='subscribed']").prop('checked', <%= member.isSubscribed() %>);
				<%}else{%>
					alert('請先登入!');
				<%}}%>
			}
			
			
		</script>
	</head>
	<body>
		
	    <%@ include file="/subviews/header.jsp" %>
		    <div id="main">
		    	<aside>
				<h2>會員資料修改</h2>
					<div id="demo">
						<%
							List<String> errors = (List<String>)request.getAttribute("errors");
						%>
						<form class="memberForm" method="POST" action="update.do">
							<ul class="errors"><%= errors!=null?errors:"" %>
							
							</ul>
							<p>
								<label><b> 電子郵件 </b></label><br>
								<input type="text" class="email" name="email" value="<%=c!=null?c.getEmail():"" %>" readonly>
							</p>
							<p>
								<label><b> 姓名 </b></label><br>
								<input type="text" name="name" placeholder="請輸入您的姓名" value="<%=c!=null?c.getName():"" %>"
								minlength="<%= Customer.MINLENGTH_PATTERN1%>" maxlength="<%= Customer.MAXLENGTH_PATTERN1 %>">
							</p>
							<p>
								<label><b> 手機號碼 </b></label><br>
								<input type="text" name="phone" placeholder="請輸入您的手機號碼"
								value="<%=c!=null?c.getPhone():"" %>">
							</p>
							<p>
								<label><b> 生日 </b></label><br>
								<input type="date" class="birthday" name="birthday" 
								value="<%=c!=null?c.getBirthday():"" %>" readonly>
							</p>
							<p>
								<label><b> 地址 </b></label><br>
								<input type="text" name="address" placeholder="請輸入您的地址"
								value="<%=c!=null?c.getAddress():"" %>">
							</p>
							<p>
								<label><b> 性別 </b></label><br>
								<input class="gender" type="radio" name="gender" value="M"><label>男</label>
								<input class="gender" type="radio" name="gender" value="F"><label>女</label>
								<input class="gender" type="radio" name="gender" value="O"><label>其他</label>
							</p>
							<p>
								<label><b> 舊密碼 </b></label><br>
								<input type="password" name="password" placeholder="請輸入您的舊密碼" required="修改請做密碼確認">
							</p>
							<p>
								<label><b> 新密碼 </b><input type='checkbox' name='changePwd'></label><br>
								<input type="password" name="password1" placeholder="請輸入您的新密碼" 
								minlength="<%= Customer.MINLENGTH_PATTERN %>" maxlength="<%= Customer.MAXLENGTH_PATTERN %>">
							</p>
							<p>
								<label><b> 新密碼確認 </b></label><br>
								<input type="password" name="password2" placeholder="請再一次輸入您的新密碼" 
								minlength="<%= Customer.MINLENGTH_PATTERN %>" maxlength="<%= Customer.MAXLENGTH_PATTERN %>">
							</p>
							<p>
								<label><b> 是否訂閱電子報 </b></label><br>
								<input class="subscribed" type="radio" name="subscribed" value="1"><label>YES</label>
								<input class="subscribed" type="radio" name="subscribed" value="0"><label>NO</label>
							</p>
							<p>
								<label><b> 驗證碼 </b></label><br>
								<input type="code" name="captcha" placeholder="請輸入驗證碼" required>
								<img id="captchaImg" src="images/reg_captcha.png" alt="驗證碼圖片">
								<a title="點選即可更新圖片" id="refreshIcon" href="javascript:refreshCaptcha()"></a>
							</p>
						<div class="btn">
							<button class="btn w-100 mb-1 submit" type="submit"><b>確認會員資料修改</b></button>
						</div>
						</form>
					</div>
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
