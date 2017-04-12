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

table{
 
height: 100px;
margin: auto;
text-align: center;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#id").keyup(function() {
			if ($("#id").val().length < 4	|| $("#id").val().length > 10) {
				$("#checkIdResult").html("<font color=orange>" + "4자이상 10자 이하만 가능" + "</font>");
			} else {
				$.ajax({
					type : "get",
					url : "../DispatcherServlet",
					data : "command=checkIdBuyer&id=" + $("#id").val(),
					success : function(data) {
						if (data == "ok") {
							$("#checkIdResult").html("<font color=blue>" + "''" + $("#id").val() + "' 사용가능!" 	+ "</font>");
						} else {
							$("#checkIdResult").html("<font color=red>" + "중복된 아이디 사용불가" + "</font>");
						}
					}
				});
			}
		});
		$("#password_re").keyup(function() {
			if ($("#password_re").val() != $("#password").val()) {
				$("#checkPass").html("비밀번호를 확인해주세요");
			} else {
				$("#checkPass").html("<font color=green>" + "비밀번호 확인!" + "</font>");
			}
		});
	});
	function checkAll() {
		var checkIdResult = $("#checkIdResult").text();
		var checkPass = $("#checkPass").text();
		if (checkIdResult == "중복된 아이디 사용불가" || checkIdResult == "4자이상 10자 이하만 가능" || checkPass == "비밀번호를 확인해주세요") {
			alert("정보를 다시한번 확인해주세요");
			return false;
		} else {
			document.joinFormBuyer.submit();
		}
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
	<div class="w3-main" style="margin-left: 250px" id="about">
	<!-- Push down content on small screens -->
	<div class="w3-hide-large" style="margin-top: 83px"></div>
		<div class="w3-container w3-center w3-row w3-white w3-padding-32 w3-padding-large" style="margin-left: 25px;margin-right:25px;margin-top: 20px;margin-bottom: 20px">
			<div
				class="w3-panel w3-center w3-border-bottom w3-border-dark-gray" >
				<h1 align="left">
					<b><i>Buyer Join</i></b>
				</h1>
			</div>
			<br> <br> <br>
			<div class="w3-content w3-justify" style="max-width: 600px">	
			
	<!-- join grid -->
	<form name="joinFormBuyer" method="post" action="../DispatcherServlet" onsubmit="return checkAll()">
	<div class="w3-content" style="max-width: 600px" >
		<input type="hidden" name="command" value="joinBuyer" >
    	이름
		<div class="w3-section"><input class="form-control"  type="text" name="bname" required="required" placeholder="Enter name"></div>
        ID
        <div class="w3-section"><input class="form-control" type="text" name="id" id="id" required="required" placeholder="Enter ID"><span style="text-align:center;" id="checkIdResult"></span></div>        
      	비밀번호
        <div class="w3-section"><input class="form-control" type="password" name="password" id="password" required="required" placeholder="Enter Password"></div>
		비밀번호재입력
        <div class="w3-section"><input class="form-control" type="password" name="password_re" id="password_re" required="required" placeholder="Enter Password"><span id="checkPass"></span></div>
        주소
        <div class="w3-section"><input class="form-control" type="text" name="add" required="required" placeholder="Enter address"></div>
        전화번호
        <div class="w3-section"><input class="form-control" type="text" name="tel" required="required" placeholder="Enter tel"></div>
        <div class="w3-section w3-center" >
	        <input type="submit" value="회원가입" class="w3-button w3-black w3-margin-bottom"> &nbsp;&nbsp;&nbsp;
	        <input type="reset" value="취소" class="w3-button w3-grey w3-margin-bottom">
        </div>
        </div>
        </form>
	
		</div>
	</div>
	</div>
</body>
</html>