<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>九九乘法表</title>
	<style>
		#customers {
		  font-family: Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		}
		
		#customers td, #customers th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		
		#customers tr:nth-child(even){background-color: #f2f2f2;}
		
		#customers tr:hover {background-color: #ddd;}
		
		#customers th {
		  padding-top: 12px;
		  padding-bottom: 12px;
		  text-align: left;
		  background-color: #04AA6D;
		  color: white;
		}
	</style>
</head>
<body>

<table id="customers">
	<th>
		九九乘法表
	</th>
	
	<% for(int i=1;i<10;i++){ %>
	<tr>
		<% for(int j=1;j<10;j++){ %>
		<td><%=i %>*<%= j %>=<%=i*j%></td>
		<% } %>
	</tr>
	<% } %>
	
	
</table>
<hr>

	<%
		for(int i=1;i<10;i++){
			for(int j=1;j<10;j++){
				out.println("<p>" +i+ "*" +j+ "=" +i*j+ "</p>");
			}
		}
	%>
	
</body>
</html>