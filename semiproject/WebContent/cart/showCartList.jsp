<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif;
	'
}

body, h1, h2, h3, h4, h5, h6,b, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

.w3-one img {
	width: 400px;
	height: 300px;
}

.w3-one {
	position: relative;
	display: block;
}

.w3-third img {
	margin-bottom: -6px;
	opacity: 0.7;
	cursor: pointer;
}

.w3-one:hover .overlay {
	opacity: 0.5;
}

.w3-one:hover img {
	opacity: 1;
}

.overlay {
	dispaly: block;
	position: absolute;
	top: 70%;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: black;
	opacity: 0.0;
	transition: .5s ease;
}

.txtOverLay {
	color: white;
	position: absolute;
	font-size: 0.875em;
	
}
s{
 color: solid-black
	
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
	   	$(".deleteCart").click(function(){
		   //alert($(this).parent().parent().children().eq(0).text());
		   	var pno=$(this).parent().parent().children().eq(0).text();
		   	alert(pno);
		   	if(confirm("상품을 삭제하시겠습니까?")){
			   	location.href="${pageContext.request.contextPath}/DispatcherServlet?command=deleteCart&pno="+pno;
		   	}
	   	});

	   var price="";
	   var amount="";
	   
	   $("#btn").click(function(){ 

		   price=$("#price").text(); 
		   amount=$("#amount").val(); 

			$("#total_price").text(parseInt(price)*amount); 
			$("#final_amount").val(amount);
	   });
	   
	   $("#buy").on("click",function(){
		  
		   if($("#check").is(":checked") == false){
				alert("주문할 상품을 선택하세요");
				return false;
		   }else{
				if($("#final_amount").val()!=$("#amount").val()){
					alert("수량 적용버튼을 누르세요");
			   		return false;
			   }else{
				   var checkedNum="";
				   $("input:checkbox:checked").each(function(){ 
					   checkedNum=$(this).parent().text();
			  		 });
			   }//else
		   }//큰 else
	   });//buy
   });//ready
   
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}
 
	function checkForm(){
		var checkedForm=document.cartListForm;
		var str="";
		for(var i=0;i<checkedForm.checked.length;i++){
			if(checkedForm.check[i].checked==true)
			str+=checkedForm.check[i].value;
		}
		
		if(str==""){
			alert("주문할 상품을 선택하세욧");
			return false;
		}
			
   }
	
</script>
<body class="w3-light-grey w3-content" style="max-width: 1600px">
	
	<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>

	<!-- Top menu on small screens -->
	<header class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
		<span class="w3-left w3-padding">바이핸드</span>
		<a href="javascript:void(0)" class="w3-right w3-button w3-white" onclick="w3_open()">☰</a>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<div class="w3-container w3-light-grey w3-text-dark-grey w3-padding-10 s" id="top" style="margin-left:300px">
		<span><h2><b>Shopping Cart</b></h2></span>
		<hr style="border: solid 3px white;">
	</div>

<div class="w3-container w3-light-grey w3-center w3-text-dark-grey w3-padding-32" id="about" >
	<div class="w3-content w3-justify" style="max-width:600px">
		<form id="checkForm" action="DispatcherServlet" name="cartListForm" onsubmit="return checkForm()">
		   <table>
		      <tr>
		      	<th>상품번호</th><th>상품명</th><th>수량</th><th>가격</th>
		      </tr>
					<c:forEach items="${requestScope.list}" var="list">
						<tr align="center">
							<td><input type="checkbox" id="check"><input type="hidden" name="pno" value="${list.pno}">${list.pno}</td><td>${list.pname}</td>
							<td><input type="text" id="amount" style="width:20pt;height:20pt;" >
							<input type="hidden" id="final_amount" name="amount" value="">
							<input type="button" id="btn" value="적용" style="width:40pt;height:20pt;"></td>
							<td id="price">${list.price}</td><td><input type="button" value="상품삭제" class="deleteCart"></td>
						<tr>
				    </c:forEach>
		
		     <c:choose>
				<c:when test="${requestScope.list!='[]'}">
					<tr>
						<td colspan="5" align="right">총 주문액 :<span id="total_price"></span></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><input type="submit" id="buy" value="구매하기"></td>
					</tr>
				</c:when>
				<c:otherwise>
				</c:otherwise>
		      </c:choose>
		   </table>
	      <input type="hidden" name="command" value="getPurchaseForm">
		  </form>
</div>
</div>
</body>
</html>