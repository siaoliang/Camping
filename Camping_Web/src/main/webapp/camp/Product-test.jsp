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
				border: 1px solid #dcdcdc;
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
				height: 30px;
				border-left: 4px solid #C39D6F;
				padding-left: 10px;
				margin-left: 20px;
				margin-bottom: 0px;
			}
			#rank {
				max-width: 100%;
				margin: atuo;
				display: block;
			}
			.product {
				width: 260px;
				height: 350px;
				border: 1px solid #c0c0c0;
				border-radius: 5px;
				margin: 0px 10px 20px 20px;
				float:left;
				position: relative;
			}
			.title {
				border: none;
				font-size: 18px;
				padding: 10px;
				font-family: Microsoft JhengHei;
			}
			.price {
				position: absolute;
				left: 10px;
				bottom: 5px;
				font-size: 18px;
				color: #deb887;
				font-family: Microsoft JhengHei;
			}
			.product_images {
				width: 250px;
				height: 250px;
				margin: 5px;
				background: url(images/帳篷系列/Coleman人透氣圓頂露營帳/Coleman人透氣圓頂露營帳V.png) no-repeat;
				background-size: contain;
			}
			.product_images1 {
				width: 250px;
				height: 250px;
				margin: 5px;
				background: url(images/帳篷系列/ColemanBREATHE圓頂帳/ColemanBREATHE圓頂帳.png) no-repeat;
				background-size: contain;
			}
			.product_images2 {
				width: 250px;
				height: 250px;
				margin: 5px;
				background: url(images/帳篷系列/Coleman4S露營帳/Coleman4S露營帳.png) no-repeat;
				background-size: contain;
			}
			.buy {
				position: absolute;
				right: 10px;
				bottom: 5px;
			}
			
		</style>
		<script type="text/javascript">
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
									
		</script>
	</head>
	<body>
	    <%@ include file="/subviews/header.jsp" %>
		    <div id="main">
		        <aside>
		        	<h2>全部商品</h2>
					<br>
						<div id="rank">
							<div class="product">
								<div class="product_images">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>Coleman 4-6 人透氣圓頂露營帳V (入門套裝組)</b></a>
								</div>
								<span class="price"><b>NT$14999</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
							<div class="product">
								<div class="product_images1">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>ColemanBREATHE圓頂帳</b></a>
								</div>
								<span class="price"><b>NT$13333</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
							<div class="product">
								<div class="product_images2">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>Coleman4S露營帳</b></a>
								</div>
								<span class="price"><b>NT$12222</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
							<div class="product">
								<div class="product_images">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>Coleman 4-6 人透氣圓頂露營帳V (入門套裝組)</b></a>
								</div>
								<span class="price"><b>NT$14999</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
							<div class="product">
								<div class="product_images1">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>ColemanBREATHE圓頂帳</b></a>
								</div>
								<span class="price"><b>NT$13333</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
							<div class="product">
								<div class="product_images2">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>Coleman4S露營帳</b></a>
								</div>
								<span class="price"><b>NT$12222</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
							<div class="product">
								<div class="product_images">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>Coleman 4-6 人透氣圓頂露營帳V (入門套裝組)</b></a>
								</div>
								<span class="price"><b>NT$14999</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
							<div class="product">
								<div class="product_images1">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>ColemanBREATHE圓頂帳</b></a>
								</div>
								<span class="price"><b>NT$13333</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
							<div class="product">
								<div class="product_images2">
									<a href=#></a>
								</div>
								<div class="title">
									<a href=#><b>Coleman4S露營帳</b></a>
								</div>
								<span class="price"><b>NT$12222</b></span>
								<button class="buy"><b>加入購物車</b></button>
							</div>
						</div>
		        </aside>
		        <article>
		        	<div id="left" class="menu1">
						<ul>
							<li><a href=#><b>全部商品</b></a></li>
							<li><a href=#><b>帳篷系列</b></a></li>
							<li><a href=#><b>家具系列</b></a></li>
							<li><a href=#><b>燈具照明</b></a></li>
							<li><a href=#><b>爐具</b></a></li>
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
