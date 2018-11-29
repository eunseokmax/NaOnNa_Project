<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>  
<%@ page import="com.spring.naonnaTest.ground.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<% request.setCharacterEncoding("utf-8"); %> 

<%
String admin = (String)session.getAttribute("admin");
String ground_name = (String)session.getAttribute("groundName");

%>

 <% 
 	GroundVO vo = (GroundVO)request.getAttribute("vo"); 	
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naonna_main.css">
  <style>
  	body {
  font-family: Arial;
  margin: 0;
	}
	
	* {
	  box-sizing: border-box;
	}
	
	.main {
		margin-top : 40px;
	}
	img {
	  vertical-align: middle;
	}
	
	.container {
	  position: relative;
	  overflow : hidden;
	}
	
	/* Hide the images by default */
	.mySlides {
		width : 400px;
	  display: none;
	}
	.mySlides img {
		width : 400px;
		height : 300px;
	}
	
	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
	  cursor: pointer;
	}
	
	/* Next & previous buttons */
	.prev,
	.next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: white;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next {
	  left: 370px;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover,
	.next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* Container for image text */
	.caption-container {
	  width : 400px;
	  text-align: center;
	  background-color: #222;
	  padding: 2px 16px;
	  color: black;
	}
	.row {
		width : 400px;
		margin-left : 0px;
	}
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Six columns side by side */
	.column {
	  float: left;
	  width: 33.33%;
	}
	.row img {
		height :133.8px;
	}
	
	/* Add a transparency effect for thumnbail images */
	.demo {
	  opacity: 0.6;
	}
	.demo .cursor{
		height : 100%;
	}
	.active,
	.demo:hover {
	  opacity: 1;
	}	
	.ground-detail {
		width : 500px;
		margin : 30px 40px 0 -150px;
		padding : 20px 0px 0px 10px;
	}
	.ground-detail-contents img {
		width : 80px;
	}
	.ground-dtail-texts {
		margin-top : 10px;
	}
	.ground-detail-textmore {
		margin : 8px 2px 3px -2px;
		text-align : center;
	}
	.gorund-detail-textmore p {
		color : blue;
	}
	.ground-detail-size-texts {
		display : inline-block;
		width : 400px;
		margin : 10px 30px 0px;
	}
	.ground-detail-size-fieldtext, .ground-detail-size-formaltext {
		display :inline-block;
	}
	
	.formal-ground-size {
		width : 315px;
		height : 210px;
		margin-left : 72.5px;
	}
	.small-box {
		width : 17px;
		height : 10px;
		display : inline-block;
		margin : 0 0 0 15px;
	}
	.gray-box {
		background-color : #dedede;
	}
	.green-box {
		background-color: #466626;
	}
	.ground-detail-size-fieldtext p, .ground-detail-size-formaltext p{
		color : black;
		font-size : 10px;
		display : inline-block;
		margin-left : 3px;
	}
	.ground-detail-addr {
		margin-top : 30px;
	}
	.ground-detail-addr p {
		text-align : center;
	}
	.ground-notice {
		margin-left : 40px;
	}
	.ground-notice h2 {
		font-weight : 700px;
		letter-spacing : 3px;
		margin-bottom : 20px;
		margin-top : 20px;
	}
	ul {
		list-style-type : none;
		
	}
	.ground-notice-1 ul li, .ground-notice-3 ul li{
		margin :  0 0 10px -20px;
		font-size : 12px;
	}
	.ground-pics {
		margin : 20px 40px 0px 110px;
	}
	.payment, .back-to-list {
		display : inline-block;
		width : 200px;
		margin : 40px 8px 0;
	}
	.payment {
		margin-left : 360px;
	}
	.btn {
		height : 60px;
	}

  </style>
  <script>
 
  function res() {
     // location.href = "ground_info.do"
	 history.go(-1);
   }
  
  function res2() {
	  location.href = "ground_updating.do?ground_name="+ <%=admin%>
	// location.href = "ground_updating.do?"
  }

  </script>
</head>

<body>
<!-- Top menu -->
 	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content">
	<%if(session.getAttribute("admin") != null){ %>
		<jsp:include page="./menu_bar/sidemenuAdmin_bar.jsp" flush="true"></jsp:include>
	<%}%>
<!-- start main content -->
  <div class="main col-sm-8"><br>
  	<div>
  		<h3>${vo.ground_Name}</h3>
  	</div>
  	 <div class="ground-pics col-sm-6">
    	<div class="mySlides">
    		<div class="numbertext">1 / 3</div>
    			
    			<img src="<spring:url value='/image/${vo.photo1}' />" style="width:100%" />   			
  			</div>

			  <div class="mySlides">
			    <div class="numbertext">2 / 3</div>
			    <img src="<spring:url value='/image/${vo.photo2}' />" style="width:100%" />
			  </div>

			  <div class="mySlides">
			    <div class="numbertext">3 / 3</div>
			    <img src="<spring:url value='/image/${vo.photo3}' />" style="width:100%" />
			  </div>
    
			  <a class="prev" onclick="plusSlides(-1)">❮</a>
			  <a class="next" onclick="plusSlides(1)">❯</a>

			  <div class="caption-container">
			    <p id="caption"></p>
			  </div>

			  <div class="row">
			    <div class="column">
			     <img class="demo cursor" src="<spring:url value='/image/${vo.photo1}'/>" style="width:100%" onclick="currentSlide(1)">
			    </div>
			    <div class="column">
			      <img class="demo cursor" src="<spring:url value='/image/${vo.photo2}'/>" style="width:100%" onclick="currentSlide(2)">
			    </div>
			    <div class="column">
			      <img class="demo cursor" src="<spring:url value='/image/${vo.photo3}'/>" style="width:100%" onclick="currentSlide(3)">
			    </div>
  			  </div>
  <script>
  var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  var captionText = document.getElementById("caption");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	  captionText.innerHTML = dots[slideIndex-1].alt;
	}
  </script>
  </div>
  <div class="ground-detail col-sm-6">
  	<div class="ground-detail-contents col-sm-12">
  		<div class="ground-detail-icon col-sm-3"><img src="https://www.iamground.kr/img/icons/chun.png"></div>
  		<div class="ground-detail-icon col-sm-3"><img src="https://www.iamground.kr/img/icons/jo.png"></div>
  		<div class="ground-detail-icon col-sm-3"><img src="https://www.iamground.kr/img/icons/ju.png"></div>
  		<div class="ground-detail-icon col-sm-3"><img src="https://www.iamground.kr/img/icons/sh.png"></div>
  	</div>
  	<div class="ground-detail-texts col-sm-12" id="ground_print">
  		<div class="ground-detail-textmore col-sm-3"><p>${vo.grass }</p></div>
  		<div class="ground-detail-textmore col-sm-3"><p>${vo.light }</p></div>
  		<div class="ground-detail-textmore col-sm-3"><p>${vo.parking }</p></div>
  		<div class="ground-detail-textmore col-sm-3"><p>${vo.shower }</p></div> 
  	</div>
  	
  	<div class="ground-detail-size col-sm-12">
  		<div class="ground-detail-size-pics">
  			<img class="formal-ground-size" src="https://www.iamground.kr/img/sample/ssize.jpg">
  		</div>
  		<div class="ground-detail-size-texts col-sm-12">
			<div class="ground-detail-size-fieldtext col-sm-6">
				<div class="gray-box small-box"></div>
				<p>경기장${vo.ground_size }</p>
			</div>
			<div class="ground-detail-size-formaltext col-sm-6">
				<div class="green-box small-box"></div>
				<p>정규 규격(105 x 70)</p>
			</div>  			
  		</div>
  	</div>
  	<div class="ground-detail-addr col-sm-12">
  		<p>${vo.ground_addr} </p>
  		<p>${vo.ground_city }</p>
  	</div>
  </div>
  <!-- end main content -->
  <div class="button-container">
  	<div class="payment"><button class="btn btn-success">결제하기</button></div>
  	<div class="back-to-list"><button class="btn btn-success" onclick="res()">목록으로</button></div>
  	<%if(session.getAttribute("admin") !=null){ %>
  	<div class="back-to-list"><button class="btn btn-success" onclick="res2()">경기장 수정</button></div>
  	<%} %>
  </div>
  </div>
</div>
<!-- main contents end -->
</body>
</html>