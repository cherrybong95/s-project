<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<nav class="w3-sidebar w3-bar-block w3-white w3-animate-left w3-text-grey w3-collapse w3-top w3-center" style="z-index:3; width:300px;font-weight:bold" id="mySidebar"><br>
<a href="${pageContext.request.contextPath}/DispatcherServlet?command=list"><img src="${pageContext.request.contextPath}/img/logo.png"  width="50%"></a>
<h3 class="w3-padding-65 w3-center"><b>바이핸드</b></h3><br><br>
<a href="javascript:void(0)" onclick="w3_close()" style="text-decoration: none" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
<a href="${pageContext.request.contextPath}/#" onclick="w3_close()" style="text-decoration: none" class="w3-bar-item w3-button">ITEMS</a> 
<a href="${pageContext.request.contextPath}/#about" onclick="w3_close()" style="text-decoration: none" class="w3-bar-item w3-button">ABOUT US</a> 
<c:choose> 
	<c:when test="${sessionScope.mvo==null }">
		<a href="${pageContext.request.contextPath}/#login" onclick="w3_close()" style="text-decoration: none" class="w3-bar-item w3-button">LOGIN</a>
	</c:when>
	<c:when test="${sessionScope.mvo.mcode==2 }">
		<a href="${pageContext.request.contextPath}/page/updateBuyerForm.jsp" style="text-decoration: none" class="w3-bar-item w3-button" >Buyer ${sessionScope.mvo.buyer_name }</a>
		<a href="${pageContext.request.contextPath}/DispatcherServlet?command=showCartList" style="text-decoration: none" onclick="w3_close()" class="w3-bar-item w3-button">CART</a> 
		<a href="${pageContext.request.contextPath}/DispatcherServlet?command=purchaseList" style="text-decoration: none" onclick="w3_close()" class="w3-bar-item w3-button">ORDER LIST</a>
		<hr><a href="${pageContext.request.contextPath}/DispatcherServlet?command=logout" style="text-decoration: none "class="w3-bar-item w3-button" >LogOut</a>
	</c:when>
	<c:when test="${sessionScope.mvo.mcode==1 }">
		<a href="${pageContext.request.contextPath}/page/updateMakerForm.jsp" style="text-decoration: none" class="w3-bar-item w3-button">Maker ${sessionScope.mvo.maker_bname }</a>
		<a href="${pageContext.request.contextPath}/DispatcherServlet?command=showOrderList" style="text-decoration: none" onclick="w3_close()" class="w3-bar-item w3-button">ORDER LIST</a>
		<a href="${pageContext.request.contextPath}/page/addProduct.jsp" onclick="w3_close()" style="text-decoration: none" class="w3-bar-item w3-button">REGIST PRODUCT</a>
		<a href="${pageContext.request.contextPath}/DispatcherServlet?command=showInsertItem&id=${sessionScope.mvo.maker_id }" style="text-decoration: none" class="w3-bar-item w3-button">REGISTED PRODUCT</a>
		<hr><a href="${pageContext.request.contextPath}/DispatcherServlet?command=logout" style="text-decoration: none" class="w3-bar-item w3-button">LogOut</a>
	</c:when>
</c:choose>
</nav>