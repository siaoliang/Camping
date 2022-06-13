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
					<h2>購物說明</h2>
						<h3>
							-購物方式-<br>
							<br>
							註冊官網會員 → 將商品加入購物車 → 點選結帳 → 確認商品明細、商品數量 → 選擇付款方式、填寫訂購/配送資訊 → 訂單生成並完成付款 → 訂購成立，隔日起約3-5個工作天內配達商品（不含國定例假日）<br>
							    <li>首次購物請先加入官網會員，即可開始訂購商品。</li>
							    <li>提醒您，「商品加入購物車」或「下訂單未付款」，不代表取得購買資格或購買成功，無法為您保留庫存。訂單成立且成功付款後，方為完成訂購程序，出貨將以訂購完成時間為依據。</li>
							    <li>訂單送出後即無法修改，結帳前請確認商品明細與數量，如要更改訂單內容，請直接取消訂單並重新訂購。</li>
							    <li>下訂後1小時內需完成付款，逾時系統將自動取消訂單。</li>
							    <li>商品之配送時段僅供參考，實際到貨時間請依物流中心作業為準。</li>
							<br>
							-付款方式-<br>
							<br>
							官網提供多種付款方式供會員選擇，包括「線上刷卡（僅限台灣地區發行之VISA、Master Card、JCB）」、「LINE Pay」、「網路ATM」、「超商代碼 (單筆上限兩萬元」支付款項。當您選擇線上刷卡方式進行交易時，頁面將自動跳轉至第三方金流綠界科技系統的刷卡頁面進行操作，全程符合各項刷卡安全機制驗證，保障您的個人隱私資料。<br>
							※官網目前提供單筆訂單滿3,000可分3期、滿10,000可分6期之分期付款0利率服務，若有需要歡迎多加利用。各信用卡國際組織向本公司收取之手續費率可能隨時變更，本公司得隨時修訂並公告於官網上，修訂後之內容自公告時起生效。<br>
							※防詐騙提醒：近期詐騙案件頻傳，提醒您，本公司絕不會去電要求會員操作ATM解除分期付款！通常詐騙電話都有 " + " 號開頭，請勿輕易接聽具有 " + " 號的電話。若有任何疑慮請盡速與客服人員聯繫或撥打 165 防詐騙專線。<br>
							<br>
							-配送時間-<br>
							<br>
							於確認收款後，約3-5個工作天內 (不含例假日) 將商品遞送至指定地點。<br>
							國定假日及例假日不出貨。(如遇不可抗之因素，例如：颱風、地震及水災…等，將視當時狀況處理並將另行公告通知)<br>
							<br>
							<br>
							-配送狀態-<br>
							<br>
							點選「會員中心」之「訂單查詢」，即可查看訂單配送狀態。<br>
							本站商品配送區域僅限台灣本島地區，如訂購商品無法順利出貨或缺貨，我們將主動以E-mail通知您，並直接取消該缺貨之品項。原訂單中若有其他商品，我們將照常為您安排出貨，因此還請您放心並留意近期包裹的收(取)件。<br>
							<br>
							<br>
							-運費說明-<br>
							<br>
							本站僅提供「物流宅配」出貨。<br>
							單筆訂單滿2,000元，即享免運。<br>
							單筆訂單未滿2,000元，收取運費100元。<br>
							※由於出貨流程限制，恕無法為會員併單寄送商品，亦不得指定到貨日期／指定到貨時間／安排急件出貨／自行取貨等特殊要求。<br>
							<br>
							<br>
							-退換貨說明-<br>
							<br>
							    根據消費者保護法之規定，本站提供商品到貨7天內鑑賞期服務（含例假日），享有解約退貨之權利且無需負擔退貨運費。鑑賞期並非試用期，您所退回的商品必須為「全新未使用」狀態，且將商品包裝妥當並保持完整包裝，包含商品標示牌、主件、配件、內外包裝盒袋、贈品等，缺任一資料將影響退貨權利之行使，或須負擔毀壞之費用。若經判斷已有使用、異味、商品損毀等情況，恕不接受退貨。<br>
							    7天鑑賞期內僅限乙次退貨。計算方式如下：收貨日(含簽收)+7天，例如:1/1簽收到貨，1/8則為最後申請退貨日（含例假日）。<br>
							    退貨時請將商品(含原始彩盒及原始包裝袋)放回物流出貨用之包裝紙箱，避免將宅配單直接貼於原始彩盒及原始包裝袋。<br>
							    商品性質若屬無法退貨之商品，或收回後經判斷非全新未使用狀態，我們將拒絕退貨申請並將商品寄還給您，敬請見諒，還請於申請退貨時務必多加留意商品完整性。<br>
							    消耗性商品(如電子點火器、瓦斯罐、燈蕊等)及關係個人衛生商品(如枕頭、睡袋、餐具等)基於個人衛生及保障顧客權益，恕無法提供退換貨服務。<br>
							<br>
							<br>
							-退款流程時間-<br>
							<br>
							若需申請退貨，請至「訂單查詢」→「查看詳情」→「申請退貨」。<br>
							我們在收到退回商品並確認無誤後，將於7個工作天內(不含例假日)為您申請退款程序。<br>
							退款不包含運費、紅利點數。<br>
							如有任何疑問，請聯繫客服專線 02-2999-9520，我們將儘速為您服務。<br>
							<br>
							<br>
							-瑕疵商品服務注意事項-<br>
							<br>
							    非人為使用所造成的商品瑕疵，公司將以換貨服務處理，其優先順序如下:<br>
							    若瑕疵組件，為可更換式(如營柱、燈罩、烤肉網或收納袋等)且更換後不影響原商品組裝樣貌及功能者，將以無瑕疵組件來進行瑕疵更換。<br>
							    若沒有無瑕疵組件可更換，將以全新完整商品來進行瑕疵更換。<br>
							    ​若沒有全新無瑕疵商品可更換時，將予以退貨處理。<br>
							    非人為使用所造成的商品瑕疵，所產生的換貨或退貨之運費將由公司全額負擔。<br>
							    瑕疵商品之認定以公司或原廠規範為準。細微汙損或刮傷、線頭或輕微脫線、等不影響商品外觀、使用功能或原廠於商品有特別標示說明者，皆不屬於瑕疵商品。(營柱金屬部位些微刮傷、布面髒污可清除者或天然木質所產生的裂紋及凹洞等皆不屬於瑕疵商品)<br>
							<br>
							<br>
							-注意事項-<br>
							<br>
							下單前，請詳細閱讀購物須知，購買即表示同意官網之購物規則。<br>
							結帳後訂單無法做任何變更(顏色/款式..等)，如需取消訂單請聯繫客服，將有專人協助。<br>
							若經常性退貨買家，本賣場有權利將不再服務您，避免造成雙方困擾。<br>
						</h3>
					</div>
				</div>	
		    </div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>