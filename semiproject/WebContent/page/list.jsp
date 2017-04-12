<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BY HAND, BUY HAND</title>
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
.w3-sidebar a {
	font-family: "Roboto", sans-serif;
	'
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
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
</style>

<script type="text/javascript">
	function checkForm() {
		var lf = document.loginForm;
		if (lf.mcode.value == 2) {
			location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=buyerLogin&Id=" + lf.Id.value + "&Password=" + lf.Password.value + "&mcode=" + lf.mcode.value;
		} else if (lf.mcode.value == 1) {
			location.href = "${pageContext.request.contextPath}/DispatcherServlet?command=makerLogin&Id="	+ lf.Id.value + "&Password="	+ lf.Password.value	+ "&mcode=" + lf.mcode.value;
		} else if (lf.mcode.value == "") {
			alert("판매자/구매자 선택해주세요");
		}
	}
	
	$(document).ready(function() {
		$("#sellerBtn").click(function() {
			$("#seller").prop("checked", true);
		});
		$("#buyerBtn").click(function() {
			$("#buyer").prop("checked", true);
		});
	});
	
	// Script to open and close sidebar
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
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 250px">

	<!-- Push down content on small screens -->
	<div class="w3-hide-large" style="margin-top: 83px"></div>

	<!-- Photo grid -->
	
	
	<%-- ${requestScope.productListVO.list}  --%>
	<%-- <img src="${requestScope.productListVO.list[1].detail_info}"> --%>
		
	<div class="w3-row">
		<c:forEach items="${requestScope.productListVO.list}" var="list">
		<div class="w3-third">
			<div class="w3-one">
				<a href="DispatcherServlet?command=showProductDetail&productNo=${list.pno}">
				<img src="${pageContext.request.contextPath}/${list.detail_info}" style="width: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature"> </a>
				<div class="overlay">
					<div class="txtOverLay">&nbsp;&nbsp;&nbsp;${list.pname}
						<p>&nbsp;&nbsp;&nbsp;${list.price}원</p>
						<p>&nbsp;&nbsp;&nbsp;${list.simple_info}</p>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>

	
	
	<!-- Pagination -->
	<div class="w3-center w3-padding-32">
		<div class="w3-bar">
		<c:set value="${requestScope.productListVO.pagingBean.nowPage}" var="nowPage"></c:set>
			<c:if test="${requestScope.productListVO.pagingBean.previousPageGroup==true}">
			<a href="DispatcherServlet?command=list&pageNo=${requestScope.productListVO.pagingBean.startPageOfPageGroup-1}" class="w3-bar-item w3-button w3-hover-black">«</a> 
			</c:if>
			<c:forEach begin="${requestScope.productListVO.pagingBean.startPageOfPageGroup}" end="${requestScope.productListVO.pagingBean.endPageOfPageGroup}" var="page" >
			<c:choose>
				<c:when test="${page==nowPage}">
					<b class="w3-bar-item w3-button w3-hover-black" >${page}</b>
				</c:when>	
				<c:otherwise>
					<a	href="DispatcherServlet?command=list&pageNo=${page}" class="w3-bar-item w3-button w3-hover-black" >${page}</a>
				</c:otherwise>	
			</c:choose>				
			</c:forEach>
			<c:if test="${requestScope.productListVO.pagingBean.nextPageGroup==true}">
			<a href="DispatcherServlet?command=list&pageNo=${requestScope.productListVO.pagingBean.endPageOfPageGroup+1}" class="w3-bar-item w3-button w3-hover-black">»</a> 
			</c:if>
		</div>
	</div>
	
	<!-- Modal for full size images on click-->
	<div id="modal01" class="w3-modal w3-black" style="padding-top: 0" onclick="this.style.display='none'">
		<span class="w3-button w3-black w3-xlarge w3-display-topright">×</span>
		<div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
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
      	
	<!-- <p><button class="w3-button w3-light-grey w3-padding-large w3-margin-top w3-margin-bottom">Download Resume</button></p> -->
	<hr class="w3-opacity">
	<h4 class="w3-padding-16">How many our member</h4>
		<div class="w3-row-padding" style="margin: 0 -16px">
			<div class="w3-half w3-margin-bottom">
				<ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
					<li class="w3-black w3-xlarge w3-padding-32">Buyer</li><br>
					<li class="w3-padding-16"><h2>${requestScope.BuyerMember }</h2> 
					<span class="w3-opacity">People</span></li>
					<li class="w3-light-grey w3-padding-24">
					<a href="page/joinSelect.jsp" style="text-decoration: none">
						<button class="w3-button w3-white w3-padding-large">Sign Up</button></a>
					</li>
				</ul>
			</div>
			<div class="w3-half">
				<ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
					<li class="w3-black w3-xlarge w3-padding-32">Maker</li>
					<li class="w3-padding-16"><br>
						<h2>${requestScope.MakerMember }</h2>
						
						 <span class="w3-opacity">People </span>
					</li>
					<li class="w3-light-grey w3-padding-24">
					<a href="page/joinSelect.jsp" style="text-decoration: none">
						<button class="w3-button w3-white w3-padding-large">Sign Up</button></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

	<!-- Login section -->
		<c:choose>
			<c:when test="${sessionScope.mvo==null }">
				<div class="w3-container w3-light-grey w3-padding-32 w3-padding-large" id="login">
					<div class="w3-content" style="max-width: 600px">
						<h4 class="w3-center">
							<b>Login</b>
						</h4>
						<p>Do you want to buy some unique items? Fill out the form and
							fill me in with the details :) I love meeting new people!</p>
						<form id="loginForm" name="loginForm"
							onsubmit="return checkForm()" method="post">
							<script src="//code.jquery.com/jquery.min.js"></script>
							<div class="w3-section" style="text-align: center">
								<b>
								<input type="button" class="w3-button w3-black w3-margin-bottom" id="sellerBtn" value="판매자"></b>&nbsp;&nbsp; 
								<input type="radio" name="mcode" value="1" id="seller">&nbsp;&nbsp; <b> 
								<input type="button" class="w3-button w3-grey w3-margin-bottom" id="buyerBtn" value="구매자">
								</b>&nbsp;&nbsp; <input type="radio" name="mcode" value="2" id="buyer"><br><br>
							</div>
							<div class="w3-section">
								<label>Id</label>
								<input class="w3-input w3-border" type="text" name="Id" required="required" class="form-control" >
							</div>
							<div class="w3-section">
								<label>Password</label>
								<input class="w3-input w3-border"	type="password" name="Password" required="required" class="form-control" >
							</div>
							<input type="button" class="w3-button w3-block w3-black w3-margin-bottom" value="Login" onclick="checkForm()">
						</form>
						<a href="page/joinSelect.jsp" style="text-decoration: none">
							<button class="w3-button w3-block w3-black w3-margin-bottom">Sign Up</button>
						</a>

					</div>
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		<!-- login section end -->

		<!-- Footer -->
		<!-- <footer class="w3-container w3-padding-32 w3-grey">
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
 -->
		<!-- End page content -->
	</div>

	<script>
	/* 	// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		} */
	</script>
</body>
</html>