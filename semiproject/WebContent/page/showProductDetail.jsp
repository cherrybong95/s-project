<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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

#product {
	padding: 30px;
	width: 400px;
	height: 400px;
}

#productName {
	text-align: center;
	font-size: large;
	padding: 15px;
}

#simpleInfo {

	position: absolute;
	top: 250px;
	left: 750px;
	text-align: center;
}
#info{
	position: absolute;
	top:400px;
	left:750px;
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#addCartBtn").click(function(){
		var pno =${requestScope.productDetail.pno};  //el로 상품번호 받아오기
		var amount=$("#amount");
		if(amount.val()==""){
			alert("수량을 입력해주세요!");
		}else{
	 		$.ajax({ 			
				type:"get",
				url:"${pageContext.request.contextPath}/DispatcherServlet",
				data:"command=checkCart&pno="+pno,
				success:function(data){
					if(data == "true"){ //이미 존재한다면
					alert("이미 존재하는 상품입니다!"); 
					location.href="${pageContext.request.contextPath}/DispatcherServlet?command=showCartList";
				}else if(confirm("장바구니에 추가하시겠습니까?")){
					location.href="${pageContext.request.contextPath}/DispatcherServlet?command=addCart&pno="+pno+"&amount="+amount.val();
				}
			}//success
		});  //ajax
		} //else
	}); //click
});	//ready

</script>
<body class="w3-light-gray w3-content" style="max-width: 1600px">

	<!-- Sidebar/menu -->
	<jsp:include page="../templet/left.jsp"></jsp:include>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

<div class="w3-main" style="margin-left: 300px">
		<div class="w3-container w3-light-gray w3-padding-32 w3-padding-large">
			<div class="w3-xxlarge w3-serif">
				<p>
					<b><i>Detail</i></b>
				</p>
			</div>

			<div
				class="w3-panel w3-border-top w3-border-bottom w3-border-dark-gray">
				<p id="productName">
					<b>${requestScope.productDetail.pname }</b>
				</p>
			</div>
    
  				 <div>
					<img src="${requestScope.productDetail.detail_info}" alt="Me"
						id="product" class="w3-image w3-padding-32" align="left">
				</div>
		
				<div class="w3-panel w3-border-top w3-border-bottom w3-border-dark-gray" id="simpleInfo">
					<br><br>
						${requestScope.productDetail.simple_info} 
					<br><br>
				</div>
	

				<div id="info">
					 가격 : ${requestScope.productDetail.price}
					<br>재고수량 : ${requestScope.productDetail.total_amount}
				<form name="checkForm">
					<c:if test="${sessionScope.mvo!=null}">
						수량 : <input type="text" name="amount" size="3" id="amount"></input>
					</c:if>
				</form>
				<p>판매자 : ${requestScope.productDetail.maker_id }</p><br>

				<c:choose>
					<c:when test="${sessionScope.mvo!=null}">
						<button class="btn btn-info" id="addCartBtn">장바구니 담기</button>
						<button class="btn btn-info" id="purchase">구매하기</button>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
</body>
</html>