

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

<style>
body, h1, h2, h3, h4, h5, h6, b, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

table, td, th {
	border: 1px solid #ddd;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 15px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
	   	$(".deleteCart").click(function(){
		   //alert($(this).parent().parent().children().eq(0).text());
		   	var pno=$(this).parent().parent().children().eq(0).text();
		   	if(confirm("상품을 삭제하시겠습니까?")){
			   	location.href="${pageContext.request.contextPath}/DispatcherServlet?command=deleteCart&pno="+pno;
		   	}
	   	});

	   var price="";
	   var amount="";
	   
	   $("#btn").click(function(){  //수량버튼 적용 클릭 시
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
				if($("#final_amount").val()!=$("#amount").val()){ //수량값을 입력해놓고 적용 안누를 떄
					alert("수량 적용버튼을 누르세요");
			   		return false;
			   }else if($("#final_amount").val()=="0"||$("#final_amount").val()==""){ //수량값으로 0을 입력할 때
			   		alert("1개 이상의 수량을 적용하세욧!");
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

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>


	<div class="w3-main" style="margin-left: 300px">
		<div
			class="w3-container w3-light-grey w3-center w3-text-dark-grey w3-padding-32">
			<div
				class="w3-panel w3-border-top w3-border-bottom w3-border-dark-gray">
				<h1 align="center">
					<b><i>Shopping Cart</i></b>
				</h1>
			</div>
			<br> <br> <br>
			<div class="w3-content w3-justify" style="max-width: 600px">


				<form id="checkForm" action="DispatcherServlet" name="cartListForm"
					onsubmit="return checkForm()">
					<table>
						<tr>
							<th>상품번호</th>
							<th>상품명</th>
							<th>수량</th>
							<th>가격</th>
							<th></th>
						</tr>
						<c:forEach items="${requestScope.list}" var="list">
							<tr align="center">
								<td><input type="checkbox" id="check">
								<input type="hidden" name="pno" value="${list.pno}">${list.pno}</td>
								<td>${list.pname}</td>
								<td><input type="text" id="amount" style="width: 20pt; height: 20pt;" value="">
								<input type="hidden" id="final_amount" name="amount" value="">
								<input type="button" id="btn" value="적용" style="width: 40pt; height: 20pt;"></td>
								<td id="price">${list.price}</td>
								<td><input type="button" value="상품삭제" class="deleteCart"></td>
							<tr>
						</c:forEach>


						<c:choose>
							<c:when test="${requestScope.list!='[]'}">
								<tr>
									<td colspan="5" align="right">총 주문액 :<span
										id="total_price"></span></td>
								</tr>
								<tr>
									<td colspan="5" align="center"><input type="submit"
										id="buy" value="구매하기"></td>
								</tr>
							</c:when>
							</c:choose>
					</table>
					<input type="hidden" name="command" value="getPurchaseForm">
				</form>
			</div>
		</div>
	</div>
</body>
</html>