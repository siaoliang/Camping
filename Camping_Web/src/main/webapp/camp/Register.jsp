<%@page import="java.util.List"%>
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
			
			#main {
				background: #e9e9e9;
			}
			
			#demo {
				border: 1px solid #a9a9a9;
				background: #e9e9e9;
				padding: 10%;
			}
			.main {
				width: 100%;
				padding: 10% 20%;
				margin-top: 25px;
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
			
			function refreshCaptcha(){
				captchaImg.src="images/reg_captcha.png?test=" + parseInt(new Date().getTime(2000));
			}
			
			function init() {
				repopulateForm();
			}
			function repopulateForm(){
				<% if("POST".equals(request.getMethod())){ %>
					//alert("請依照格式正確輸入");
					$("input[name='name']").val('<%= request.getParameter("name") %>');
					$("input[name='phone']").val('<%= request.getParameter("phone") %>');
					$("input[name='email']").val('<%= request.getParameter("email") %>');
					$("input[name='birthday']").val('<%= request.getParameter("birthday") %>');
					$("input[name='password']").val('<%= request.getParameter("password") %>');
					$("input[name='password1']").val('<%= request.getParameter("password1") %>');
					$("input[name='subscribed']").prop('checked', <%= request.getParameter("subscribed")!=null %>);
				<% } %>
			}
			
			
		</script>
	</head>
	<body>
	    <%@ include file="/subviews/header.jsp" %>
		    <div id="main">
		    	<div class="main">
				<h2>註冊新會員</h2>
					<div id="demo">
						<%
							List<String> errors = (List<String>)request.getAttribute("errors");
						%>
						<form class="memberForm" method="POST" action="register.do">
							<ul class="errors">
								<% 
								if(errors!=null && errors.size()>0){
									for(int i=0;i<errors.size();i++){
									String msg = errors.get(i);
								%>
									<li><%=msg %></li>
								<% } 
								}%>
							</ul>
							<p>
								<label><b> 姓名 </b></label><br>
								<input type="text" name="name" placeholder="請輸入您的姓名" required="">
							</p>
							<p>
								<label><b> 電子郵件 </b></label><br>
								<input type="text" name="email" placeholder="請輸入您的E-MAIL" required="">
							</p>
							<p>
								<label><b> 手機號碼 </b></label><br>
								<input type="text" name="phone" placeholder="請輸入您的手機號碼" required="">
							</p>
							<!-- <p>
								<label><b> 簡訊驗證碼 </b></label><br>
								<input type="text" placeholder="請輸入您的簡訊驗證碼">
							</p> -->
							<p>
								<label><b> 生日 </b></label><br>
								<input type="date" name="birthday" placeholder="請輸入您的生日" required="">
							</p>
							<p>
								<label><b> 密碼 </b></label><br>
								<input type="password" name="password" placeholder="請輸入您的密碼" required="">
							</p>
							<p>
								<label><b> 密碼確認 </b></label><br>
								<input type="password" name="password1" placeholder="請再一次輸入您的密碼" required="">
							</p>
							<p>
								<label><b> 是否訂閱電子報 </b></label><br>
								<input type="radio" name="subscribed" value="1">YES
								<input type="radio" name="subscribed" value="2">NO
							</p>
							<p>
								<label><b> 驗證碼 </b></label><br>
								<input type="code" name="captcha" placeholder="請輸入驗證碼" required="">
								<img id="captchaImg" src="images/reg_captcha.png" alt="驗證碼圖片">
								<a title="點選即可更新圖片" id="refreshIcon" href="javascript:refreshCaptcha()"></a>
							</p>
						<div class="btn">
							<button class="btn w-100 mb-1 submit" type="submit"><b>加入會員</b></button>
						</div>
						</form>
					</div>
				</div>
		    </div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>
