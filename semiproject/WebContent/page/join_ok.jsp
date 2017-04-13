<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}


table {
	height: 100px;
	margin: auto;
	text-align: center;
}
</style>
<script type="text/javascript">
function w3_open() {
	document.getElementById("mySidebar").style.display = "block";
	document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidebar").style.display = "none";
	document.getElementById("myOverlay").style.display = "none";
}

</script>
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
	<div class="w3-main " style="margin-left: 250px" id="about">
	<!-- Push down content on small screens -->
	<div class="w3-hide-large" style="margin-top: 83px"></div>

			<div 
			class="w3-container  w3-main w3-center w3-row w3-white w3-padding-32 w3-padding-large" 
			style="margin-left: 25px;margin-right:25px;margin-top: 20px;margin-bottom: 20px">
						
					
			
			
		<!-- join grid -->
		<div class="w3-row">
			<c:choose>
				<c:when test="${sessionScope.joinVO.mcode ==1}">
					<h1 align="center">
						<b>판매자 ${sessionScope.joinVO.maker_name }님 회원가입이 완료되었습니다</b>
					</h1><br><br><br>
					<center>
						<a href="../index.jsp"><button type="button" class="btn btn-info btn-lg ">홈으로</button></a>
					</center>
				</c:when>
				<c:when test="${sessionScope.joinVO.mcode ==2}">
					<h1 align="center">
						<b>구매자 ${sessionScope.joinVO.buyer_name }님 회원가입이 완료되었습니다</b>
					</h1><br><br><br>
					<center>
						<a href="../index.jsp"><button type="button" class="btn btn-info btn-lg ">홈으로</button></a>
					</center>
				</c:when>
			</c:choose>
		</div>
		</div>
		</div>
</body>
</html>