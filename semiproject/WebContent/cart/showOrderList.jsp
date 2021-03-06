<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta  name="viewport" content="width=device-width, initial-scale=1">
<title> 주문관리</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

table, td, th {   
	font-size:small;
    border: 1px solid #ddd;
    text-align: center;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 10px;
}
#title {
	text-align: left;
	font-size: 30px;
	padding: 15px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".pro_state").click(function(){
			$("#tbody").html("");
			//alert($(this).text());
			var state=$(this).text();
			$.ajax({
				type:"get",
				dataType:"json",
				url:"DispatcherServlet",
				data:"command=showOrderStateList&maker_id=${sessionScope.mvo.maker_id}&pro_state="+$(this).text(),
				success:function(data){
					//alert(state);
					var info="";
					for(var i=0;i<data.length;i++){
						//alert(data[i].pname);
						info+="<tr>";
						info+="<td>"+data[i].ono+"</td>";
						info+="<td>"+data[i].pno+"<br>/"+data[i].pname+"</td>";
						info+="<td>"+data[i].tno+"</td>";
						info+="<td>"+data[i].tdate+"</td>";
						info+="<td>"+data[i].buyer_id+"</td>";
						info+="<td>"+data[i].buyer_tel+"</td>";
						info+="<td>"+data[i].total_price+"</td>";
						info+="<td>"+data[i].pro_state+"</td>";
						if(state=="입금대기"){
							info+="<td><button class=w3-button>결제완료</button></td>";
						}else if(state=="결제완료"){
							info+="<td><button class=w3-button>입금대기</button><br>";
							info+="<button class=w3-button>배송중</button></td>";
						}else if(state=="배송중"){
							info+="<td><button class=w3-button>결제완료</button><br>";
							info+="<button class=w3-button>배송완료</button></td>";
						}else{
							info+="<td></td>";
						}
						info+="</tr>";
						$("#tbody").html(info);
					}//for
				}//success
			});//ajax
		});//click
		
		$("#tbody").on("click",".w3-button",function(){
			//alert($(this).parent().parent().children().eq(1).text());
				var tno=$(this).parent().parent().children().eq(2).text();
				var update_state=$(this).text();
				//alert($(this).text());
 			$.ajax({
				type:"get",
				url:"DispatcherServlet",
				data:"command=orderStateChange&tno="+tno+"&update_state="+update_state
			}); 
			$(this).parent().parent().empty();
		}); 
	});//ready
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}

</script>
</head>
<body class="w3-light-grey w3-content" style="max-width: 1600px">
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
	<div class="w3-main" style="margin-left: 250px" id="about">
	<!-- Push down content on small screens --> 
	<div class="w3-hide-large" style="margin-top: 83px"></div>
		<div class="w3-container w3-main w3-center w3-row w3-white w3-padding-32 w3-padding-large" style="margin-left: 25px;margin-right:25px;margin-top: 20px;margin-bottom: 20px">
			<div class="w3-panel  w3-border-bottom w3-border-dark-gray" id="title">
				
					<b>구매요청리스트</b>
				
			</div>
			<div class="w3-content w3-justify" style="max-width: 900px">
				<button class="w3-button w3-margin-bottom pro_state" style="background-color: #BDBDBD"><font color="white">입금대기</font></button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="w3-button w3-margin-bottom pro_state" style="background-color: #8C8C8C"><font color="white">결제완료</font></button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="w3-button w3-margin-bottom pro_state" style="background-color: #5D5D5D" ><font color="white">배송중</font></button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="w3-button w3-margin-bottom pro_state" style="background-color: #353535"><font color="white">배송완료</font></button><br><br>
			<table>
				<thead id="thead">
					<tr> 
						<th>번호</th><th>상품번호/상품명</th><th>거래번호</th><th>구매일</th><th>구매자명</th><th>구매자 연락처</th><th>결제 가격</th><th>결제상태</th><th>상태변경</th>
					</tr>
				</thead>
				<tbody id="tbody">
				
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>