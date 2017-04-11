<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세 거래 정보</title>
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body, h1, h2, h3, h4, h5, h6,b, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

table, td, th {    
    border: 1px solid #ddd;
    text-align: center;
}

table {
    border-collapse: collapse;
    width: 70%;
}

th, td {
    padding: 15px;
}
.product{
	text-align: left;
	width: 380px;
}

.product_img{
	width:30%;
	height:130px;
	float: left; 
	padding: 10px;
}

#delivery th{
	width: 200px;
}
</style>
  
</head>
<body class="w3-light-grey w3-content" style="max-width: 1600px">
		<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>
	
		<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main" style="margin-left: 300px">
	<div class="w3-container w3-light-grey w3-padding-32 w3-padding-large">
	<div class="w3-panel w3-leftbar  w3-xxlarge w3-serif">
  	<p><b><i>Detail Order List</i></b></p>
	</div> 
	<table>
			<tr>
				<th>주문번호</th><td>${requestScope.tdto.tno}</td><th>구매날짜</th><td>${requestScope.tdto.tdate}</td>
			</tr>
			<tr>
				<th >배송처리상태</th><td colspan="3">${requestScope.tdto.pro_state}</td>
			</tr>
			<tr>
			<th>상품</th>
				<td colspan="3" class="product">
					<img class="product_img" src="${pageContext.request.contextPath}/img/안경.jpg"><br>
					상품번호 : ${requestScope.tdto.pvo.pno}<br>
					상품명 : ${requestScope.tdto.pvo.pname}<br>
					가격 : ${requestScope.tdto.pvo.price}<br>
					수량 : ${requestScope.tdto.amount}<br>
				</td>
			</tr>
			<tr>
				<th>총금액</th><td colspan="3">${requestScope.tdto.amount*requestScope.tdto.pvo.price}</td>
			</tr>				
		</table>
			<p></p>
			<table id="delivery" >
			<tr>
				<th>수령인</th><td>${requestScope.dvo.receiver}</td>
			</tr>
			<tr>
				<th>배송연락처</th><td>${requestScope.dvo.contact}</td>
			</tr>
			<tr>
				<th>배송지</th><td>${requestScope.dvo.destination}</td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>