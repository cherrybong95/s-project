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
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#addForm").submit(function(){
	return confirm("상품을 등록하시겠습니까?");
	});
	
});


</script>
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

<div class="w3-container w3-light-grey w3-text-dark-grey w3-padding-10 s" id="top" style="margin-left:300px">
	<span >
<h2><b>Regist Product</b></h2>
<hr style="border: solid 3px white;">
</span>
</div>

<div class="w3-container w3-light-grey w3-center w3-text-dark-grey w3-padding-32" id="about" >

    
  
    <div class="w3-content w3-justify" style="max-width:600px">
      <h4>Product Name &nbsp;-&nbsp;<small><b>${requestScope.productDetail.pname }</b></small></h4>
      <p>
  
		<form action="${pageContext.request.contextPath}/DispatcherServlet?command=addProduct" method="post" enctype="multipart/form-data" id="addForm" onsubmit="return checkForm()">
			상품명 : <input type="text" class="form-control" name="pname" required="required" placeholder="Enter 상품명"><br><br>
			가격 : <input type="text" class="form-control" name="price" required="required" placeholder="숫자로 입력"><br><br>
			등록수량 : <input type="text" class="form-control" name="total_amount" required="required" placeholder="숫자로 입력"><br><br>
			상품설명 : <input type="text" class="form-control" name="simple_info"required="required" placeholder="상품 설명"><br><br>
			상품이미지 : <input type="file" name="file" required="required" ><br><br>
			<input type="submit" class="w3-button w3-block w3-black w3-margin-bottom" value="등록하기" >
			
			
		</form>
		
	
      
				
			</div>
		</div>






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
</body>
</html>