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


<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<div class="w3-main" style="margin-left: 300px">
		<div
			class="w3-container w3-light-grey w3-center w3-text-dark-grey w3-padding-32">
			<div
				class="w3-panel w3-border-top w3-border-bottom w3-border-dark-gray">
				<h1 align="center">
					<b><i>Delete Account</i></b>
				</h1>
			</div>
			<br> <br> <br>
			<div class="w3-content w3-justify" style="max-width: 600px">	

		<!-- delete grid -->
			<div class="w3-row">
				<div class="w3-row-padding" style="margin: 0 -16px">
					<div class="w3-half" style="margin-left: 150px">
						<form name="deleteMemberForm" action="../DispatcherServlet" method="post">
						<ul class="w3-ul w3-white w3-center">
						
							<li class="w3-black w3-xlarge w3-padding-32"><b>회원탈퇴</b></li>
							<li class="w3-padding-16">
								<h4>비밀번호를 입력해 주십시오</h4>
								<input type="password" name="password"><br>
							</li>
							<li class="w3-white w3-padding-24">
								<input type="submit" name="deleteMember" class="btn btn-danger" value="확인">
								<a href="../index.jsp"><input type="button" name="reset" class="btn btn-default" value="취소"></a>
								<input type="hidden" name="command" value="checkPass">
								<input type="hidden" name="code" value="${sessionScope.mvo.mcode }">
								<c:choose>
									<c:when test="${sessionScope.mvo.mcode==1 }">
										<input type="hidden" name="mid" value="${sessionScope.mvo.maker_id }">
									</c:when>
									<c:when test="${sessionScope.mvo.mcode==2 }">
										<input type="hidden" name="bid" value="${sessionScope.mvo.buyer_id }">
									</c:when>
								</c:choose>
							</li>
						</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
</body>
</html>

