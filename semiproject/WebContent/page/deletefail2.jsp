<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	if(${sessionScope.mvo.mcode==1}){
		alert("탈퇴실패! 등록한 상품을 제거해주세요. 탈퇴를 원하시면 관리자에게 문의 바랍니다.");
		location.href="${pageContext.request.contextPath}/DispatcherServlet?command=list";
	}else{
		alert("탈퇴실패! 구매중인 상품이 있습니다. 탈퇴를 원하시면 관리자에게 문의 바랍니다.");
		location.href="${pageContext.request.contextPath}/DispatcherServlet?command=list";		
	}
</script>
</body>
</html>