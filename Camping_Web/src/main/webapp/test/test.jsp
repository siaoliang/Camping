<%@ page pageEncoding="UTF-8"%>
<%-- js --%>
window.onload = function(){
				//1.獲取標籤
				var product = document.getElementById("product");
				var product_all = document.getElementById("product_all");
				var allBoxs = product_all.children;
				var next = document.getElementById("next");
				var prev = document.getElementById("prev");
				var slider = document.getElementById("slider");
				//2.動態創建索引
				for(var i = 0; i < allBoxs.length; i++){
					var span = document.createElement("span");
					if(i === 0){
						span.className = "slider_icon current"
					}else{
						span.className = "slider_icon"
					}
					span.innerText = i + 1;
					slider.appendChild(span);
				}
			}
<%-- css --%>
.slider {
				width: 600px;
				height: 40px;
				text-align: center;
				color: #fff;
				font-weight: 700;
				z-index: 5;
				position: absolute;
				bottom: 0;
				background-color: rgb(0,0,0,.5);
				cursor: pointer;
			}