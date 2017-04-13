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

<style>
body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

table {
	height: 100px;
	margin: auto;
	text-align: center;
}
#title {
	text-align: left;
	font-size: 30px;
	padding: 15px;
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
			class="w3-container w3-light-grey  w3-main w3-center w3-row w3-white w3-padding-32 w3-padding-large" 
			style="margin-left: 25px;margin-right:25px;margin-top: 20px;margin-bottom: 20px">
						
					
			
			<div class="w3-panel w3-border-bottom w3-border-dark-gray " align="left">
				<b id="title">
					회원가입
				</b>
			</div> 
							
			<div class="w3-content w3-justify"   style="max-width: 900px">
			
		<!-- join grid -->
		<div class="w3-container w3-center w3-text-light-grey w3-padding-48" id="about">
		<div class="w3-row">
		<div class="w3-row-padding" style="margin: 0 -16px">
		<div class="w3-half w3-margin-bottom">
		<ul class="w3-ul w3-white w3-center ">
			<li class="w3-black w3-xlarge w3-padding-32 "><b>
			<font color="white">판매자</font></b></li>
			<li class="w3-padding-16"><h3>내 작품을 알리고 싶다면</h3>
				<p class="w3-opacity" style="text-align: center">
					당신이 손수 만든 작품은 상대방에게 알리고 싶으십니까? <br>
					혹은 복잡하지 않고 보다 손 쉽게	돈을 벌고 싶으십니까? <br>
					그렇다면 저희 바이핸드에 메이커(판매자) 에 <br>
					등록을 추천 합니다.<br>
					지금 당장 가입해 당신이 전에 느끼지 못한 경험을 하세요!
				</p></li>
			<li class="w3-light-white w3-padding-24"><a href="joinFormMaker.jsp">
			<button class="w3-button w3-light-grey w3-padding-large">Sign Up</button></a></li>
		</ul>
		</div>
		
		<div class="w3-half">
			<ul class="w3-ul w3-white w3-center ">
				<li class="w3-black w3-xlarge w3-padding-32"><b><font color="white">구매자</font></b></li>
				<li class="w3-padding-16">
					<h3>특별한 제품을 원한다면</h3>
					<p class="w3-opacity" style="text-align: center">
						한번도 보지 못한 제품을 원하십니까? <br>
						당신만에 특별한 악세사리를 원하십니까? <br>
						그렇다면 저희 바이핸드에 바이어(구매자) 에 <br>
						등록을 추천 합니다. <br>
						지금 당장 가입하여 모두에게 당신의 유니크을 보여 주세요!
					</p>
				</li>
				<li class="w3-light-white w3-padding-24"><a
					href="joinFormBuyer.jsp">
						<button class="w3-button w3-light-grey w3-padding-large">Sign
							Up</button>
				</a></li>
			</ul>
		</div>
	</div>
	</div>
	</div>
	</div>
</div>
</div>
</body>
</html>
