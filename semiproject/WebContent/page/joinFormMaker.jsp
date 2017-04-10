<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.w3-sidebar a {
   font-family: "Roboto", sans-serif;
   '
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
   font-family: "Montserrat", sans-serif;
}

.w3-one img {
   width: 100%;
   height: 350px;
}

.w3-one {
   position: relative;
   display: block;
}

.w3-third img {
   margin-bottom: -6px;
   opacity: 0.7;
   cursor: pointer;
}

.w3-one:hover .overlay {
   opacity: 0.5;
}

.w3-one:hover img {
   opacity: 1;
}

.overlay {
   dispaly: block;
   position: absolute;
   top: 75%;
   bottom: 0;
   left: 0;
   right: 0;
   background-color: black;
   opacity: 0.0;
   transition: .5s ease;
}

.txtOverLay {
   color: white;
   position: absolute;
   font-size: 0.875em;
}


table{
 
height: 100px;
margin: auto;
text-align: center;
}

</style>
<script type="text/javascript">
      // Script to open and close sidebar
      function w3_open() {
         document.getElementById("mySidebar").style.display = "block";
         document.getElementById("myOverlay").style.display = "block";
      }

      function w3_close() {
         document.getElementById("mySidebar").style.display = "none";
         document.getElementById("myOverlay").style.display = "none";
      }

      // Modal Image Gallery
      function onClick(element) {
         document.getElementById("img01").src = element.src;
         document.getElementById("modal01").style.display = "block";
         var captionText = document.getElementById("caption");
         captionText.innerHTML = element.alt;
      }
      
      $(document).ready(function(){
         $("#id").keyup(function(){
            if($("#id").val().length<4 || $("#id").val().length>10){
               $("#checkIdResult").html("<font color=orange>"+"4자이상 10자 이하만 가능"+"</font>");
            }else{
                $.ajax({
                  type:"get",
                  url:"../DispatcherServlet",
                  //dataType:"json",
                  data:"command=checkIdMaker&id="+$("#id").val(),
                  success:function(data){
                     if(data=="ok"){
                        $("#checkIdResult").html("<font color=blue>"+"'"+$("#id").val()+"' 사용가능!"+"</font>");
                     } else {
                        $("#checkIdResult").html("<font color=red>"+"중복된 아이디 사용불가"+"</font>");
                     }
                  }
               });
            } 
         });
         $("#password_re").keyup(function(){
            if($("#password_re").val()!=$("#password").val()){
               $("#checkPass").html("비밀번호를 확인해주세요");
            } else {
               $("#checkPass").html("<font color=green>"+"비밀번호 확인!"+"</font>");
            }
         });
      });
      function checkAll(){
         var checkIdResult = $("#checkIdResult").text();
         var checkPass = $("#checkPass").text();
         if(checkIdResult=="중복된 아이디 사용불가" || checkIdResult=="4자이상 10자 이하만 가능" || checkPass=="비밀번호를 확인해주세요"){
            alert("정보를 다시한번 확인해주세요");
            return false;
         } else {
            document.joinFormBuyer.submit();
         }
      }
   </script>
<body class="w3-light-grey w3-content" style="max-width: 1600px">


   <!-- Sidebar/menu -->
   <jsp:include page="../templet/left.jsp"></jsp:include>

   <!-- Top menu on small screens -->
   <header
      class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
      <span class="w3-left w3-padding">바이핸드</span> <a
         href="javascript:void(0)" class="w3-right w3-button w3-white"
         onclick="w3_open()">☰</a>
   </header>

   <!-- Overlay effect when opening sidebar on small screens -->
   <div class="w3-overlay w3-hide-large w3-animate-opacity"
      onclick="w3_close()" style="cursor: pointer" title="close side menu"
      id="myOverlay"></div>
<div class="w3-container w3-light-grey w3-text-dark-grey w3-padding-10 " id="top" style="margin-left:300px">
   <span >
<h2><b>Maker Join</b></h2>
<hr style="border: solid 3px white;">
</span>
</div>

<div class="w3-container w3-light-grey w3-text-dark-grey w3-padding-32" id="about" >

   <!-- !PAGE CONTENT! -->

   <div class="w3-main" style="margin-left: 300px">

      <!-- Push down content on small screens -->
      <div class="w3-hide-large" style="margin-top: 83px"></div>

      <!-- join grid -->
         <form name="joinFormMaker" method="post" action="../DispatcherServlet" onsubmit="return checkAll()">
     <input type="hidden" name="command" value="joinMaker">
           <div class="w3-content" style="max-width: 600px" >
          이름
        <div class="w3-section">
     <input class="form-control"  type="text" name="mname" required="required" placeholder="Enter name">
        </div>        
          아이디
        <div class="w3-section">
          <input class="form-control"  type="text" name="id" id="id" required="required" placeholder="Enter ID"><span id="checkIdResult"></span>
        </div>        
          비밀번호
        <div class="w3-section">
          <input class="form-control"  type="password" name="password" id="password" required="required" placeholder="Enter Password">
        </div>        
          비밀번호 확인
        <div class="w3-section">
          <input class="form-control"  type="password" name="password_re" id="password_re" required="required" placeholder="Enter Password"><span id="checkPass"></span>
        </div>        
          주소
        <div class="w3-section">
          <input class="form-control"  type="text" name="add" required="required" placeholder="Enter address">
        </div>        
          상호명
        <div class="w3-section">
          <input class="form-control"  type="text" name="maker_bname" required="required" placeholder="Enter Maker">
        </div>        
          전화번호
        <div class="w3-section">
          <input class="form-control"  type="text" name="tel" required="required" placeholder="Enter tel">
        </div>        
          계좌번호
        <div class="w3-section">
          <input class="form-control"  type="text" name="account" required="required" placeholder="Enter Account No">
        </div>        
        <div class="w3-section w3-center" >
     <input type="submit" value="회원가입" class="w3-button w3-black w3-margin-bottom">
     <input type="reset" value="취소" class="w3-button w3-grey w3-margin-bottom">
        </div>
      </div>
      </form>
      </div>
</div>
      <!-- Modal for full size images on click-->
      <div id="modal01" class="w3-modal w3-black" style="padding-top: 0"
         onclick="this.style.display='none'">
         <span class="w3-button w3-black w3-xlarge w3-display-topright">×</span>
         <div
            class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
            <img id="img01" class="w3-image">
            <p id="caption"></p>
         </div>
      </div>
</body>
</html>