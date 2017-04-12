
		<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body, h1, h2, h3, h4, h5, h6,b, .w3-wide {
	font-family: "Montserrat", sans-serif;
}


table, th,td{
margin :auto;

padding: 300px;
text-align: center;
vertical-align: middle;
}
#title {
	text-align: left;
	font-size: 30px;
	padding: 15px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("a[href*='delete']").click(function(){
			return confirm(" 삭제하시겠습니까?");
		});//click
	});//ready
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
				
					<b>내가등록한상품</b>
				
			</div>
			<div class="w3-content w3-justify w3-center"   style="max-width: 900px">
	<form action="DispatcherServlet" method="post">
   		<table class="table  table-hover" >
			<thead>
				<tr>
					<th>번호</th><th>사진</th><th>상품명</th><th>가격</th><th></th>
				</tr>
			</thead>
			<tbody >
				<c:forEach items="${requestScope.productListVO.list}" var="insertList">
				<tr>
					<td >${insertList.pno }</td>
					<td><img src="${insertList.detail_info }" width=" 160px" height="130px" ></td>
					<td>${insertList.pname }</td>
					<td>${insertList.price } 원</td>
					<td>
						<a href="DispatcherServlet?command=update&no=${insertList.pno }" style="text-decoration: none">
						<input type="button" class="w3-button w3-block w3-black w3-margin-bottom" value="수정"></a>&nbsp;&nbsp;
				 		<a href="DispatcherServlet?command=delete&no=${insertList.pno }" style="text-decoration: none">
				 		<input type="button" class="w3-button w3-block w3-black w3-margin-bottom" value="삭제"></a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
				
			</div>
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
					<a	href="DispatcherServlet?command=showInsertItem&pageNo=${page}&id=${sessionScope.mvo.maker_id}" class="w3-bar-item w3-button w3-hover-black" >${page}</a>
				</c:otherwise>	
			</c:choose>				
			</c:forEach>
			<c:if test="${requestScope.productListVO.pagingBean.nextPageGroup==true}">
			<a href="${pageContext.request.contextPath}/DispatcherServlet?command=showInsertItem&pageNo=${requestScope.productListVO.pagingBean.endPageOfPageGroup+1}&id=${sessionScope.mvo.maker_id}" class="w3-bar-item w3-button w3-hover-black">»</a> 
			
			</c:if>
		</div>
	</div>
			</div>
</body>
</html>

