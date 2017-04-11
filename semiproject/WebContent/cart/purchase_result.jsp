<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>구매완료</title>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
	
	</script>
</head>

<body>
	<c:set value="${requestScope.tdto}" var="tdto"/> 
	<table>
		<tr align="center">
			<th>주문번호 : ${requestScope.tdto.tno}</th><th>주문날짜 :${requestScope.tdto.tdate}</th>
		</tr>
		<tr align="center">
			<th>상품번호</th><th>상품명</th><th>수량</th><th>가격</th>
		</tr>
		<tr align="center">
			<td>${tdto.pvo.pno }</td><td>${tdto.pvo.pname }</td><td>${tdto.amount}</td><td>${tdto.pvo.price*tdto.amount}</td>
		</tr>
	</table>
</body>

</html>