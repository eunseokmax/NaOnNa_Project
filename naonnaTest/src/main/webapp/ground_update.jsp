<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%@ page import="com.spring.naonnaTest.ground.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<% request.setCharacterEncoding("utf-8"); %> 
<%
String admin = (String)session.getAttribute("admin");		
String ground_name = (String)session.getAttribute("groundName");

if (session.getAttribute("admin") == null){
	out.print("<script>");
	out.print("alert('로그인해주세요');");
	out.print("location.href='home.do'");
	out.print("</script>");
}

%>

 <% 
 	GroundVO vo = (GroundVO)request.getAttribute("vo"); 	
 %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
   <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
</head>
<style>

	.button-container {
		float : right;
	}
	.form-group {
		font-size : 11px;
		font-weight : 400;
	}
	#multiform {
		border : 3px solid red;
	}
</style>
<body>
    <jsp:include page="./menu_bar/top_nav.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content">
		<jsp:include page="./menu_bar/sidemenuAdmin_bar.jsp" flush="true"></jsp:include>
		<!-- start main content -->
		<div class="main col-sm-8">
	<div class="inputform container col-sm-12">
		<div class="col-sm-8 col-sm-offset-4">
   			<h1>경기장 수정사항</h1>
   		</div>
		   <form class="form-horizontal" id="multiform" action="updateGround.do" method="post" enctype="multipart/form-data">
				<div class="ground-upload form-group">
		       	   <label for="inputGroundName" class="col-sm-2 control-label">${vo.ground_Name}</label>
			       <div class="col-sm-2">
     			       <input type="text" class="form-control" name="ground_Name" id="inputGroundName" placeholder="경기장이름">
    		       </div>
   		       	   <label for="inputGroundManagerName" class="col-sm-2 control-label">경기장관리자</label>
			       <div class="col-sm-2">
     			       <input type="hidden" class="form-control" name="ground_admin" id="inputGroundManagerName" placeholder="경기장관리자">
    		       </div>
		       	   <label for="inputGroundSize" class="col-sm-2 control-label">경기장사이즈</label>
			       <div class="col-sm-2">
     			       <input type="text" class="form-control" name="ground_size" id="inputGroundSize" placeholder="경기장사이즈">
    		       </div>
    		   </div>  
			   <div class="ground-upload form-group">
			       <label for="inputGroundCity" class="col-sm-2 control-label">경기장(구)</label>
			       <div class="col-sm-2">
     			       <select class="form-control" name="ground_city" id="sel2">
										<option value=''>구 선택</option>									
										<option>강남구</option>
										<option>강동구</option>
										<option>강북구</option>
										<option>강서구</option>
										<option>관악구</option>
										<option>광진구</option>
										<option>구로구</option>
										<option>금천구</option>
										<option>노원구</option>
										<option>도봉구</option>
										<option>동대문구</option>
										<option>동작구</option>
										<option>마포구</option>
										<option>서대문구</option>
										<option>서초구</option>
										<option>성동구</option>
										<option>성북구</option>
										<option>송파구</option>
										<option>양천구</option>
										<option>영등포구</option>
										<option>용산구</option>
										<option>은평구</option>
										<option>종로구</option>
										<option>중구</option>
										<option>중랑구</option>
									</select>
    		       </div>
		       	   <label for="inputGroundAddr" class="col-sm-2 control-label">경기장주소</label>
			       <div class="col-sm-4">
     			       <input type="text" class="form-control" name="ground_addr" id="inputGroundAddr" placeholder="경기장주소">
    		       </div>
		       	   
    		   </div> 
			   <div class="ground-upload form-group">
		       	   <label class="col-sm-2 control-label">잔디여부</label>
			       <div class="col-sm-3">
			           <div class="radio-inline">
			       		 <label>
						    <input type="radio" name="grass" id="optionsGrassRadios1" value="인조잔디" checked>
						   인조잔디
						  </label>
					   </div>
					   <div class="radio-inline">
						  <label>
						    <input type="radio" name="grass" id="optionsGrassRadios2" value="천연잔디">
						    천연잔디
						  </label>
					   </div>
    		       </div>
		       	   <label class="col-sm-1 control-label">샤워시설</label>
			       <div class="col-sm-2">
			           <div class="radio-inline">
			       		 <label>
						    <input type="radio" name="shower" id="optionsShowerRadios1" value="있음" checked>
						    있음
						  </label>
					   </div>
					   <div class="radio-inline">
						  <label>
						    <input type="radio" name="shower" id="optionsShowerRadios2" value="없음">
						    없음
						  </label>
					   </div>
    		       </div>
    		   </div>
    		   <div class="ground-upload form-group">
		       	   <label class="col-sm-2 control-label">주차장</label>
			       <div class="col-sm-2">
			           <div class="radio-inline">
			       		 <label>
						    <input type="radio" name="parking" id="optionsParkingRadios1" value="있음" checked>
						    있음
						  </label>
					   </div>
					   <div class="radio-inline">
						  <label>
						    <input type="radio" name="parking" id="optionsParkingRadios2" value="없음">
						    없음
						  </label>
					   </div>
    		       </div>
		       	   <label class="col-sm-2 control-label">조명</label>
			       <div class="col-sm-2">
			           <div class="radio-inline">
			       		 <label>
						    <input type="radio" name="light" id="optionsLightRadios1" value="있음" checked>
						    있음
						  </label>
					   </div>
					   <div class="radio-inline">
						  <label>
						    <input type="radio" name="light" id="optionsLightRadios2" value="없음">
						    없음
						  </label>
					   </div>
    		       </div>
    		   </div> 
    		   <div class="ground-upload form-group">
		       	   <label for="inputGroundWeek_morning" class="col-sm-2 control-label">주간오전요금</label>
			       <div class="col-sm-2">
     			       <input type="text" class="form-control" name="week_morning" id="inputGroundWeek_morning" placeholder="주간오전요금">
    		       </div>
		       	   <label for="inputGroundWeek_Evening" class="col-sm-2 control-label">주간오후요금</label>
			       <div class="col-sm-2">
     			       <input type="text" class="form-control" name="week_evening" id="inputGroundWeek_Evening" placeholder="주간오전요금">
    		       </div>
    		   </div>
    		   <div class="ground-upload form-group">
		       	   <label for="inputGroundWeek_morning" class="col-sm-2 control-label">주말오전요금</label>
			       <div class="col-sm-2">
     			       <input type="text" class="form-control" name="weekend_morning" id="inputGroundWeek_morning" placeholder="주간오전요금">
    		       </div>
		       	   <label for="inputGroundWeekend_Evening" class="col-sm-2 control-label">주말오후요금</label>
			       <div class="col-sm-2">
     			       <input type="text" class="form-control" name="weekend_evening" id="inputGroundWeekend_Evening" placeholder="주말오전요금">
    		       </div>
    		   </div>
    		   <div class="ground-upload form-group">
		       	   <label for="inputGroundRule" class="col-sm-2 control-label">이용규칙</label>
			       <div class="col-sm-2">
     			       <input type="text" class="form-control" name="rule" id="inputGroundRule" placeholder="이용규칙">
    		       </div>
		       	   <label for="inputGroundPeople" class="col-sm-2 control-label">수용인원</label>
			       <div class="col-sm-2">
     			       <input type="text" class="form-control" name="ground_people" id="inputGroundPeople" placeholder="수용인원">
    		       </div>
    		   </div>     
		       <div class="ground-upload form-group">
		       	   <label for="inputFile1" class="col-sm-2 control-label">경기장사진1</label>
			       <div class="col-sm-6">
     			       <input type="file" class="form-control" name="imgfile1" id="inputFile1">
    		       </div>
    		   </div>
    		   <div class="ground-upload form-group">
		       	   <label for="inputFile2" class="col-sm-2 control-label">경기장사진2</label>
			       <div class="col-sm-6">
     			       <input type="file" class="form-control" name="imgfile2" id="inputFile2">
    		       </div>
    		   </div>
    		   <div class="ground-upload form-group">
		       	   <label for="inputFile3" class="col-sm-2 control-label">경기장사진3</label>
			       <div class="col-sm-6">
     			       <input type="file" class="form-control" name="imgfile3" id="inputFile3">
    		       </div>
    		   </div>
		       <div class="button-container"><input class="btn btn-success" type="button" value="등록" onclick="fnAction('insertGround.do')"/></div>
		   </form>
		   
   <script>
      function fnAction(url) {
         var frm = document.getElementById("multiform");
         frm.action = url;
         frm.submit();
      }
   </script>
   </div>
     </div>
   </div>
</body>
</html>