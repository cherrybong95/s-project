<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("탈퇴실패! 등록한 상품을 제거해주세요");
	location.href="${pageContext.request.contextPath}/DispatcherServlet?command=list";
</script>
