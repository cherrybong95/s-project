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
<script>
	// Script to open and close sidebar
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}

	// Modal Image Gallery
	function onClick(element) {
		document.getElementById("img01").src = element.src;
		document.getElementById("modal01").style.display = "block";
		var captionText = document.getElementById("caption");
		captionText.innerHTML = element.alt;
	}
</script>

<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif;
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

.w3-one img {
	width: 100%;
	height: 350px;
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
	top: 75%;
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

table {
	height: 100px;
	margin: auto;
	text-align: center;
}
</style>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

   	<!-- Sidebar/menu -->
   	<jsp:include page="../templet/left.jsp"></jsp:include>

   	<!-- Top menu on small screens -->
   	<header
    	class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
      	<span class="w3-left w3-padding">바이핸드</span> <a href="javascript:void(0)" class="w3-right w3-button w3-white" onclick="w3_open()">☰</a>
   	</header>

   	<!-- Overlay effect when opening sidebar on small screens -->
   	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>

   	<!-- !PAGE CONTENT! -->
   	<br><br><br><br><br>
	<div class="w3-main" style="margin-left: 300px">

      <!-- Push down content on small screens -->
      <div class="w3-hide-large" style="margin-top: 83px"></div>

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

		<!-- Modal for full size images on click-->
		<div id="modal01" class="w3-modal w3-black" style="padding-top: 0"
			onclick="this.style.display='none'">
			<span class="w3-button w3-black w3-xlarge w3-display-topright">×</span>
			<div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
				<img id="img01" class="w3-image">
				<p id="caption"></p>
			</div>
		</div>
	</div>
</body>
</html>