<%@page import="src.camping.entity.Color"%>
<%@page import="src.camping.entity.Outlet"%>
<%@page import="src.camping.service.ProductService"%>
<%@page import="src.camping.entity.Product"%>
<%@page import="java.util.List"%>
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
				list-style: none;
			}
			
			#outer{
				position: relative;
				width: 600px;/*image width=600 height=600*/
				overflow: hidden;
				background-image: url(map.png);
				margin: auto;
			}
			#small_img1 {
				position:relative;
				width:3000px;/*image width=600x5=3000px*/
				display: flex;
			}
			#small_img img {
				border: 1px solid #dcdcdc;
			}
			.smallPic {
				width: 100px;
				height: 100px;
				padding: 2px;
				cursor:pointer;
			}
			.selected {
				width: 100px;
				height: 100px;
				background-color: #a0522d;
			}
			#prev,#next{
				position:absolute;
				width:35px;
				color: #696969;
				cursor:pointer;
				font-size: 6em;
				top: 220px;
				opacity: 0.7;
			}
			#prev{
				left:0px;
			}
			#next{
				right:0px;
			}
			#prev:hover,#next:hover{
				opacity: 0.9;
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
				float: left;
				padding: 6px 0px;
				max-width: 58.2%;
				min-width: 20%;
				text-align: center;
				font-size: 18px;
			}
			.btn {
				float: left;
				width: 20%;
				font-size: 27px;
				text-align: center;
			}
			.btn1 {
				float: left;
				width: 20%;
				font-size: 27px;
				text-align: center;
			}
			.btn_group1 {
				max-width: 100%;
				margin-top: 20px; 
			}
			
			#btn2 {
			    margin: 5px;
				width: 45%;
			    border: 1px solid #000000;
			    border-radius: 5px; 
			    color: #ffffff;
			    letter-spacing: 10px;
			    padding: 7px;
			    font-size: 15px;
			    font-weight:bold;
			    text-align: center;
			}
			.btn2:hover {
		    	background-color: #deb887;
			}
			.btn2 {
				background-color: #C39D6F;
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
			#colorStock {
				font-weight: bold;
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
			
			$(document).ready(function(){
				//獲得文字框物件
				var t = $("#quantity");
				//初始化數量為1,並失效減
				$('#min').attr('disabled',true);
			    //數量增加操作
			    $("#add").click(function(){   
			    	//alert("123")
			        // 給獲取的val加上絕對值，避免出現負數
			        t.val(Math.abs(parseInt(t.val()))+1);
			        if (parseInt(t.val())!=1){
			        	$('#min').attr('disabled',false);
			        };
			    }) 
				    //數量減少操作
			    $("#min").click(function(){
				    	//alert("123")
				    t.val(Math.abs(parseInt(t.val()))-1);
				    if (parseInt(t.val())==1){
				    	$('#min').attr('disabled',true);
				    };
			    })

			});
			
			var myInterval, index=0;
			$(document).ready(function init(){
					$(".smallPic,#next,#prev,selected").click(moveHandler);//run the same function
			});
			function moveHandler(e){
				$(".smallPic:eq("+index+")").css("backgroundColor","white");//reset dot color
				if(this==window){	index++;//setInterval
				}else if($(this).attr("myIndex")){	index=Number($(this).attr("myIndex"));//.dot
				}else{	index+=Number($(this).attr("direction"));}// $#prev / #next
				if (index>4) index=0;//last image
				if (index<0) index=4;//first image
				$(".smallPic:eq("+index+")").css("backgroundColor","sienna");//set dot color
				$("#small_img1").stop().animate({"marginLeft":-index*600+"px"},300);//image width=735px
			}
			
			$(document).ready(init);
			function init(){
				$(".smallPic").click(showHandler);
				$(".smallPic:first").addClass("selected");
			}
			function showHandler(){
				var image = $(this).attr("src")
				$("#small_img1").attr("src",image);
				$(".smallPic").removeClass("selected");
				$(this).addClass("selected");
			}
			
			function changeData(theObj){
				$("#colorStock").text("庫存量 :" + $(theObj).attr("title") + "個")
				//$(".photo").attr("src",$(theObj).attr("data-photo"));
				$("input[id='quantity']").attr("max", $(theObj).attr("data-stock"));
			}
			function submitCart(){
				//alert($("#cartForm").serialize());
				//alert(cartForm.submited);
				if(!cartForm.submited){
					$.ajax({
						url:$("#cartForm").attr("action")+"?ajax=",
						method:"POST",
						data:$("#cartForm").serialize()
					}).done(submitCartDoneHandler);
					return false; //false取消原來同步的submit功能 , true還原原來同步的submit功能(前面ajax要取消)
				}
			}
			
			function submitCartDoneHandler(data,status,xhr){
				//alert(data);
				$("#theCart").html(data);
				$(".cartQty").text(cartQty.totalQuantity);
			}
			
			
		</script>
	</head>
	<body>
	    <%@ include file="/subviews/header.jsp" %>
	    	<div id="main">
		        <article>
		        	<%
		        		String productId = request.getParameter("productId");
		        		Product p = null;
		        		if(productId!=null){
		        			ProductService pService = new ProductService();
		        			p = pService.getProductsById(productId);
		        		}
		        		
		        		if(p==null){
		        	%>
		        		<p>查無此商品(id=<%= productId %>)</p>
		        	<% }else{ %>
				<div id="outer">
					<div id="small_img1">
						<img src="<%= p.getPhotoUrl2() %>">
						<img src="<%= p.getPhotoUrl3() %>">
						<img src="<%= p.getPhotoUrl4() %>">
						<img src="<%= p.getPhotoUrl5() %>">
						<img src="<%= p.getPhotoUrl6() %>">
					</div>
					<div class="next" id="next" direction="1">&rsaquo;</div>
					<div class="prev" id="prev" direction="-1">&lsaquo;</div>
					<div id="small_img">
						<img class="smallPic" myIndex="0" src="<%= p.getPhotoUrl2() %>">
						<img class="smallPic" myIndex="1" src="<%= p.getPhotoUrl3() %>">
						<img class="smallPic" myIndex="2" src="<%= p.getPhotoUrl4() %>">
						<img class="smallPic" myIndex="3" src="<%= p.getPhotoUrl5() %>">
						<img class="smallPic" myIndex="4" src="<%= p.getPhotoUrl6() %>">
					</div>
				</div>
		        </article>
		        <aside>
		        	<form id="cartForm" action="add_to_cart.do" method="POST" onsubmit="return submitCart()">
		        	<input type="hidden" name="productId" value="<%= p.getId() %>">
		        	<h1><b><%= p.getName() %></b></h1>
		        	<h4 style="color:#808080;"><b>
		        	<%= p.getDescription() %>
		        	</b></h4>
					<strong class="sell_price"><b>建議售價</b></strong>
					<h1 style="color: #b8860b;"><b>NT$<%= p.getUnitPrice() %></b></h1>
					<% if(p.getColorsMapSize()>0){%>
					<label ><b>顏色:</b></label>
					<% for(Color color:p.getColors()){ %>
						<input type="radio" name="color" value="<%= color.getName() %>" title="<%= color.getStock() %>" data-stock="<%= color.getStock() %>" onclick="changeData(this)" required><label><b><%= color.getName() %>色</b></label>
						
						<% } %>
					<% } %>
					<br>
					<br>
					<div><span id="colorStock"></span></div>
					<br>
					<br>
					<div class="preferential">
						<h5><b>此商品優惠活動</b></h5>
						<p class="pt"><b>VIP折扣優惠 0% off</b></p>
					</div>
					<div class="btn_group">
						<div>
							<input id="min" type="button" class="btn" value="-">
						</div>
						<div>
							<input id="quantity" name="quantity" type="text" class="number" value="1" readonly>
						</div>
						<div>
							<input id="add" type="button" class="btn1" value="+">
						</div>
					</div>
					<br>
					<div class="btn_group1">
						<input id="btn2" class="btn2" type="submit" value="加入購物車">
						<input id="btn2" class="btn2" type="submit" value="立即購買" onclick="this.form.submited=true">
					</div>
				
					</form>
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
						<div id="selet2"></div>	
						<%-- <%
							String src =  new String();
							if(p.getVideo()==null){
								src=p.getPhotoUrl();
							
						%> --%>
        				<iframe width=100% height=100% src="<%= p.getVideo() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        				<%-- <img id="photo" src="<%= p.getPhotoUrl() %>">
        				<% } %> --%>
        			</div>
				<h2>商品規格</h2>
					<h3>
						<%= p.getFormat() %>
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
			<% } %>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>
<!-- style="clear:both" -->
