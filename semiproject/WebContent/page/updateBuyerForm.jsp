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
#title {
	text-align: left;
	font-size: 30px;
	padding: 15px;
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
	<div class="w3-main" style="margin-left: 250px">
	<!-- Push down content on small screens -->
	<div class="w3-hide-large" style="margin-top: 83px"></div>


		<div class="w3-container w3-main w3-white w3-padding-32 w3-padding-large" style="margin-left: 25px;margin-right:25px;margin-top: 20px;margin-bottom: 20px">
		<div class="w3-panel  w3-border-bottom w3-border-dark-gray" id="title">
				
					<b>회원정보수정</b>
				
			</div>
			<div class="w3-content w3-justify w3-center"   style="max-width: 600px">
		
	<!-- update grid -->
			<form name="updateFormBuyer" method="post" action="../DispatcherServlet" onsubmit="return checkAll()">
			<div class="w3-content" style="max-width: 600px" align="left">
				이름  	<div class="w3-section"><input class="form-control"  type="text" name="bname" required="required"	value="${sessionScope.mvo.buyer_name }"></div>        
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