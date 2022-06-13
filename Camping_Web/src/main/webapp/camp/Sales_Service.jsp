<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>CAMP</title>
		<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/camp.css" />
		<script type="text/javascript" src="../jquery.js"></script>

		<style>
			#main {
				background: #e9e9e9;
			}
			#demo {
				border: 1px solid #a9a9a9;
				background: #ffffff;
				padding: 5% 10%;
			}
			.main {
				width: 100%;
				padding: 10% 20%;
				margin-top: 25px;
			}
			h2	{
				width: 200px;
				height: 30px;
				border: none;
				border-left: 4px solid #C39D6F;
				padding-left: 10px;
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
		    	<div class="main">
					<div id="demo">
					<h2>售後服務</h2>
						<h3>
								<li>公司貨保固政策為何?</li>
							<br>
							凡購買偉盟公司所代理之Coleman商品，自購買日起的一年內享有原廠瑕疵商品免費更換零件及維修服務(若為人為損壞需另收取維修費用)。一年保固期間限於自第一次購買日起計算，且不得轉讓保固期限。睡墊/氣墊床/充氣床商品提供一個月保固，背包商品恕無提供保固服務。請記得保留原始購買單據，以提供原始購買日期之證明。(帳篷類商品另有提供公司貨保證卡，請填妥購買資料及個人基本資料，以做為購買公司貨之證明)<br>
							<br>
							    <li>我要如何加入會員呢?</li>
							<br>
							凡購買公司貨的帳篷、網屋、天幕等，即可獲得一張公司貨保證卡。只要填寫好會員資料並蓋好經銷店章後，將會員資料表對折黏貼後寄回公司即可(已付免貼郵票)。<br>
							<br>
							    <li>瑕疵商品判斷及後續處理?</li>
							<br>
							瑕疵商品之認定以本公司或原廠規範為準，並依維修物件之實際狀況，判斷是否屬於新品瑕疵。細微汙損或刮傷、線頭或輕微脫線等不影響商品外觀、使用功能，或原廠於商品有特別標示說明者，皆不屬於瑕疵商品（如：營柱金屬部位些微刮傷、布面髒污可清除者或天然木質所產生的裂紋及凹洞等皆不屬於瑕疵商品）。維修判斷如有任何疑義，將統一以本公司維修部解釋為主，會員不得有任何異議。<br>
							<br>
							非人為使用所造成的商品瑕疵，公司將以換貨服務處理，其優先順序如下:<br>
							<br>
							    若瑕疵組件，為可更換式(如營柱、燈罩、烤肉網或收納袋等)且更換後不影響原商品組裝樣貌及功能者，將以無瑕疵組件來進行瑕疵更換。<br>
							    若沒有無瑕疵組件可更換，將以全新完整商品來進行瑕疵更換。<br>
							    若沒有全新無瑕疵商品可更換時，將予以退貨處理。<br>
							<br>
							非人為使用所造成的商品瑕疵，所產生的換貨或退貨之運費將由公司全額負擔。<br>
							<br>
							    <li>維修及瑕疵商品要送去何處維修處理呢?</li>
							<br>
							    任何維修及瑕疵商品， 請送回原購買經銷商，委請負責處理。<br>
							    若是維修氣化燈爐，請先把燃料清除以及玻璃燈罩取下來，避免運送過程發生危險。<br>
							<br>
							    <li>我要如何判斷商品是否為偉盟公司貨呢?</li>
							<br>
							    請認明商品外包裝上是否貼有”偉盟國際”字樣的價格說明標籤貼紙，若有才是偉盟公司貨。<br>
							    氣化燈爐及瓦斯燈爐商品本身會有偉盟國際的圓形標籤，以示證明為偉盟公司貨。<br>
							    購買帳篷、網屋及天幕時，請確認是否有公司貨保證卡。<br>
							    請於官網所認可之授權經銷商或通路購買。<br>
							<br>
							    <li>於網路上購買之商品要如何維修或瑕疵處理?</li>
							<br>
							    請先確認是否為偉盟公司貨。(請參閱第五點)<br>
							    若是公司貨，請洽詢購買電商平台提供出貨經銷商資料。再透過出貨經銷商協助處理維修品及瑕疵品。<br>
							    非偉盟公司貨(含購自日本)，本公司不予處理或負擔保固責任。<br>
							<br>
							    <li>如何得知維修費用?</li>
							<br>
							    本公司在維修商品前會給予報價。詢問是否接受報價，若同意後再予以維修。若想加快維修速度，可於顧客服務單上註明「維修金額在多少元以下時，可直接進行維修不需報價」。<br>
							<br>
							    <li>送修商品需多少維修天數?</li>
							<br>
							    正常情況時，本公司收到維修件後至寄出維修件，所需天數大約7個工作天數。車縫件所需天數則為14個工作天。若遇特殊工作期間，維修天數則可能會再延後。<br>
							<br>    
							    <li>為何於美系量販店購買之商品不予維修?</li>
							<br>
							    偉盟公司貨為日規商品，只在官網上所認可之授權經銷店舖、電商平台及百貨專櫃銷售。而美系量販店自行進口之商品為美規商品，僅適合在量販店銷售。因此既非偉盟公司貨，且規格完全不同，當然無法予以維修。<br>

						</h3>
					</div>
				</div>	
		    </div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>
