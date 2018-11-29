<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%@ page import="com.spring.naonnaTest.team.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<% request.setCharacterEncoding("utf-8"); %> 
 
 <% 
 	TeamVO vo = (TeamVO)request.getAttribute("vo");
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
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aecd4acbce2512282f0d82282be7ebb3"></script>
  <!-- <link rel="stylesheet" href="naonna_main.css"> -->
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>
  <style>
  .team-detail {
  	border : 1px solid black;
  	margin-top : 47px;
  }
  .page_name {
  	border-bottom : 1px solid black;
  }
  .page_name h2 {
  	font-weight : 900;
  }
 
  .team-name-container {
  	margin : 20px;
  }
   #team-name{
  	font-weight : 800;
  }
  .team-detail-container {
  }
  .team-detail-contents {
  	padding : 10px;
  }
  .team-join-button {
  	float : right;
  	height : 50px;
  	width : 160px;
  	margin-top : 30px;
  }
  .team-join-button p{
  	font-size : 16px;
  	font-weight : 800;
  	margin : 6px 0;
  	letter-spacing : 3px;
  }
  .table td:first-child {
  	width : 140px;
  	text-align : center;
  }
  .table td:nth-child(2){
  	padding : 9px 0 0 30px;
  }
  </style>
  
</head>

<body>
 	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content">
		<jsp:include page="./menu_bar/sidemenu_bar.jsp" flush="true"></jsp:include>
   
   <!-- start main content -->
     <div class="main col-sm-8"><br>
     <!-- team detail start -->
       <div class ="team-detail col-sm-12">
        <div class="page_name"><h2>팀 상세 보기</h2></div>
        <div class="team-detail-container col-sm-12">
           <div class="team-detail-header">
              <div class="team-name-container col-sm-4"><h3 id="team-name">${vo.team_name}</h3>
              	<img src="<spring:url value='./image/${vo.emblem}' />"/>
              </div>
              <div class="team-join-button btn btn-success"><p>팀 가입하기</p></div>
           </div>
           <div class="container team-detail-contents col-sm-12">
              <table class="table table-bordered table-striped table-hover">
                 <thead>
                    <tr>
                       <td> 위치 </td>
                       <td>${vo.area } </td>
                    </tr>
                 </thead>
                 <tbody>
                    <tr>
                       <td>  연령대 </td>
                       <td> ${vo.age } </td>
                    </tr>
                    <tr>
                       <td> 실력 </td>
                       <td> ${vo.ability } </td>
                    </tr>
                    <tr>
                       <td> 인원 </td>
                       <td> ${vo.number_team } </td>
                    </tr>
                    <tr>
                       <td> 팀 소개 </td>
                       <td> ${vo.intro }
                       </td>
                    </tr>
                 </tbody>
              </table>
           </div>
        </div>   
       </div>
      </div>
    </div>
    <!-- main contents end -->

</body>
</html>