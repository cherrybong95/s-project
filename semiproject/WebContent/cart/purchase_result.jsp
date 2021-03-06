<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>주문결과</title>
	
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
	font-size:small;
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
#title {
	text-align: left;
	font-size: 30px;
	padding: 15px;
}
</style>
	<title>주문하기</title>
	<jsp:include page="../templet/left.jsp"></jsp:include>
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
		
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
	</script>
</head>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

			<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>
<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
		<span class="w3-left w3-padding">바이핸드</span>
		<a	href="javascript:void(0)" class="w3-right w3-button w3-white" onclick="w3_open()">☰</a>
	</header>
	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 250px">
	<!-- Push down content on small screens -->
	<div class="w3-hide-large" style="margin-top: 83px"></div>

 
		<div class="w3-container w3-main w3-white w3-padding-32 w3-padding-large" style="margin-left: 25px;margin-right:25px;margin-top: 20px;margin-bottom: 20px">
			<div class="w3-panel  w3-border-bottom w3-border-dark-gray" id="title">
				
					<b>주문결과</b>
				
			</div>
			<div class="w3-content w3-justify w3-center"   style="max-width: 900px">
	
	<c:set value="${requestScope.tdto}" var="tdto"/> 
	<table>
		<tr align="center">

			<th>주문번호 : ${requestScope.tdto.tno}</th><th colspan="3">주문날짜 :${requestScope.tdto.tdate}</th>
		</tr>
		<tr align="center">
			<th>상품번호</th><th>상품명</th><th>수량</th><th>가격</th>
		</tr>
	
		<tr align="center">
			<td>${tdto.pvo.pno }</td><td>${tdto.pvo.pname }</td>
			<td>${tdto.amount}</td><td>${tdto.pvo.price*tdto.amount}</td>
			
		</tr>
		<tr align="center">
		<th >주문 상태</th><td colspan="3">${tdto.pro_state }</td>
		</tr>
			<tr align="center">
			<th >입금계좌번호</th><td colspan="3">${requestScope.tdto.maker_account}</td>
			</tr>
		<tr>
			<th colspan="4">배 송 정 보</th>
		</tr>
		<tr align="center">
			<th>수령인</th><th>수령지</th><th colspan="2">연락처</th>
		</tr>
		<tr align="center">
			<td>${tdto.delivery.receiver}</td><td>${tdto.delivery.destination}</td><td colspan="2">${tdto.delivery.contact}</td>
		</tr>
	</table>
		
	</div>
	</div>
	</div>
</body>

</html>