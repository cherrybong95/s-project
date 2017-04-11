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
</script>

<style type="text/css">
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

</style>

<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	
	
	<div class="w3-main" style="margin-left: 300px">
		<div class="w3-container w3-light-grey w3-padding-32 w3-padding-large">
			<div class="w3-panel w3-border-top w3-border-bottom w3-border-dark-gray">
				<h1 align="center">
					<b><i>Registe Product</i></b>
				</h1>
			</div>
			<br> <br> <br>
			<div class="w3-content w3-justify"   style="max-width: 500px">
			
		<h4>Product Name &nbsp;-&nbsp;<small><b>${requestScope.productDetail.pname }</b></small></h4>
		<p>
  		<form action="${pageContext.request.contextPath}/DispatcherServlet?command=addProduct" method="post" enctype="multipart/form-data" id="addForm" onsubmit="return checkForm()">
			상품명 : <input type="text" class="form-control"  name="pname" required="required" placeholder="Enter 상품명"><br><br>
			가격 : <input type="text" class="form-control" name="price" required="required" placeholder="숫자로 입력"><br><br>
			등록수량 : <input type="text" class="form-control" name="total_amount" required="required" placeholder="숫자로 입력"><br><br>
			상품설명 : <input type="text" class="form-control" name="simple_info"required="required" placeholder="상품 설명"><br><br>
			상품이미지 : <input type="file" name="file" required="required" ><br><br>
			<input type="submit" class="w3-button w3-block w3-black w3-margin-bottom" value="등록하기" >
		</form>
	</div>
	</div>
	</div>
</body>
</html>