<%@page import="src.camping.entity.Outlet"%>
<%@page import="src.camping.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="src.camping.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
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
			
			#left {
				background: none;
				padding: 0px;
				padding-left: 0px;
			}
			.menu1 ul li {
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
				width: 200px;
				border-left: 4px solid #C39D6F;
				padding-left: 10px;
				margin-left: 20px;
				margin-bottom: 0px;
				margin-top: 0px;
			}
			#rank {
				max-width: 100%;
				margin: atuo;
			}
			
			.product {
				width: 260px;
				height: 350px;
				border: 1px solid #c0c0c0;
				border-radius: 5px;
				margin: 0px 10px 20px 10px;
				position: relative;
				display: inline-block;
				vertical-align: top;
			}
			.title {
				border: none;
				font-size: 18px;
				padding: 0px 10px;
				font-family: Microsoft JhengHei;
				display: inline-block;
			}
			.price {
				position: absolute;
				left: 10px;
				bottom: 5px;
				font-size: 18px;
				color: #deb887;
				font-family: Microsoft JhengHei;
			}
			#p {
				width: 250px;
				height: 250px;
				margin: 5px;
				background-size: contain;
			}
			.buy {
				position: absolute;
				right: 10px;
				bottom: 5px;
			}
			button[type="by"]:hover {
		    	background-color: #deb887;
			}
			button[type="by"] {
			    background-color: #C39D6F;
			    border: 1px solid #000000;
			    border-radius: 5px; 
			    color: #ffffff;
			    padding: 2px;
			    font-size: 15px;
			}
			
		</style>
		<script type="text/javascript">
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
			
			
			function init(){
				$("#p").on("error", getCampImg);
			}
			function getCampImg(){
				$(this).attr("src","/images/campings.png");
			}
									
		</script>
	</head>
	<body>
	    <%@ include file="/subviews/header.jsp" %>
		    <div id="main">
		        <aside>
		        	<h2>全部商品</h2>
					<br>
						<%
						//1.取得request的form data
							String keyword = request.getParameter("keyword");
							String sort = request.getParameter("sort");
							String description = request.getParameter("description");
							//TODO:加上分類查詢
						
						//2.呼叫商業邏輯
							ProductService pService = new ProductService();
							List<Product> list;
							if(keyword!=null && keyword.length()>0){
								list = pService.getProductsByName(keyword);
							}else if(sort!=null && sort.length()>0){
								list = pService.getProductsByName(sort);
							}else if(description!=null && description.length()>0){
								list = pService.getProductsByName(description);
							}else{
								list = pService.getAllProducts();  //改成查詢新品
							}
							
							if(list!=null && list.size()>0){
						%>
						<div id="rank">
							<% 
								for(int i=0;i<list.size();i++){ 
								Product p = list.get(i);
							%>	
							<li class="product">
								<img id="p" src="https://cdn.cybassets.com/media/W1siZiIsIjEyOTM1L3Byb2R1Y3RzLzM0MDMwMjg1LzE2MjYyNDYzMDhfNzE0OTcwNWY5M2I1YjJhZmY3NjYuanBlZyJdLFsicCIsInRodW1iIiwiNjAweDYwMCJdXQ.jpeg?sha=c4a6e9a825e02317">
								<a class="title" href="Detail.jsp"><b>Coleman 吸震摺椅</b></a>
								<span class="price"><b>NT$650</b></span>
								<button class="buy" type="by"><b>加入購物車</b></button>
								<% } %>	
							</li>
							<% } %>
						</div>
		        </aside>
		        <article>
		        	<div id="left" class="menu1">
						<ul>
							<li><a href="Product.jsp"><b>全部商品</b></a></li>
							<li><a href="?sort=帳篷"><b>帳篷系列</b></a></li>
							<li><a href="?sort=椅子"><b>家具系列</b></a></li>
							<li><a href="?sort=燈具"><b>燈具照明</b></a></li>
							<li><a href="?sort=爐具"><b>爐具</b></a></li>
							<li><a href=#><b>野炊系列</b></a></li>
							<li><a href=#><b>保冷裝備</b></a></li>
							<li><a href=#><b>睡眠系列</b></a></li>
							<li><a href=#><b>咖啡用品</b></a></li>
						</ul>
					</div>
		        </article>
		    </div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>
