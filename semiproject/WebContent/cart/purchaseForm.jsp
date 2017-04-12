<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>주문하기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6,b, .w3-wide {
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
    padding: 10px;
}
</style>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#selectInfoForm :radio[name=selectInfo]").change(function(){ //라디오 버튼을 누를 때
				var checkedInfo=$("#selectInfoForm :radio[name=selectInfo]:checked").val(); //체크된 라디오 버튼 값을 넣음
				if(checkedInfo=="old"){ //기존 배송지 정보 가져올 때
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/DispatcherServlet",
						dataType:"json", //json으로 응답받을거니까 dataType을 지정한다.서버로부터 응답받는게 스트링인데 여기서는 json으로 응답받으려고. json으로 넘어 오는게 아니라서 
						data:"command=checkDestination", //종류가 3개 이상이 될 때에는 serialize()를 이용한다.
						success:function(data){
							//alert(data.buyer_name);
							$("#receiver").val(data.buyer_name);
							$("#destination").val(data.buyer_add);
							$("#contact").val(data.buyer_tel); 
						}
					});
				}else{ //사용자로부터 새롭게 입력받는 정보
					$("#receiver").val("");
					$("#destination").val("");
					$("#contact").val(""); 
				} 
			}); //라디오버튼 변경
		});//ready
	</script>
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">
	주문하기
	<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	
	<div class="w3-main" style="margin-left: 300px">
		<div class="w3-container w3-light-grey w3-padding-32 w3-padding-large">
			<div class="w3-panel w3-border-top w3-border-bottom w3-border-dark-gray">
				<h1 align="center">
					<b><i>PurchaseForm</i></b>
				</h1>
			</div>
			<br> <br> <br>
			<div class="w3-content w3-justify w3-center"   style="max-width: 800px">
	<table> <!-- 카트에서 주문할 상품 선택 후의 리스트 보여줌 -->
		<tr>
			<th>상품번호</th><th>상품명</th><th>가격</th><th>수량</th>
		</tr>
	
		<c:forEach items="${requestScope.purchaseList}" var="purchaseList">
			<tr align="center">
			<c:set value="${purchaseList.pno}" var="pno"/>
			<c:set value="${purchaseList.total_amount}" var="amount"/>
				<td>${pno}</td><td>${purchaseList.pname}</td>
				<td>${purchaseList.price*amount}</td><td>${amount}</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	<form id="selectInfoForm"> <!-- 기존 배송정보 가져올지 새로운 정보 입력할지 선택하는 라디오버튼 -->
		기존 배송지 정보<input type="radio" name="selectInfo" value="old">
		새로운 배송지 정보<input type="radio" name="selectInfo" value="new">
	</form>	
	<br>
	<form name="infoForm" method="post" action="DispatcherServlet?command=purchase&pno=${pno}&amount=${amount}">
		<table>
		<tr>
			<th>수령인</th><td> <input type="text" id="receiver" name="receiver" required="required"></input></td>
		</tr>
		<tr>
			<th>수령지 </th><td><input type="text" id="destination" name="destination" required="required"></input></td>
		</tr>
		<tr>
			<th>전화번호</th><td> <input type="text" id="contact" name="contact" required="required"></input></td>
		</tr>
		</table>
		<br>
	<input type="submit" id="buy" class="w3-button w3-block w3-black "value="주문완료" size="5">
	</form>
	</div>
	</div>
	</div>
</body>

</html>