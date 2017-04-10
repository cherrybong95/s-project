<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<nav class="w3-sidebar w3-bar-block w3-white w3-animate-left w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:200px;font-weight:bold" id="mySidebar"><br>
<a href="${pageContext.request.contextPath}/DispatcherServlet?command=list"><img src="${pageContext.request.contextPath}/img/logo.png"  width="50%"></a>
<h3 class="w3-padding-64 w3-center"><b>바이핸드</b></h3>
<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
<a href="${pageContext.request.contextPath}/#" onclick="w3_close()" class="w3-bar-item w3-button">ITEMS</a> 
<a href="${pageContext.request.contextPath}/#about" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT US</a> 
<c:choose>
	<c:when test="${sessionScope.mvo==null }">
		<a href="${pageContext.request.contextPath}/#login" onclick="w3_close()" class="w3-bar-item w3-button">LOGIN</a>
	</c:when>
	<c:when test="${sessionScope.mvo.mcode==2 }">
		buyer ${sessionScope.mvo.buyer_name }<br>
		<a href="${pageContext.request.contextPath}/DispatcherServlet?command=showCartList" onclick="w3_close()" class="w3-bar-item w3-button">CART</a> 
		<a href="DispatcherServlet?command=logout">LogOut</a>
		<a href="${pageContext.request.contextPath}/page/updateBuyerForm.jsp">회원정보수정</a><br><br><br>
		<a href="page/deleteMember1.jsp">회원탈퇴</a>
	</c:when>
	<c:when test="${sessionScope.mvo.mcode==1 }">
		maker ${sessionScope.mvo.maker_bname }<br>
		<a href="${pageContext.request.contextPath}/page/addProduct.jsp" onclick="w3_close()" class="w3-bar-item w3-button">REGIST PRODUCT</a> <br>
		<a href="${pageContext.request.contextPath}/DispatcherServlet?command=showInsertItem&id=${sessionScope.mvo.maker_id }">등록한 상품목록</a><br>
		<br>
		<a href="DispatcherServlet?command=logout">LogOut</a>
		<a href="${pageContext.request.contextPath}/page/updateMakerForm.jsp">회원정보수정</a><br><br><br>
		<a href="page/deleteMember1.jsp">회원탈퇴</a>
	</c:when>
</c:choose>
<a href="${pageContext.request.contextPath}/DispatcherServlet?command=list"><img src="${pageContext.request.contextPath}/img/logo.png"  width="50%"></a>
<a href="${pageContext.request.contextPath}/DispatcherServlet?command=list"><img src="${pageContext.request.contextPath}/img/logo.png"  width="50%"></a>
<a href="${pageContext.request.contextPath}/DispatcherServlet?command=list"><img src="${pageContext.request.contextPath}/img/logo.png"  width="50%"></a>
 
  <h3 class="w3-padding-64 w3-center"><b>바이핸드</b></h3>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
  <a href="#" onclick="w3_close()" class="w3-bar-item w3-button">ITEMS</a> 
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT US</a> 
  <c:choose>
  <c:when test="${sessionScope.mvo==null }">
  <a href="#login" onclick="w3_close()" class="w3-bar-item w3-button">LOGIN</a>
  </c:when>
  <c:when test="${sessionScope.mvo.mcode==2 }">
  buyer ${sessionScope.mvo.buyer_name }<br>
  <a href="${pageContext.request.contextPath}/DispatcherServlet?command=showCartList" onclick="w3_close()" class="w3-bar-item w3-button">CART</a>
 
  <a href="DispatcherServlet?command=logout">LogOut</a>
  
  </c:when>
  <c:when test="${sessionScope.mvo.mcode==1 }">
  maker ${sessionScope.mvo.maker_bname }<br>
   <a href="${pageContext.request.contextPath}/page/addProduct.jsp" onclick="w3_close()" class="w3-bar-item w3-button">REGIST PRODUCT</a> 
   <a href="${pageContext.request.contextPath}/DispatcherServlet?command=showInsertItem&id=${sessionScope.mvo.maker_id }" class="w3-bar-item w3-button">등록한 상품목록</a>

  <a href="DispatcherServlet?command=logout"class="w3-bar-item w3-button">LogOut</a>
  </c:when>
  </c:choose>


</nav>