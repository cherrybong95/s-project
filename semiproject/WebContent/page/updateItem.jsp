
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif;
	'
}

body, h1, h2, h3, h4, h5, h6, b, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#updateForm").click(function() {
			if(isNaN($("#price").val())){
				alert("숫자로 입력해 주세요");
				return false;
			} else {	 
				return confirm("수정하시겠습니까?");
			}		
		});
	});//ready

</script>
<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main" style="margin-left: 300px">
		<div class="w3-container w3-light-grey w3-padding-32 w3-padding-large">
			<div class="w3-panel w3-border-top w3-border-bottom w3-border-dark-gray">
				<h1 align="center">
					<b><i>상품 수정하기</i></b>
				</h1>
			</div>
			<br> <br> <br>
			<div class="w3-content w3-justify w3-center"   style="max-width: 600px">
			<form action="DispatcherServlet?command=productUpdate" method="post">
				<table class="table">
					<tr>
						<th>상품번호</th>
						<td>
							<input type="text" name="pno" class="form-control" value="${requestScope.productVO.pno }" readonly>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>
							<input type="text" name="pname" class="form-control"  value="${requestScope.productVO.pname }" required="required">
						</td>
					</tr>
					<tr>
						<th>상품 이미지</th>
						<td>
							<img src="${requestScope.productVO.detail_info }" width="180px" height="150px">
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>
							<input type="text" name="price" size="30" id="price" class="form-control"  value="${requestScope.productVO.price }" required="required">
						</td>
					</tr>
					<tr>
						<th>수량</th>
						<td>
							<input type="text" name="total_amount" size="30" class="form-control" value="${requestScope.productVO.total_amount }" required="required">
						</td>
					</tr>
					<tr>
						<th>상품 설명</th>
						<td>
							<textarea rows="3" cols="30" name="simple_info" required="required" class="form-control" >${requestScope.productVO.simple_info }</textarea>
						</td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<input type="submit"class="w3-button w3-block w3-black w3-margin-bottom" value="수정하기" id="updateForm" style="max-width: 150px">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
</body>
</html>

