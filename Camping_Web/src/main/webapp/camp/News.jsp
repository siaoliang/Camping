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
			
			.main {
				width: 100%;
				padding: 10% 15%;
				margin-top: 25px;
			}
			h2	{
				width: 200px;
				height: 30px;
				border: none;
				border-left: 4px solid #C39D6F;
				padding-left: 10px;
			}
			.all {
				background-color: red;
			}
			.ne {
				background-color: White;
			}
			.news {
				margin-top: 20px;
			}
			.new {
				width: 350px;
				font-size: 15px;
				margin: 0px auto;
			}
			.newtt {
				font-size: 18px;
			}
			.newtext {
				font-size: 15px;
			}
			.jo {
				background-color: green;
			}
			.join {
				width: 350px;
				font-size: 15px;
				margin: 0px auto;
			}
			.jointt {
				font-size: 18px;
			}
			.jointext {
				font-size: 15px;
			}
			.ac {
				background-color: blue;
			}
			.activity {
				width: 350px;
				font-size: 15px;
				margin: 0px auto;
			}
			.activitytt {
				font-size: 18px;
			}
			.activitytext {
				font-size: 15px;
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
					<h2>最新消息</h2>
						<div class="all">
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
		    </div>
		    <button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
	    <%@ include file="/subviews/footer.jsp" %>
	</body>
</html>
