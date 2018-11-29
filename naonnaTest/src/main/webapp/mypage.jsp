<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="utf-8">

<head>
  <!-- NAONNA -->
  <title>NAONNA 경기장예약 매칭 사이트 </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aecd4acbce2512282f0d82282be7ebb3"></script>
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>
  
  <script>
	$(document).ready(function() {
		
		$('#nickname').text('${info.nickname}');
		$('#nickname2').attr('value', '${info.nickname}');
		$('#nickname1').attr('value', '${info.nickname}');
		if('${info.teamName}' == "") {
			$('#teamname').text("현재 소속된 팀이 없습니다.");
		}
		else {
			$('#teamname').text('${info.teamName}');
		}
		
		$('#email').attr("value", '${info.email}');
		$('#gender').text('${info.gender}');
		$('#age').attr("value", '${info.age}');
		$('#city').attr("value", '${info.city}');
		
		if('${info.position}' == '') {
			$('#position').attr("placeholder", "뛰고싶은 포지션을 입력하세요");
		}
		else {
			$('#position').attr("value", '${info.position}');
		}
	
	});
</script>

<style>
   .mypage{
      width:100%;
   }
   .mypage_label{
      width: 25%;
      margin: 15px;
   }
   input[name="email"]{
      width:178.4px;
      height:26px;
      margin-left:-2px;
   }
   .mypage_button{
      border: none;
      outline: 0;
      margin-top: 20px;
      display: inline-block;
      padding: 8px;
      color: white;
      background-color: #000;
      text-align: center;
      cursor: pointer;
      width:55%;
      font-size: 18px;
   }
</style>
</head>

<body>
    <jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
   <!-- main contents -->

   <div class="container-content">
      <jsp:include page="./menu_bar/sidemenu_bar.jsp" flush="true"></jsp:include>
      
  <!-- start main content -->
 
   <!-- start mypage_body -->
     <div class="col-sm-8">
      <div class="container mypage">
         <div class="mypageTitle">
            <h3>My Page</h3><hr>
         </div>
         <div>
         <form id="mypageForm" action="update_profile.do" method="post" enctype="multipart/form-data">
               <div>
               <input type="hidden" name="nickname" id="nickname1">
               <input type="hidden" name="kakao_Id">
               <label class="mypage_label">프로필 이미지 :</label> 
               		<span><input type="file" name="imgfile" /> </span>   
               		<input type="submit" value="사진 변경 " />  
        </form>
            <form id="mypageForm" action="update_userinfo.do" method="post">
               <div>
               <input type="hidden" name="kakao_Id">
               <input type="hidden" name="nickname" id="nickname2">
                  <label class="mypage_label">Nickname</label> 
                  <span name="nickname" id = "nickname"> </span> 
               </div>
               <div>
                  <label class="mypage_label">E-mail</label> 
                  <input type="email" name="email" id="email"> 
               </div>
               <div>
                  <label class="mypage_label">Location</label> 
                  <input type="text" name="city" id = "city"> 
               </div>
               <div>
                  <label class="mypage_label">Gender</label> 
                  <span name="gender" id="gender"> </span> 
               </div>
               <div>
                  <label class="mypage_label">Age</label> 
                  <input type="number" name="age" id="age"> 
               </div>
               <div>
                  <label class="mypage_label">Team name</label> 
                  <span name ="teamName" id = "teamname"> </span> 
               </div>
               <div>
                  <label class="mypage_label">Position</label> 
                  <input type="text" name="position" id="position"> 
               </div>   
               <div>
                  <button type="submit" class="mypage_button">회원정보 변경</button>
               </div>
            </form>
         </div>
      </div>
   </div>
  <!-- main body end -->
 </div>
</body>

</html>