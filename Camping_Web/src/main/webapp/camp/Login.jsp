<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>CAMP</title>
		<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/camp.css" />
		<script type="text/javascript" src="../jquery.js"></script>

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
			input[type="account"],[id="myPass"]{
				width: 90%;
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
			#myShow {
				width: 35px;
				height: 35px;
				padding: 10px 20px 20px 15px;
				margin: 10px;
				background: url(images/eye1.png) no-repeat;
				background-size: contain;
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
		    	margin-bottom: 5em;
			}
			.w-100 {
		    	width: 90%;
			}
			#btnss:hover {
		    	background-color: #deb887;
			}
			#btnss {
			    background-color: #C39D6F;
			    border: none;
			    border-radius: 5px; 
			    color: #ffffff;
			    letter-spacing: 10px;
			    height: 50px;
			    font-size: 16px;
			    cursor:pointer;
			}
			#forgotpassword:hover {
				background-color: #deb887;
			}
			#forgotpassword {
			    background-color: #C39D6F;
			    border: none;
			    border-radius: 5px; 
			    color: #ffffff;
			    height: 25px;
			    font-size: 16px;
			    cursor:pointer;
			}
			.errors {
				color: red;
			}
		</style>
		<script type="text/javascript">
		$(document).ready(init);
			function init(){
				$("#myShow").mousedown(showHandler);
				$("#myShow").mouseup(hideHandler);
				$("#myShow").mouseleave(hideHandler);
				$("#forgotpassword").onclick(sendMail);
			}
			function showHandler(){
				$("#myPass").attr("type","text");
			}
			function hideHandler(){
				$("#myPass").attr("type","password");
			}
			
			function refreshCaptcha(){
				captchaImg.src="images/captcha.png?test=" + parseInt(new Date().getTime(2000));
			}
			
		</script>
	</head>
	<body>
	    <%@ include file="/subviews/header.jsp" %>
		    <div id="main">
		    	<div class="main">	
				<h2>會員登入</h2>
					<div id="demo">
						<%
							//讀取cookies   (此為非el寫法)
// 							Cookie[] cookies = request.getCookies();
// 							String email = "";
// 							String auto = "";
// 							if(cookies!=null && cookies.length>0){
// 								for(int i=0;i<cookies.length;i++){
// 									Cookie cookie = cookies[i];
// 									if(cookie.getName().equals("email")){
// 										email = cookie.getValue();
// 									}else if(cookie.getName().equals("auto")){
// 										auto = cookie.getValue();
// 									}
// 								}
// 							}
							
							List<String> errors = (List<String>)request.getAttribute("errors");
						%>
						<form class="memberForm" method="POST" action="login.do" autocomplete="off">
							<ul class="errors">
								<p><%= errors!=null?errors:"" %></p>
							</ul>
							<p>
								<label><b> 帳號 </b></label><br>
								<input type="account" name="email" placeholder="請輸入您的E-MAIL或手機" required value="${not empty parm.email?parm.email:cookie.email.value}"> <%-- required value='<%= request.getParameter("email")!=null?request.getParameter("email"):email %>' --%>
								<br>
								<input type="checkbox" name="auto" value="ON" ${cookie.auto.value}>記住我的帳號  <!-- 此為el語法 -->
							</p>
							<p>
								<label><b> 密碼 </b></label><br>
								<input type="password" id="myPass" name="password" placeholder="請輸入您的密碼" required="">
								<a title="點選即可顯示密碼" id="myShow" href=#></a>
								<br>
								<br>
								<button id="forgotpassword" class="forgotpassword" type="submit"><b>忘記密碼</b></button>
							</p>
							<p>
								<label><b> 驗證碼 </b></label><br>
								<input type="code" name="captcha" placeholder="請輸入驗證碼" required="">
								<img id="captchaImg" src="images/captcha.png" alt="驗證碼圖片">
								<a title="點選即可更新圖片" id="refreshIcon" href="javascript:refreshCaptcha()"></a>
							</p>
							<div class="btn">
								<button id="btnss" class="btn w-100 mb-1 submit" type="submit"><b>會員登入</b></button>
							</div>
						</form>
					</div>
				</div>
		    </div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>
