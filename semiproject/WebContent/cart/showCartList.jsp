<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>카트결과</title>
   <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
   <script type="text/javascript">
   $(document).ready(function(){
	   $(".deleteCart").click(function(){
		   //alert($(this).parent().parent().children().eq(0).text());
		   var pno=$(this).parent().parent().children().eq(0).text();
		   alert(pno);
		   if(confirm("상품을 삭제하시겠습니까?")){
			   location.href="${pageContext.request.contextPath}/DispatcherServlet?command=deleteCart&pno="+pno;
		   }
	   });
   });
   </script>
</head>

<body>
   <c:set value="${sessionScope.mvo}" var="mvo"/>
   ${sessionScope.list}
   <table>
      <tr>
         <th>상품번호</th><th>상품명</th><th>수량</th><th>가격</th>
      </tr>
         <c:forEach items="${requestScope.list}" var="list">
               <tr align="center">
            <td>${list.pno}</td><td>${list.pname}</td>
            <td><input type="text" style="width:20pt;height:20pt;"> <input type="button" style="width:30pt;height:20pt;" value="적용"></td>
            <td>${list.price}</td><td><button class="deleteCart">상품삭제</button></td>
                  <tr>
         </c:forEach>
   </table>
</body>

</html>