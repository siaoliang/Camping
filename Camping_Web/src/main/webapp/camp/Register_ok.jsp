<%@page import="src.camping.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>註冊成功</title>
	<script>
		function callHomePage(){
			//同步請求
			location.href="./";
		}
	</script>
</head>
<body>
	<header>
		<h2>CAMP <sub>註冊成功</sub></h2>
		<hr>
	</header>
	<% 
		Customer c = (Customer)request.getAttribute("member");
	%>
	<article>
		<p><%= c!=null?c.getName():"未" %>註冊成功! <a href="index.jsp">首頁</a></p>
		<img src="">
	</article>
</body>
</html>