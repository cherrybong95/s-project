<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주문하기</title>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#selectInfoForm :radio[name=selectInfo]").change(function(){ //라디오 버튼을 누를 때
				var checkedInfo=$("#selectInfoForm :radio[name=selectInfo]:checked").val(); //체크된 라디오 버튼 값을 넣음
				if(checkedInfo=="old"){ //기존 배송지 정보 가져올 때
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/DispatcherServlet",
						dataType:"json", //json으로 응답받을거니까 dataType을 지정한다.서버로부터 응답받는게 스트링인데 여기서는 json으로 응답받으려고. json으로 넘어 오는게 아니라서 
						data:"command=checkDestination", //종류가 3개 이상이 될 때에는 serialize()를 이용한다.
						success:function(data){
							//alert(data.buyer_name);
							$("#receiver").val(data.buyer_name);
							$("#destination").val(data.buyer_add);
							$("#contact").val(data.buyer_tel); 
						}
					});
				}else{ //사용자로부터 새롭게 입력받는 정보
					$("#receiver").val("");
					$("#destination").val("");
					$("#contact").val(""); 
				} 
			}); //라디오버튼 변경
		});//ready
	</script>
</head>

<body>
	주문하기
	<hr>
	<table> <!-- 카트에서 주문할 상품 선택 후의 리스트 보여줌 -->
		<tr>
			<th>상품번호</th><th>상품명</th><th>가격</th><th>수량</th>
		</tr>
	
		<c:forEach items="${requestScope.vo}" var="vo">
			<tr align="center">
			<c:set value="${vo.pno}" var="pno"/>
			<c:set value="${requestScope.amount}" var="amount"/>
				<td>${vo.pno}</td><td>${vo.pname}</td>
				<td>${vo.price*requestScope.amount}</td><td>${requestScope.amount}</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	<form id="selectInfoForm"> <!-- 기존 배송정보 가져올지 새로운 정보 입력할지 선택하는 라디오버튼 -->
		기존 배송지 정보<input type="radio" name="selectInfo" value="old">
		새로운 배송지 정보<input type="radio" name="selectInfo" value="new">
	</form>	
	
	<form name="infoForm" method="post" action="DispatcherServlet?command=purchase&pno=${pno}&amount=${amount}">
		수령인 <input type="text" id="receiver" name="receiver" required="required"></input><br>
		수령지 <input type="text" id="destination" name="destination" required="required"></input><br>
		전화번호 <input type="text" id="contact" name="contact" required="required"></input>
		<div id="test"></div>
	<input type="submit" id="buy" value="주문완료">
	</form>
		
	
</body>

</html>