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
			article{text-align: center; min-width: 70vh}
			
			#main > article {
				margin: 5px;
				padding: 5px;
				border-radius: 5pt;
				width: 600px;
				flex-grow: 3;
				margin: 180px auto 0px auto;
			}
			
			.text {
				padding-top: 20px;
				text-align: center;
				font-size: 24px;
			}
			
			.tent {
				position: relative;
				margin-top: 20px;
			}
			.furniture {
				top: 0px;
				left: 18%;
				position: absolute;
			}
			.sleeping {
				top: 0px;
				right: 18%;
				position: absolute;
			}
			.coolers {
				top: 180px;
				left: 18%;
				position: absolute;
			}
			.lighting {
				top: 180px;
				right: 18%;
				position: absolute;
			}
			.ne {
				position: relative;
			}
			.news {
				margin-top: 20px;
			}
			.new {
				width: 350px;
				text-align:left;
				font-size: 15px;
				margin: 0px auto;
			}
			.newtt {
				text-align:left;
				font-size: 18px;
			}
			.newtext {
				text-align:left;
				font-size: 15px;
			}
			.jo {
				top: 0px;
				right: 18%;
				position: absolute;
			}
			.join {
				width: 350px;
				text-align:left;
				font-size: 15px;
				margin: 0px auto;
			}
			.jointt {
				text-align:left;
				font-size: 18px;
			}
			.jointext {
				text-align:left;
				font-size: 15px;
			}
			.ac {
				top: 0px;
				left: 18%;
				position: absolute;
			}
			.activity {
				width: 350px;
				text-align:left;
				font-size: 15px;
				margin: 0px auto;
			}
			.activitytt {
				text-align:left;
				font-size: 18px;
			}
			.activitytext {
				text-align:left;
				font-size: 15px;
			}
			.video {
				width: 100%;
			}
			.video1 {
				width: 550px;
				height: 320px;
				margin: 20px 30px 20px 16%;
				float: left;
			}
			.video2 {
				width: 550px;
				height: 320px;
				margin: 20px 0px 20px 30px;
				float: left;
			}
			#outer{
				position: relative;
				width: 1099px;/*image width=600 height=600*/
				overflow: hidden;
				/* background-image: url(map.png); */
				margin: auto;
			}
			#small_img1 {
				position: relative;
				width: 4396px;/*image width=753x5=3765px*/
				display: flex;
			}
			#prev,#next{
				position:absolute;
				width:35px;
				color: #ffffff;
				cursor: pointer;
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
			#dots{
				width: 130px; /*(16+5x2)x5=130px*/
				margin: auto;
				display: flex;
			}
			.dot{
				width: 16px;
				height: 16px;
				background-color: gray;
				border-radius: 50%;
				margin: 5px;
			}
			.dot:nth-child(1){
				background-color: sienna;
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
			
			/* var index=1;
			var photoNum=4;
			$(document).ready(init);
			function init(){
				setInterval(nextImage,2000);
			}
			function nextImage(){
				if(index<photoNum){
					index++;
				}else{
					index=1;
				};
				$(".myImg").attr("src","images/首頁1/"+index+".png");
			} */
			
			var myInterval, index=0;
			$(document).ready(function init(){
					$(".dot,#next,#prev,selected").click(moveHandler);//run the same function
					myInterval = setTimeout(moveHandler, 3000);//initial timer
			});
			function moveHandler(e){
				clearInterval(myInterval);//reset timer
				myInterval = setTimeout(moveHandler, 3000);//set timeer
				$(".dot:eq("+index+")").css("backgroundColor","gray");//reset dot color
				if(this==window){	index++;//setInterval
				}else if($(this).attr("myIndex")){	index=Number($(this).attr("myIndex"));//.dot
				}else{	index+=Number($(this).attr("direction"));}// $#prev / #next
				if (index>3) index=0;//last image
				if (index<0) index=3;//first image
				$(".dot:eq("+index+")").css("backgroundColor","sienna");//set dot color
				$("#small_img1").stop().animate({"marginLeft":-index*1099+"px"},500);//image width=735px
				/* $("#outer").stop().animate({"backgroundPositionX":-index*200+"px"},1000); */
			}
			
		</script>
	</head>
	<body>
	    <%@ include file="/subviews/header.jsp" %>
		    <div id="main">
		        <article>
		        	<!-- <img class="myImg" src="images/首頁1/1.png"> -->
		        	<div id="outer">
						<div id="small_img1">
							<img src="images/首頁1/1.png">
							<img src="images/首頁1/2.png">
							<img src="images/首頁1/3.png">
							<img src="images/首頁1/4.png">
						</div>
						<div class="next" id="next" direction="1">&rsaquo;</div>
						<div class="prev" id="prev" direction="-1">&lsaquo;</div>
						<div id="dots">
							<div class="dot" myIndex="0"></div>
							<div class="dot" myIndex="1"></div>
							<div class="dot" myIndex="2"></div>
							<div class="dot" myIndex="3"></div>
						</div>
					</div>
		        	<div class="text">
		        		<span style="border-width: 3px; border-left-style:solid; border-right-style:solid; border-color: #f4a460; color: #696969; padding: 3px 20px; text-align: center;"><b>經典系列 ITEM CATEGORY</b></span>
			        		<div class="tent">
								<a href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=帳篷"><img src="images/經典系列/tent.png"></a>				
								<div class="furniture">
									<a href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=椅子"><img src="images/經典系列/furniture.png"></a>				
								</div>
								<div class="sleeping">
									<a href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=睡眠"><img src="images/經典系列/sleeping.png"></a>				
								</div>
								
								<div class="coolers">
									<a href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=保冷"><img src="images/經典系列/coolers.png"></a>				
								</div>
								<div class="lighting">
									<a href="<%= request.getContextPath() %>/camp/Product_ajax.jsp?sort=燈具"><img src="images/經典系列/lighting.png"></a>				
								</div>
							</div>
					</div>
		        	<div class="text">
		        		<span style="border-width: 3px; border-left-style:solid; border-right-style:solid; border-color: #f4a460; color: #696969; padding: 3px 20px; text-align: center;"><b>最新消息</b></span>
		        			<div class="ne">
		        				<div class="news">
			        				<a href=#><img src="images/最新消息/new.png"></a><br>
			        			</div>
				        		<div class="new">
			        				<div class="newtt"><a href=#><p><b>連假公告 | 1/31過年年假</b></p></a></div><br>
			        				<div class="newtext">
			        					向陽光借來十倍的璀璨照耀你的人生向幸福借來十倍的甜蜜填滿你的心靈...
									</div>
									<span style="float:left;">2021-12-20</span><a href=# style="float:right; color:#00bfff;">繼續閱讀...</a><br>
			        			</div>
		        			
			        			<div class="jo">
			        				<div class="joins">
				        				<a href=#><img src="images/最新消息/join.png"></a><br>
				        			</div>
					        		<div class="join">
				        				<div class="jointt"><a href=#><p><b>加入會員 獨享好康</b></p></a></div><br>
				        				<div class="jointext">
				        					我們了解生活上的壓力，每個月都有固定的開銷，為此會員帳號所累積...
										</div>
										<span style="float:left;">2021-12-20</span><a href=# style="float:right; color:#00bfff;">繼續閱讀...</a><br>
				        			</div>
			        			</div>
			        			<div class="ac">
			        				<div class="activitys">
				        				<a href=#><img src="images/最新消息/activity.png"></a><br>
				        			</div>
					        		<div class="activity">
				        				<div class="activitytt"><a href=#><p><b>2022 露營大會</b></p></a></div><br>
				        				<div class="activitytext">
				        					誠摯邀請各位會員，與我們一同前往露營區，與美麗的大自然為伍，感受自然...
										</div>
										<span style="float:left;">2021-12-20</span><a href=# style="float:right; color:#00bfff;">繼續閱讀...</a><br>
				        			</div>
			        			</div>
		        			</div>
		        			
		        	</div>
		        	<div class="text">
		        		<span style="border-width: 3px; border-left-style:solid; border-right-style:solid; border-color: #f4a460; color: #696969; padding: 3px 20px; text-align: center;"><b>影音分享</b></span>
		        		<div class="video">
		        			<div class="video1">		        			
		        				<iframe width=100% height=100% src="https://www.youtube.com/embed/Dcf4f7sI0ls" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		        			</div>
		        			<div class="video2">
		        				<iframe width=100% height=100% src="https://www.youtube.com/embed/P4IpUhi9mgY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		        			</div>
		        		</div>
		        	</div>
		        </article>
		    </div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>
