<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>404</title>
</head>
<body>
	<h2>找不到這個網頁:<span><%= request.getAttribute("javax.servlet.error.request_uri") %></span></h2>
	<img src="<%= request.getContextPath() %>/camp/images/404.png">
<%@ include file="/subviews/footer.jsp" %>
</body>
</html>