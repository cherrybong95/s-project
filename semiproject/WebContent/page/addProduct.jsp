<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#addForm").submit(function() {
			return confirm("상품을 등록하시겠습니까?");
		});
	});
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}

</script>

<style type="text/css">
body, h1, h2, h3, h4, h5, h6, .w3-wide {
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
	<div class="w3-main" style="margin-left: 250px" id="about">
	<!-- Push down content on small screens --> 
	<div class="w3-hide-large" style="margin-top: 83px"></div>
		<div class="w3-container w3-main w3-center w3-row w3-white w3-padding-32 w3-padding-large" style="margin-left: 25px;margin-right:25px;margin-top: 20px;margin-bottom: 20px">
			<div class="w3-panel  w3-border-bottom w3-border-dark-gray" id="title">
				
					<b>Register Product</b>
				
			</div>
			<br> <br> <br>
			<div class="w3-content w3-justify" style="max-width: 600px">	
			
		<h4>Product Name &nbsp;-&nbsp;<small><b>${requestScope.productDetail.pname }</b></small></h4>
		<p>
  		<form action="${pageContext.request.contextPath}/DispatcherServlet?command=addProduct" method="post" enctype="multipart/form-data" id="addForm" onsubmit="return checkForm()">
			상품명 : <input type="text" class="form-control"  name="pname" required="required" placeholder="Enter 상품명"><br><br>
			가격 : <input type="text" class="form-control" name="price" required="required" placeholder="숫자로 입력"><br><br>
			등록수량 : <input type="text" class="form-control" name="total_amount" required="required" placeholder="숫자로 입력"><br><br>
			상품설명 : <textarea rows="3" cols="30" class="form-control" name="simple_info"required="required" placeholder="상품 설명"></textarea><br><br>
			상품이미지 : <input type="file" name="file" required="required" ><br><br>
			<input type="submit" class="w3-button w3-block w3-black w3-margin-bottom" value="등록하기" >
		</form>
	</div>
	</div>
	</div>
</body>
</html>