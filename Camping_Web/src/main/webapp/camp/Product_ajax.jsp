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
		<link rel="stylesheet" href="<%=request.getContextPath() %>/fancybox3/jquery.fancybox.css">
		<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/camp.css" />
		
		<script type="text/javascript" src="../jquery.js"></script>
		<script src='<%=request.getContextPath() %>/fancybox3/jquery.fancybox.js'></script>

		<style>
		
			#main > aside,#main > article{
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
			
			.products {
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
			#cart {
				position: absolute;
				right: 10px;
				bottom: 5px;
				color: #ffffff;
			    border: 1px solid #000000;
			    border-radius: 5px; 
			    padding: 2px;
			    font-size: 15px;
			}
			.cart:hover {
		    	background-color: #deb887;
			}
			.cart {
				background-color: #C39D6F;
			}
			#productDetail {
				width: 70em;
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
			
			function getProduct(pId){
				//??????????????????
//	 			location.href="Detail3.jsp?productId=" + pId;
				
				//?????????????????????
				var xhr = $.ajax({
					url:"Detail_ajax.jsp?productId=" + pId ,
					method: "GET"
				}).done(getProductDoneHandler);
			}
			
			function getProductDoneHandler(data, textStatus, jqXHR){
				//alert(data);
				//data???fancybox??????
				$("#productDetail").html(data);		
		 		$("#productDetail").css('height','fit-content');
		 		$.fancybox.open({
				    src  : "#productDetail",
				    type : "inline",
				    opts : {
				      afterShow : function( instance, current ) {
				        console.info("done!");
			      }
			    }
			  });
			}
							
		</script>
	</head>
	<body>
	    <%@ include file="/subviews/header.jsp" %>
		    <div id="main">
		    <div id="productDetail" style="display:none"></div>
		        <aside>
		        	<%
						//1.??????request???form data
							String keyword = request.getParameter("keyword");
							String sort = request.getParameter("sort");
							String description = request.getParameter("description");
							//TODO:??????????????????
						
						//2.??????????????????
							ProductService pService = new ProductService();
							List<Product> list;
							if(keyword!=null && keyword.length()>0){
								list = pService.getProductsByName(keyword);
							}else if(sort!=null && sort.length()>0){
								list = pService.getProductsByName(sort);
							}else if(description!=null && description.length()>0){
								list = pService.getProductsByName(description);
							}else{
								list = pService.getAllProducts();  //??????????????????
							}
							
							if(list!=null && list.size()>0){
						%>
		        	<h2>????????????</h2>
					<br>
						<div id="rank">
							<% 
								for(int i=0;i<list.size();i++){ 
								Product p = list.get(i);
							%>
					<form action="add_to_cart.do" method="POST">
		        		<input type="hidden" name="productName" value="<%= p.getName() %>">	
							<li class="products">
								<img id="p" src="<%= p.getPhotoUrl() %>">
								<a class="title" href="Detail3.jsp?productId=<%= p.getId() %>"><b><%= p.getName() %></b></a>
								<span class="price"><b>NT$<%= p.getUnitPrice() %></b></span>
								<a id="cart" class="cart" href="javascript:getProduct(<%= p.getId() %>)"><b>???????????????</b></a>
								<% } %>	
							</li>
							<% } %>
						</div>
					</form>
		        </aside>
		        
		        <article>
		        	<div>
						<ul>
							<li id="lefts"><a href="Product_ajax.jsp"><b>????????????</b></a></li>
								
							<li id="lefts"><a href="?sort=??????"><b>????????????</b></a></li>
							<li id="lefts"><a href="?sort=??????"><b>????????????</b></a></li>
							<li id="lefts"><a href="?sort=??????"><b>????????????</b></a></li>
							<li id="lefts"><a href="?sort=??????"><b>??????</b></a></li>
							<li id="lefts"><a href="?sort=??????"><b>????????????</b></a></li>
							<li id="lefts"><a href="?sort=??????"><b>????????????</b></a></li>
							<li id="lefts"><a href="?sort=??????"><b>????????????</b></a></li>
							<li id="lefts"><a href="?sort=??????or???"><b>????????????</b></a></li>
						</ul>
					</div>
		        </article>
		    </div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	    <div id='productDetail'></div>
	</body>
</html>
