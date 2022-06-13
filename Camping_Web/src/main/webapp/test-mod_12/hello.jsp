<%@ page import="java.time.*" %>
<%@ page pageEncoding="UTF-8" %>
<%!
	private static final int i = 500; //member variable, attribute
	public void jspInit(){
		System.out.print("hello.jsp 完成初始化!");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mod12 scriptlet demo</title>
</head>
<body>
	<%
		int i = 20; //local variable
		//test();
	%>
	<p>i= <%= i %> </p>
	<p>this.i: <%= this.i %></p>
	<p>今天: <%= LocalDate.now() %></p>
	<% 
		if(i>=10){
	%>
	<p>i是一個 >= 10的數字</p>
	<% 	}else { %>
	<p>i是一個 &lt;= 10的數字</p>
	<%	} %>
	
	<%-- 
	<p>j:<%= i/0 %></p>   <!-- i/0 會發生執行時期的錯誤 --!>
	--%>
</body>
</html>