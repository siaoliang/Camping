<%@ page import="src.camping.entity.Customer" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="refresh" content="30;url=./">
<title>登入成功</title>
	<script>
		function callHomePage(){
			//同步請求
			location.href="./";
		}
	</script>
</head>
<body>
	<header>
		<h2>CAMP <sub>登入成功</sub></h2>
		<hr>
	</header>
	<% 
		System.out.print("Hello JSP"); //for test
		Customer c = (Customer)session.getAttribute("member");
	%>
	<article>
		<p><%= c!=null?c.getName():"未" %>登入成功! <a href="index.jsp">首頁</a></p>
		<img src="">
	</article>
</body>
</html>