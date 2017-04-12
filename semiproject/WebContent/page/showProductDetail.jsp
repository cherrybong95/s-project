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

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	/* font-family: /* "Montserrat" , */ sans-serif;  */
}

#product {
	 
	
 /* width: 500px;
	height: 350px;  */
}
#title {
	text-align: left;
	font-size: 30px;
	padding: 15px;
}
#productName {
	text-align: center;
	font-size: 24px;
	padding: 15px;
}

#simpleInfo {

	/* position: relative;
	top: 250px;
	left: 750px;
	text-align: center; */
}
#info{
	/* position: relative;
	top:400px;
	left:750px;
	text-align: center; */
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
<c:set value="${requestScope.productDetail.total_amount}" var="total_amount"/>
$(document).ready(function(){
	var pno =${requestScope.productDetail.pno};  //el로 상품번호 받아오기
	var total_amount=parseInt($("#total_amount").text());
	var amount=0;

	$("#addCartBtn").click(function(){
		amount=$("#amount").val();
		if(amount==""){
			alert("수량을 입력해주세요!");
		}else if(amount>total_amount){
			alert("재고수량을 확인해주세요!");
		}else{
	 		$.ajax({ 			
				type:"get",
				url:"${pageContext.request.contextPath}/DispatcherServlet",
				data:"command=checkCart&pno="+pno,
				success:function(data){
					if(data != "-1"){ //이미 존재한다면
					alert("이미 존재하는 상품입니다!"); 
					location.href="${pageContext.request.contextPath}/DispatcherServlet?command=showCartList";
				}else if(confirm("장바구니에 추가하시겠습니까?")){
					location.href="${pageContext.request.contextPath}/DispatcherServlet?command=addCart&pno="+pno+"&amount="+amount;
				}
			}//success
		});  //ajax
		} //else
	}); //click
	
	$("#purchaseBtn").click(function(){
		amount=$("#amount").val();
		if(amount==""){
			alert("수량을 입력해주세요!");
		}else if(amount>total_amount){
			alert("재고수량을 확인해주세요!");
		}else{
			location.href="${pageContext.request.contextPath}/DispatcherServlet?command=getPurchaseForm&pno="+pno+"&amount="+amount;
		}
	});
});	//ready

function w3_open() {
	document.getElementById("mySidebar").style.display = "block";
	document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
	document.getElementById("mySidebar").style.display = "none";
	document.getElementById("myOverlay").style.display = "none";
}

</script>
<body class="w3-light-gray w3-content" style="max-width: 1600px">

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
	<div class="w3-main " style="margin-left: 250px" id="about">
	<!-- Push down content on small screens -->
	<div class="w3-hide-large" style="margin-top: 83px"></div>

			<div 
			class="w3-container  w3-main w3-center w3-row w3-white w3-padding-32 w3-padding-large" 
			style="margin-left: 25px;margin-right:25px;margin-top: 20px;margin-bottom: 20px">
						
					
			
			<div class="w3-panel w3-border-bottom w3-border-dark-gray " align="left">
				<b id="title">
					상품상세정보
				</b>
			</div> 
							
								 
				<!-- <div class="col-sm-7" style="background-color: yellow"> -->
					<div class="col-sm-7" >
  			
					<img src="${requestScope.productDetail.detail_info}" alt="Me"
						id="product" class="w3-image"  >
			
						 	</div>
							
							
							
							
							
							
							<div class="col-sm-5">
						    
						
							<div class="w3-one">
							<div class="w3-panel  w3-border-bottom w3-border-dark-gray " align="right">
				<p id="productName" >
					<b>${requestScope.productDetail.pname }</b>
				</p>
			</div> 
				<div class="w3-border-bottom w3-border-dark-gray w3-padding-16" id="simpleInfo" align="left">
					
						${requestScope.productDetail.simple_info} 
					
				</div>
							</div>
							<div class="w3-one">
					<div id="info" style="margin-top:10px"class="w3-padding-16" align="left">
					 가격 : ${requestScope.productDetail.price}
				<form name="checkForm">
					<c:if test="${sessionScope.mvo!=null && total_amount >0 }">
					<br>재고수량 : <span id="total_amount">${total_amount}</span><br>
						수량 : <input type="text" name="amount" size="3" id="amount"></input>
					</c:if>

				</form>
				<p>판매자 : ${requestScope.productDetail.maker_id }</p>
			<div align="right"> 
				<c:choose> 

					<c:when test="${sessionScope.mvo.mcode==2 && total_amount >0}">
 
						<button class="w3-button w3-black w3-margin-bottom"  id="addCartBtn">장바구니 담기</button>
						<button class="w3-button w3-black w3-margin-bottom"  id="purchaseBtn">구매하기</button>

					</c:when>
					<c:when test="${sessionScope.mvo!=null  && total_amount <=0}">
					<font color="red" >품절</font>						
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
					</div>
				</div>
							
    							</div>  
								</div>	
									
			</div>
			</div>

</body>

</html>

