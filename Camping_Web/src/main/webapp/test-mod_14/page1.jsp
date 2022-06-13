<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>page1</title>
</head>
<body>
	<h1>Page1</h1>
	<%
//		out.flush();
//		RequestDispatcher d = request.getRequestDispatcher("page2.jsp");
//		d.forward(request, response); //將產生的response的控制權完全轉交給page2
	%>
	<jsp:forward page="page2.jsp"></jsp:forward>
</body>
</html>