<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	if(confirm("장바구니 목록으로 이동하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/DispatcherServlet?command=showCartList";
	}else{
		location.href="${pageContext.request.contextPath}/DispatcherServlet?command=showProductDetail&productNo="+${param.pno};
	}
</script>