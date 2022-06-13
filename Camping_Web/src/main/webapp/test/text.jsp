<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script type="text/javascript" src="../jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
//獲得文字框物件
var t = $("#text_box");
//初始化數量為1,並失效減
$('#min').attr('disabled',true);
    //數量增加操作
    $("#add").click(function(){   
    	alert("123")
        // 給獲取的val加上絕對值，避免出現負數
        t.val(Math.abs(parseInt(t.val()))+1);
        if (parseInt(t.val())!=1){
        $('#min').attr('disabled',false);
        };
    }) 
    //數量減少操作
    $("#min").click(function(){
    	alert("123")
    t.val(Math.abs(parseInt(t.val()))-1);
    if (parseInt(t.val())==1){
    $('#min').attr('disabled',true);
    };
    })

});
</script>
</head>
<body>
<input id="min" name="" type="button" value="-" />  
<input id="text_box" name="" type="text" value="1" style="width:30px;text-align: center"/>  
<input id="add" name="" type="button" value="+" /> 
</body>
</html>