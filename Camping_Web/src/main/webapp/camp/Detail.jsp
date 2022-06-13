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
			article{text-align: center; min-width: 70vh; min-height: 70vh}
			
			#main > article,#main > aside{
				margin: 5px;
				padding: 5px;
				border-radius: 5pt;
			}
			#main > article {
				background-color: #ffffff;
				flex-grow: 0.2;
				margin: 190px auto 0px 15%;
			}
		
			#main > aside {
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
			li {
				list-style:none;
			}
			.product {
				position: relative;
				width: 600px;
				overflow: hidden;
			}
			.product_scroll {
				position: relative;
				height: 500px;
			}
			.product_all {
				position: relative;
				width: 3600px;
				left: -600px;
				bottom: 100px;
			}
			
			.product_scroll span {
				position: absolute;
				width: 25px;
				height: 50px;
				background: url(images/pointer.png) no-repeat;
				top: 50%;
				margin-top: -50px;
				cursor: pointer;
			}
			.product_scroll span.next {
				right: 0;
				background-position: -27px 2px;
			}
			.product_scroll span.prev {
				left: 0;
				background-position: 0px 2px;
			}
			
			#small_img img {
				border: 1px solid #dcdcdc;
			}
			.selected{
				border: 2px solid orange;
			}
			.sell_price {
				padding: 5px;
				background-color:#228b22;
				color:#ffffff;
			}
			.preferential {
				position: relative;
				height: 120px;
				background-color: #f5f5f5;
				padding: 5px;
			}
			h5	{
				border: none;
				border-left: 4px solid #C39D6F;
				padding: 5px 0px 0px 10px;
				font-size: 16px;
				margin: 0px;
			}
			.pt {
				color: #b8860b;
				padding-left: 15px;
			}
			.btn_group {
				margin: 5px;
				max-width: 45%;
				position: relative;
			}
			.number {
				position: absolute;
				left: 43px;
				padding: 9px 0px;
				max-width: 80%;
			}
			.btn {
				position: absolute;
				padding: 0px 5px;
				max-width: 20%;
			}
			.btn1 {
				right: 0px;
				position: absolute;
				padding: 0px 5px;
				max-width: 20%;
			}
			.btn_group1 {
				max-width: 100%;
				margin-top: 20px; 
			}
			.btn2 {
				margin: 5px;
				width: 45%;
			}
			.btn3 {
				margin: 5px;
				width: 45%;
			}
			button[type="btn2"]:hover {
		    	background-color: #deb887;
			}
			button[type="btn3"]:hover {
		    	background-color: #deb887;
			}
			button[type="btn2"],[type="btn3"] {
			    background-color: #C39D6F;
			    border: 1px solid #000000;
			    border-radius: 5px; 
			    color: #ffffff;
			    letter-spacing: 10px;
			    padding: 0px;
			    font-size: 15px;
			}
			.p_instruction {
				height: 40px;
			}
			#int1 {
				background-color: #dcdcdc;
				border: 1px solid #c0c0c0;
				width: 37%;
				margin-left: 12%;
				float: left;
				padding: 5px 0px;
			}
			#int2 {
				background-color: #dcdcdc;
				border: 1px solid #c0c0c0;
				width: 37%;
				float: left;
				padding: 5px 0px;
			}
			.introduce {
				text-align: center;
			}
			.introduce_p {
				margin: 0px 15%;
			}
			h2	{
				width: 200px;
				height: 30px;
				border: none;
				border-left: 4px solid #C39D6F;
				padding-left: 10px;
			}
			.video {
				width: 800px;
				height: 450px;
				margin: 20px 30px 20px 16%;
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
			$(document).ready(init);
			var index=1;
			function init(){
				$("#next").click(nextHandler);
				$("#prev").click(prevHandler);
				$(".smallPic").click(showHandler);
				$(".smallPic:first").addClass("selected");
				$("#product_all").append("<img src='images/帳篷系列/Coleman氣候達人BREATHE圓頂帳/4.png' />");
				for (var i=1; i<=4; i++){
					$("#product_all").append("<img src='images/帳篷系列/Coleman氣候達人BREATHE圓頂帳/"+i+".png' />");
				}
				$("#product_all").append("<img src='images/帳篷系列/Coleman氣候達人BREATHE圓頂帳/1.png' />");
			}
			
			function showHandler(event){
				var image = $(this).attr("src")
// 				alert(image)
				$("#product_all").attr("src",image);
				$(".smallPic").removeClass("selected");
				$(this).addClass("selected");
			}
			
			function nextHandler(event){
				index++;
				$("#info").text(index);
				if(index == 5){
					$("#product_all").animate({"left":-((index)*600)+"px"},300,png4Forward);
					index=1;
				}else{
					changePng();
				}
			}
			function png4Forward(){
				$("#product_all").css({"left":"-600px"});
			}
			function prevHandler(event){
				index--;
				$("#info").text(index);
				if(index == 0){
					$("#product_all").animate({"left":-((index)*600)+"px"},300,png4Back);
					index=4;
				}else{
					changePng();
				}
			}
			function png4Back(){
				$("#product_all").css({"left":"-2400px"});
			}
			function changePng(){
				$("#product_all").animate({"left":-((index)*600)+"px"},300);
			}
			
		</script>
	</head>
	<body>
	    <%@ include file="/subviews/header.jsp" %>
	    	<div id="main">
		        <article>
		        <div class="product" id="product">
		        	<div class="product_scroll" id="product_scroll">
		        		<div class="product_all" id="product_all">
						</div>
						<div id="info"></div>
						<span class="next" id="next"></span>
						<span class="prev" id="prev"></span>
					</div>
				</div>
				<div id="small_img">
					<div>
						<a href=#><img class="smallPic" src="images/帳篷系列/Coleman氣候達人BREATHE圓頂帳/縮圖/小1.png"></a>
						<a href=#><img class="smallPic" src="images/帳篷系列/Coleman氣候達人BREATHE圓頂帳/縮圖/小2.png"></a>
						<a href=#><img class="smallPic" src="images/帳篷系列/Coleman氣候達人BREATHE圓頂帳/縮圖/小3.png"></a>
						<a href=#><img class="smallPic" src="images/帳篷系列/Coleman氣候達人BREATHE圓頂帳/縮圖/小4.png"></a>
					</div>
				</div>
		        </article>
		        <aside>
		        	<h1><b>Coleman 氣候達人BREATHE圓頂帳</b></h1>
		        	<h4 style="color:#808080;"><b>
		        		最頂尖的達人系列，四季全天候戶外高機能款<br>
		        		讓帳篷內部更涼爽的舒適設計，特別強化透氣機能的270X270cm易搭設帳蓬<br>
						內帳採用棉混紡素材，使空氣能有效流通達到涼爽及減少結露效果<br>
						好搭設的簡單結構設計</b></h4>
					<strong class="sell_price"><b>建議售價</b></strong>
					<h1 style="color: #b8860b;"><b>NT$16500</b></h1>
					<br>
					<div class="preferential">
						<h5><b>此商品優惠活動</b></h5>
						<p class="pt"><b>VIP折扣優惠10% off</b></p>
					</div>
					<div class="btn_group">
						<button class="btn">
							<img src="images/minus1.png">
						</button>
						<input type="number" class="number" value="1">
						<button class="btn1">
							<img src="images/plus1.png">
						</button>
					</div>
					<br>
					<div class="btn_group1">
						<button class="btn2" type="btn2"><p><b>加入購物車</b></p></button>
						<button class="btn3" type="btn3"><p><b>立即購買</b></p></button>
					</div>
		        </aside>
		    </div>
		    <div class="p_instruction">
	        	<div class="instruction">
	        		<ul>
	        			<li><a class="introduce" href="#small_img"><div id="int1">商品介紹</div></a></li>
	        			<li><a class="introduce" href="#selet2"><div id="int2">商品規格</div></a></li>
	        		</ul>
	        	</div>
	        </div>
	        <div class="introduce_p">
				<h2>商品介紹</h2>
					<div class="video">		        			
        				<iframe width=100% height=100% src="https://www.youtube.com/embed/8-znUULmY2s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        			</div>
				<h2 id="selet2">商品規格</h2>
					<h3>
						耐水壓：約3,000mm（地板：約10,000mm）<br>
						人數：4～5人用<br>
						內帳尺寸：約270×270×高170cm<br>
						收納尺寸：約直徑26×74cm<br>
						重量：約9.8kg、本體／約5.7kg、營柱／約2.5kg、附屬配件／約1.6kg<br>
						材質：<br>
						外帳／75D聚酯塔夫塔布（UVPRO、鐵氟龍撥水、防水貼條、遮光PU防水）<br>
						內帳／棉質混紡聚酯纖 維、68D聚酯塔夫塔（撥水加工）<br>
						地板／210D聚酯牛津布（PU防水、防水貼條）<br>
						營柱／（主、前）鋁 合金約直徑12.8mm、（後簷）鋁合金約直徑9.3mm<br>
						規格：前庭、紗門、循環透氣窗、電線導口、紗網置 物袋、營燈掛勾<br>
						附屬配件：營釘、營繩、營鎚、收納袋<br>
					</h3>
				<h2>注意事項</h2>
					<h3>
						￭ 官網與門市之庫存/金流為獨立系統，恕不開放門市取貨/退換貨，歡迎使用網路購物，或直接前往全台實體通路購買。<br>
						￭ 官網提供單筆訂單滿3,000可分3期、滿10,000可分6期之刷卡分期零利率服務，歡迎多加利用。<br>
						￭ 下訂後請於1小時內完成付款，訂單成立且成功付款，方為完成訂購程序，逾時系統將自動取消訂單。訂購完畢隔日起約3-5個工作天內配達商品（不含國定例假日），恕不受理指定時間到貨/急件出貨/自行取貨。<br>
						￭ 請於收到商品7日內（含簽收日）立即確認商品狀態，本站依消保法規定之7日鑑賞期內提供1次免運退貨/瑕疵換貨服務。<br>
						￭ 鑑賞期非試用期，退換貨商品必須為「全新未使用」狀態 ，含商品/配件/吊牌/贈品/原廠包裝等。如經使用或有缺件、汙損情況概不接受退換，敬請見諒。<br>
						￭ 退貨時請以物流配送之包裝紙箱將商品回復原狀，或使用其他紙箱妥善包裝。請勿直接於商品原廠外盒/包裝上黏貼紙張、膠帶或書寫文字，<br>
						   如造成損壞、髒汙將影響退貨權益，損壞費用將由訂單退款扣抵。<br>
						￭ 商品圖因拍攝光線、環境，與螢幕顯示不同，顏色與實品存在些微差異，請依實際收到商品為準。<br>
						※如無法接受以上網路購物注意事項，建議直接前往實體門市或經銷通路購買商品，謝謝您的支持！<br>
					</h3>
			</div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>
<!-- style="clear:both" -->
