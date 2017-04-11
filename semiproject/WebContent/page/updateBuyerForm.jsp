<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
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

	$(document).ready(function() {
		$("#password_re").keyup(function() {
			if ($("#password_re").val() != $("#password").val()) {
				$("#checkPass").html("비밀번호를 확인해주세요");
			} else {
				$("#checkPass").html("<font color=green>"+"비밀번호 확인!"+"</font>");
			}
		});
	});

	function checkAll() {
		var checkPass = $("#checkPass").text();
		if (checkPass == "비밀번호를 확인해주세요") {
			alert("비밀번호를 확인해주세요");
			return false;
		} else {
			document.updateFormBuyer.submit();
		}
	}
</script>

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
					<b><i>회원정보수정</i></b>
				</h1>
			</div>
			<br> <br> <br>
			<div class="w3-content w3-justify" style="max-width: 600px">	
		
	<!-- update grid -->
			<form name="updateFormBuyer" method="post" action="../DispatcherServlet" onsubmit="return checkAll()">
			<div class="w3-content" style="max-width: 600px" >
				이름 	
		       	<div class="w3-section"><input class="form-control"  type="text" name="bname" required="required"	value="${sessionScope.mvo.buyer_name }"></div>        
				아이디 
		       	<div class="w3-section"><input class="form-control"  type="text" name="id" id="id" required="required" value="${sessionScope.mvo.buyer_id }" readonly="readonly"></div>        
				비밀번호 
		       	<div class="w3-section"><input class="form-control"  type="password" name="password" id="password" required="required"></div>        
				비밀번호 확인 
		       	<div class="w3-section"><input class="form-control"  type="password"	name="password_re" id="password_re" required="required"><span id="checkPass"></span></div>        
				주소  
		       	<div class="w3-section"><input class="form-control"  type="text" name="add" required="required" value="${sessionScope.mvo.buyer_add }"></div>        
				전화번호 
		       	<div class="w3-section"><input class="form-control"  type="text" name="tel" required="required" value="${sessionScope.mvo.buyer_tel }"> </div>        
		       	<div class="w3-section w3-center" >
					<input type="submit" value="회원정보수정" class="w3-button w3-black w3-margin-bottom"> &nbsp;&nbsp;&nbsp;
					<input type="hidden" name="command" value="updateBuyerInfo"> 
					<a href="${pageContext.request.contextPath}/index.jsp">
					<input type="button" value="홈" class="w3-button w3-grey w3-margin-bottom"></a>&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/page/deleteMember1.jsp" >
					<input type="button" value="회원탈퇴" style="text-decoration: none" class="w3-button w3-black w3-margin-bottom" ></a>
				</div>
			</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>