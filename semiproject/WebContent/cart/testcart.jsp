<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#addCartBtn").click(function(){
			var pno ="6";  //el로 상품번호 받아오기
 	 		$.ajax({ 			
 				type:"get",
				url:"${pageContext.request.contextPath}/DispatcherServlet",
				data:"command=checkCart&pno="+pno,
				success:function(data){
					//var flag=false;
					if(data != "-1" ){ //이미 존재한다면
/* 						if(confirm("장바구니에 동일한 상품이 존재합니다. 그래도 추가 하시겠습니까?"))
							flag=true; */
						alert("이미 존재하는 상품입니다!"); 
						location.href="${pageContext.request.contextPath}/DispatcherServlet?command=showCartList";
					}else if(confirm("장바구니에 추가하시겠습니까?")){
						location.href="${pageContext.request.contextPath}/DispatcherServlet?command=addCart&pno="+pno;
					}
					/* if(flag==true){
						location.href="${pageContext.request.contextPath}/DispatcherServlet?command=addCart&pno="+pno;
					} */
				}//success
			});  //ajax
		}); //click
	});	//ready
</script>
</head>
<body>
	 <a href="${pageContext.request.contextPath}/DispatcherServlet?command=showCartList">장바구니</a><br>
	 <table>
	 		<tr>
	 			<th>no</th><th>상품명</th><th>수량</th><th>가격</th><th>장바구니담기</th>
	 		</tr>
	 		<tr>
	 			<td >2</td><td>팔찌</td><td>3</td><td>3000</td> <td><button id="addCartBtn">상품추가</button></td>
	 		</tr>

	 </table>
</body>
</html>