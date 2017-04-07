<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<script>
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

   <!-- !PAGE CONTENT! -->
   <br><br><br><br><br>
   <div class="w3-main" style="margin-left: 300px">

      <!-- Push down content on small screens -->
      <div class="w3-hide-large" style="margin-top: 83px"></div>

      <!-- join grid -->
      <div
         class="w3-container w3-dark-grey w3-center w3-text-light-grey w3-padding-32"
         id="about">
      <div class="w3-row">
        <div class="w3-row-padding" style="margin: 0 -16px">
               <div class="w3-half w3-margin-bottom">
                  <ul class="w3-ul w3-white w3-center">
                     <li class="w3-black w3-xlarge w3-padding-32"><b>판매자</b></li>
                     <li class="w3-padding-16">
                       <h3>내 제품을 알리고 싶다면</h3> <p class="w3-opacity" style="text-align:center">
                        dddper month adsfadsfadsfadfasfadsf adsf
                        adsfad sfad sfasdfadsfads fadsfadsf adsfadsf asd a adsf adfads fasd adsf
                        a ds fadsf asd   ㅇㄻㅇㄴㄻㅇㄴㄻ ㄴㄻㅇㄴ ㅁㅇㄴ ㄻㅇㄴ
                        f asd fadsf a dsfadfsad adsfads faㄻㅇㄴㄻㅇㄻ ㅇㄻㅇㄻ ㅇㄹ ㅁㅇㄴㄹ
                           </p>
                     </li>
                     <li class="w3-light-grey w3-padding-24"> <a href="joinFormMaker.jsp">
                        <button class="w3-button w3-white w3-padding-large">Sign Up</button></a>
                     </li>
                  </ul>
               </div>

               <div class="w3-half">
                  <ul class="w3-ul w3-white w3-center">
                     <li class="w3-black w3-xlarge w3-padding-32"><b>구매자</b></li>
                     <li class="w3-padding-16">
                        <h3>특별한 제품을 원한다면</h3> <p class="w3-opacity" style="text-align:center"> 
                         adshflahefiuha  dslkha fadskf;oh ;oaf;kh    k ;k akdf;lkasj f;klajds f;asdf
                         adsfl askdf;ladskhf;a hf;aklsj; fiaj;fkj;lkaw ewj akjf; akdsjf;aksjd; fkjadsf
                         a dslfja; oesijf;ajf; akjs; dkfj;adsjf;askjd; fkajs;dfkja; dspjf; asper month</p>
                     </li>
                     <li class="w3-light-grey w3-padding-24"><a href="joinFormBuyer.jsp">
                        <button class="w3-button w3-white w3-padding-large">Sign Up</button>
                           </a>
                     </li>
                  </ul>
               </div>
               </div>
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
   </div>
</body>
</html>
  
