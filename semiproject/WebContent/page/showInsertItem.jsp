
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
		$("a[href*='delete']").click(function(){
			return confirm(" 삭제 할거야?");
		});//click
	});//ready
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
	<span ><br>
<h2><b>내가 등록한 상품</b></h2>
<hr style="border: solid 3px white;">
</span>
</div>

<div class="w3-container w3-light-grey w3-center w3-text-dark-grey w3-padding-32" id="about" >
    <div class="w3-content w3-justify" style="max-width:600px">
	
	<form action="DispatcherServlet" method="post" id="productList" name="productList">
   		<table class="table  table-hover" >
			<thead valign="middle" align="center" >
				<tr>
					<th>번호</th><th>사진</th><th>상품명</th><th>가격</th><th></th>
				</tr>
			</thead>
			<tbody style="valign:middle">
				<c:forEach items="${requestScope.productListVO.list}" var="insertList">
				<tr>
				<td valign="middle" align="center" >${insertList.pno }</td>
				<td><img src="${insertList.detail_info }" style="width: 150px"></td>
				<td>${insertList.pname }</td>
				<td>${insertList.price }</td>
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
				<a href="${pageContext.request.contextPath}DispatcherServlet?command=showInsertItem&pageNo=${requestScope.productListVO.pagingBean.endPageOfPageGroup+1}&id=${sessionScope.mvo.maker_id}" class="w3-bar-item w3-button w3-hover-black">»</a> 
				
				</c:if>
		
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

