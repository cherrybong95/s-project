<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매목록</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css?family=Montserrat">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

body, h1, h2, h3, h4, h5, h6, b,.w3-wide {
	font-family: "Montserrat", sans-serif;
}

table, td, th {    
    border: 1px solid #ddd;
    text-align: center;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 15px;
}
.product{
	text-align: left;
	width: 380px;
}

.product_img{
	width:25%;
	height:100px;
	float: left; 
	padding: 10px;
}
</style>

</head>
<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>
	
		<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>
	
	
	
	<div class="w3-main" style="margin-left: 300px">
	<div class="w3-container w3-light-grey w3-padding-32 w3-padding-large ">
	<div class="w3-panel w3-border-top w3-border-bottom w3-border-dark-gray">
  	<h1 align="center"><b><i>Order List</i></b></h1>
	</div> 
	<br><br><br>
	<c:forEach items="${requestScope.transaction}" var="transactionList">
	구매날짜 : ${transactionList.tdate}
	<p>
	<table>
			<tr>
				<th >주문번호</th>
				<th>배송처리상태</th>
				<th>상품번호</th>
				<th>상품</th>
				<th>수량</th>
				<th>총금액</th>
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/DispatcherServlet?command=TransactionDetailInfo&tno=${transactionList.tno}">${transactionList.tno}</a></td>
				<td>${transactionList.pro_state}</td>
				<td>${transactionList.pvo.pno}</td>
				<td class="product" ><img class="product_img" src="${pageContext.request.contextPath}/img/안경.jpg">
				<div><p>상품명 : ${transactionList.pvo.pname}<br>가격 : ${transactionList.pvo.price}<br>${transactionList.pvo.simple_info}</p></div></td>
				<td>${transactionList.amount}</td>
				<td>${transactionList.pvo.price*transactionList.amount}</td>
			</tr>
		</table>
		<br>
			</c:forEach>
				<!-- Pagination -->
	<div class="w3-center w3-padding-32">
		<div class="w3-bar">
		<c:set value="${requestScope.pagingBean.nowPage}" var="nowPage"></c:set>
			<c:if test="${requestScope.pagingBean.previousPageGroup==true}">
			<a href="DispatcherServlet?command=purchaseList&pageNo=${requestScope.pagingBean.startPageOfPageGroup-1}" class="w3-bar-item w3-button w3-hover-black">«</a> 
			</c:if>
			<c:forEach begin="${requestScope.pagingBean.startPageOfPageGroup}" end="${requestScope.pagingBean.endPageOfPageGroup}" var="page" >
			<c:choose>
				<c:when test="${page==nowPage}">
					<b class="w3-bar-item w3-button w3-hover-black" >${page}</b>
				</c:when>	
				<c:otherwise>
					<a	href="DispatcherServlet?command=purchaseList&pageNo=${page}" class="w3-bar-item w3-button w3-hover-black" >${page}</a>
				</c:otherwise>	
			</c:choose>				
			</c:forEach>
			<c:if test="${requestScope.productListVO.pagingBean.nextPageGroup==true}">
			<a href="${pageContext.request.contextPath}DispatcherServlet?command=purchaseList&pageNo=${requestScope.pagingBean.endPageOfPageGroup+1}&id=${sessionScope.mvo.maker_id}" class="w3-bar-item w3-button w3-hover-black">»</a> 
			
			</c:if>
		</div>
	</div>
	</div>
	</div>
</body>
</html>