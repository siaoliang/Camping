<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CAMP</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/camp.css" />
<script type="text/javascript" src="../jquery.js"></script>
	<style>

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
	<div>
		
	</div>
	<button type="button" id="backTop" class="toTop" style="box-shadow: 3px 3px 12px"></button>
<%@ include file="/subviews/footer.jsp" %>
</body>
</html>