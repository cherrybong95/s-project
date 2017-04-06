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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif;
	'
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
</style>
<body class="w3-light-grey w3-content" style="max-width: 1600px">


	<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
		<span class="w3-left w3-padding">바이핸드</span> <a
			href="javascript:void(0)" class="w3-right w3-button w3-white"
			onclick="w3_open()">☰</a>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 83px"></div>

		<!-- Photo grid -->
		<!-- <div class="w3-row">
			<div class="w3-third">
				<div class="w3-one">
					<img src="img/안경.jpg" style="width: 100%" onclick="onClick(this)"
						alt="A boy surrounded by beautiful nature">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
				<div class="w3-one">
					<img src="img/귀요미.jpg" style="width: 100%" onclick="onClick(this)"
						alt="What a beautiful scenery this sunset">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
				<div class="w3-one">
					<img src="img/팔찌.jpg" style="width: 100%" onclick="onClick(this)"
						alt="The Beach. Me. Alone. Beautiful">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
			</div>

			<div class="w3-third">
				<div class="w3-one">
					<img src="img/팔찌2.jpg" style="width: 100%" onclick="onClick(this)"
						alt="A boy surrounded by beautiful nature">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
				<div class="w3-one">
					<img src="img/명함지갑.jpg" style="width: 100%" onclick="onClick(this)"
						alt="What a beautiful scenery this sunset">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
				<div class="w3-one">
					<img src="img/상자.jpg" style="width: 100%" onclick="onClick(this)"
						alt="The Beach. Me. Alone. Beautiful">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
			</div>
			<div class="w3-third">
				<div class="w3-one">
					<img src="img/지갑.jpg" style="width: 100%" onclick="onClick(this)"
						alt="A boy surrounded by beautiful nature">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
				<div class="w3-one">
					<img src="img/신발.jpg" style="width: 100%" onclick="onClick(this)"
						alt="What a beautiful scenery this sunset">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
				<div class="w3-one">
					<img src="img/카드지갑.jpg" style="width: 100%" onclick="onClick(this)"
						alt="The Beach. Me. Alone. Beautiful">
					<div class="overlay">
						<div class="txtOverLay">
							&nbsp;&nbsp;&nbsp;상품
							<p>&nbsp; &nbsp;&nbsp;30000원</p>
							<p>&nbsp;&nbsp;&nbsp; 상품입니단~~~~</p>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		
<%-- 		${requestScope.productListVO.list} --%>


		<!-- Pagination -->
		<div class="w3-center w3-padding-32">
			<div class="w3-bar">
				<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a> <a
					href="#" class="w3-bar-item w3-black w3-button">1</a> <a href="#"
					class="w3-bar-item w3-button w3-hover-black">2</a> <a href="#"
					class="w3-bar-item w3-button w3-hover-black">3</a> <a href="#"
					class="w3-bar-item w3-button w3-hover-black">4</a> <a href="#"
					class="w3-bar-item w3-button w3-hover-black">»</a>
			</div>
		</div>

		<!-- Modal for full size images on click-->
		<div id="modal01" class="w3-modal w3-black" style="padding-top: 0"
			onclick="this.style.display='none'">
			<span class="w3-button w3-black w3-xlarge w3-display-topright">×</span>
			<div
				class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
				<img id="img01" class="w3-image">
				<p id="caption"></p>
			</div>
		</div>

		<!-- About section -->
		<div class="w3-container w3-dark-grey w3-center w3-text-light-grey w3-padding-32" id="about">
    <h3><b>About Us</b></h3>
    <img src="img/pk6_logo.jpg" alt="Me" class="w3-image w3-padding-32" width="400" height="450">
    <div class="w3-content w3-justify" style="max-width:600px">
      <h4>My Name &nbsp;<small>is 바이핸드</small></h4>
      <p>
		바이핸드는 핸드메이드 상품을 뜻하는 'by hand'와 핸드메이드 상품을 구매한다는 'buy hand'의 뜻으로
		PK-6에 의해 고안된 소비자와 생산자를 잇는 직거래 마켓입니다.<br>
		유니크한 아이템을 지금 바로 구매하세요!
      </p>
      <p>mail: example@example.com</p>
      <p>tel: 5353 35531</p>
      <hr class="w3-opacity">
      <h4 class="w3-padding-16">Technical Skills</h4>
      <p class="w3-wide">Photography</p>
      <div class="w3-white">
        <div class="w3-container w3-padding-small w3-center w3-grey" style="width:95%">95%</div>
      </div>
      <p class="w3-wide">Web Design</p>
      <div class="w3-white">
        <div class="w3-container w3-padding-small w3-center w3-grey" style="width:85%">85%</div>
      </div>
      <p class="w3-wide">Photoshop</p>
      <div class="w3-white">
        <div class="w3-container w3-padding-small w3-center w3-grey" style="width:80%">80%</div>
      </div>
      <!-- <p><button class="w3-button w3-light-grey w3-padding-large w3-margin-top w3-margin-bottom">Download Resume</button></p> -->
      <hr class="w3-opacity">

				<h4 class="w3-padding-16">How much I charge</h4>
				<div class="w3-row-padding" style="margin: 0 -16px">
					<div class="w3-half w3-margin-bottom">
						<ul
							class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
							<li class="w3-black w3-xlarge w3-padding-32">CONSUMER</li>

							<li class="w3-padding-16">
								<h2>$ 0</h2> <span class="w3-opacity">per month</span>
							</li>
							<li class="w3-light-grey w3-padding-24">
								<button class="w3-button w3-white w3-padding-large">Sign
									Up</button>
							</li>
						</ul>
					</div>

					<div class="w3-half">
						<ul
							class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
							<li class="w3-black w3-xlarge w3-padding-32">PRODUCER</li>

							<li class="w3-padding-16">
								<h2>$ 1</h2> <span class="w3-opacity">per month</span>
							</li>
							<li class="w3-light-grey w3-padding-24">
								<button class="w3-button w3-white w3-padding-large">Sign
									Up</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Login section -->
		
		
				
		
			<c:choose>
				<c:when test="${sessionScope.loginMvo==null }">
					<div class="w3-container w3-light-grey w3-padding-32 w3-padding-large"
			id="login">
			<div class="w3-content" style="max-width: 600px">
				<h4 class="w3-center">
					<b>Login</b>
				</h4>
				<p>Do you want to buy some unique items? Fill out the form and
					fill me in with the details :) I love meeting new people!</p>
				<form action="DispatcherServlet" method="post" target="_self" id="loginForm">
					<div class="w3-section">
						<label>Id</label> <input class="w3-input w3-border" type="text"
							name="Id" required>
					</div>
					<div class="w3-section">
						<label>Password</label> <input class="w3-input w3-border"
							type="text" name="Password" required>
					</div>

					<button type="submit"
						class="w3-button w3-block w3-black w3-margin-bottom">Login</button>
				</form>
			</div>
		</div>
				
				</c:when>
				<c:when test="${sessionScope.loginMvo!=null }">
					로그인했다잉
				
				</c:when>
			</c:choose>
	
		
	
			
		<!-- Footer -->
		<footer class="w3-container w3-padding-32 w3-grey">
			<div class="w3-row-padding">
				<div class="w3-third">
					<h3>INFO</h3>
					<p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo
						condimentum, porta lectus vitae, ultricies congue gravida diam non
						fringilla.</p>
				</div>

				<div class="w3-third">
					<h3>BLOG POSTS</h3>
					<ul class="w3-ul">
						<li class="w3-padding-16 w3-hover-black"><img
							src="/w3images/workshop.jpg" class="w3-left w3-margin-right"
							style="width: 50px"> <span class="w3-large">Lorem</span><br>
							<span>Sed mattis nunc</span></li>
						<li class="w3-padding-16 w3-hover-black"><img
							src="/w3images/gondol.jpg" class="w3-left w3-margin-right"
							style="width: 50px"> <span class="w3-large">Ipsum</span><br>
							<span>Praes tinci sed</span></li>
					</ul>
				</div>

				<div class="w3-third">
					<h3>POPULAR TAGS</h3>
					<p>
						<span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span
							class="w3-tag w3-dark-grey w3-small w3-margin-bottom">New
							York</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">London</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">IKEA</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">NORWAY</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">DIY</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Ideas</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Baby</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Family</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">News</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Clothing</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Shopping</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Sports</span>
						<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Games</span>
					</p>
				</div>
			</div>
		</footer>

		<div class="w3-black w3-center w3-padding-24">
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a>
		</div>

		<!-- End page content -->
	</div>

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


</body>
</html>