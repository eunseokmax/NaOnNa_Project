<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<% 
	String nickname = (String)request.getAttribute("nickname");	
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
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>
  <style>
  td {
  
   text-align : center;
  
  }
  
     .main {
        height : 700px;
        display : relative;
     }
     .team-filter {
        margin : 47px 0 20px 5px;
        height : 80px;
        border : 1px solid black;
     }
     .team-filter-row {
        width : 1080px;
        display : absolute;
        margin : 5px 20px 5px 0px;
     }
     .team-filter-name{
        width : 120px;
        height : 40px;
        margin : 20px 20px 30px 15px;
        padding : 6px;
        display : inline-block;
        background-color : black;
        vertical-align : center;
     }
     .team-filter-name h4 {
        text-align : center;
        height : 100%;
        color : white;
        font-size : 14px;
        letter-spacing : -1px;
        margin : 10px 10px 0 10px;
     }
     .team-filter-name input {
        display : inline;
        width : 100px;
        height : 40px;
        margin : 20px;
     }
     .team-filter-value {
        display : inline-block;
     }
     .success th {
        text-align : center;
     }
     .container-page {
        margin : 50px auto;
        padding-left : 400px;   
        display : inline;
     }
     
     .team-list {
     	float : left;
     }
     
     .team-search {
     	float : left;
     }
   
     button {
        width : 110px;
        display : inline-block;

     }
     .table {
        margin-top : 40px;
     }
     
/* 팀생성 모달 */
#team_create{
	float: right;
	border: none;
	outline:0; /* 버튼 누르고 나서 테두리 없애기 위해 */
  	margin-right: 50px;
  	margin-bottom: 20px;
  	display: inline-block;
  	padding: 8px;
  	color: white;
  	background-color: #000;
  	text-align: center;
  	cursor: pointer;
  	width: 10%;
  	font-size: 18px;
}
#team_create:hover{
	color:white;
	background-color: #2c2d28;
}
#TeamModal {
    display: none;
    position: fixed;
    width: 100%;
    background-color: rgba(67, 68, 64, 0.4);
    padding-top: 60px;  /*top으로 부터 얼마나 띄울지*/
}
/* 모달바디 */
.team_title{
	font-family: sans-serif;
	font-size: 20px;
	margin-left: 45%;
}
#team_close{
	margin-top: 3px;
	margin-right: -45px;
	outline: none;
}
.create_modal_table{
	border: 1px solid silver;
  	border-left-style: none;
  	border-right-style: none;
  	width: 100%;
  	margin-top: 20px;
  	margin-bottom: 20px;
  	table-layout: fixed;
  	border-collapse: collapse;
}
.modal-body {
	height : 550px;
}
.table_row{
 	border-bottom : 1px solid silver; 
} 
.table_menu{
	background-color: #F9F6F6;	
  	text-align: center;
  	width:30%;
  	height: 60px;
}
.table_contents{
  	padding: 10px;
  	font-size: 13px;
  	width:70%;
  	height: 60px;
}
#city{
	padding: 10px;
  	font-size: 13px;
  	width:100%;
  	float:left;
  	height: 40px;
}
.table_contents input[type="text"]{
	width:100%;
	height: 40px;
	padding-left: 10px;
}
.team_text{
	width:100%;
	height: 90px;
	padding-left: 10px;
}
button[name="create"], [name="reset"]{
	float: right;
	border: none;
	outline:0; /* 버튼 누르고 나서 테두리 없애기 위해 */
  	margin-right: 50px;
  	margin-top: 5px;
  	padding: 8px;
  	margin: 5px;
  	color: white;
  	background-color: #000;
  	text-align: center;
  	cursor: pointer;
  	width: 100px;
  	font-size: 12px;
}




  </style>
  
  <script>
	$(document).ready(function() {
		 function printTeam() {
				$('#team_print').empty();
				$.ajax({
					url:'/naonnaTest/getTeamlistJSON.do',
					type:'POST',
					dataType: "json",
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
					success:function(data) {
						$.each(data, function(index, team) {
							var output = '';
							output += '<tr>';
							output += '<td> <a link href="team_detail.do?team_name='+team.team_name + '">' + team.team_name  + '</td>';
							output += '<td>' + team.area + '</td>';
							output += '<td>' + team.nickname + '</td>';
							output += '<td>' + team.ability + '</td>';
							output += '<td>' + team.number_team + '</td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#team_print').append(output);
						});
					},
					error:function() {
						alert("새로고침을 눌러주세요.")
					}
				}); // ajax
			} // printTeam function
			
			
			$('#target').click(function (){ 
				
				goFindteam();			
			}); //target
			
		
			function goFindteam() {
				
				$.ajax({
					url:'/naonnaTest/getTeamfindJSON.do',
					type:'POST',
					dataType: "json",
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',		
					data:{							
							'team_name':$('#teamid').val(),
							'area': $('#address').val(),
							'nickname' : $('#capid').val()							
						},	
						
				success:function(data) {
				
					$('#team_print').html('');		//기존 것 날려주고..
					
					$.each(data, function(index, team) {		//새로 뿌리기
						var output = '';
						output += '<tr>';
						output += '<td> <a link href="team_detail.do?team_name='+team.team_name + '">' + team.team_name  + '</td>';
						output += '<td>' + team.area + '</td>';
						output += '<td>' + team.nickname + '</td>';
						output += '<td>' + team.ability + '</td>';
						output += '<td>' + team.number_team + '</td>';
						output += '</tr>';
						console.log("output:" + output);
						$('#team_print').append(output);
						
					});
					console.log(data);
				},
				error:function() {
					alert("ajax통신 findteam실패!!");
				}
			});	
										
		}				
			
	
			printTeam();
			
		  
		$('#target2').click(function (){
			printTeam();
		});
		 

});
	
</script>
  
</head>

<body>
 	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content">
		<jsp:include page="./menu_bar/sidemenu_bar.jsp" flush="true"></jsp:include>
   
   <!-- start main content -->
   
     <div class="main col-sm-8"><br>
     
     <!--  team filter start -->
     
        <div class="team-filter">
        
           <div class="team-filter-row">
              <div class="team-filter-name bg-dark"><h4> 팀 명 </h4></div>
              <div class="team-filter-value"><input type="text" class="form-control" id="teamid" placeholder="팀의 이름을 입력하세요." autofocus></div>
              
              
              <div class="team-filter-name"><h4> 팀 활동 지 역 </h4></div>
              <div class="team-filter-value">
               <form class="form-selection">
                  <select class="form-control" id="address">
                  	 <option value=''>선택사항</option>
                     <option >강남구</option>
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
               </form>
            </div>
              <div class="team-filter-name"><h4> 주장 닉네임 </h4></div>
              <div class="team-filter-value"><input type="text" class="form-control" id="capid" placeholder="주장의 닉네임을 입력하세요."></div>
           </div>
           
           
        </div>
        <div class="team-list">
        	<button type="button" class="btn btn-search-list" id="target2">목록 리스트</button>
        </div>
        
        <div class="team-search">
        	<button type="button" class="btn btn-search-select" id="target">팀 검색</button>
        </div>
        
        <!-- team filter end -->
        
        <div class="container-board">
           <button id="team_create" type="button" data-toggle="modal" data-target="#TeamModal">팀생성</button>
 				<div class="modal fade" id="TeamModal" role="dialog">
          			<div class="modal-dialog">
            			<div class="modal-content">
            				<div class="modal-body">
           						<span class="team_title">팀생성</span>
           						<button type="button" id="team_close" class="close" data-dismiss="modal">&times;</button>     
           						
           						<form id="multiform" action="insertTeam.do" method="post" enctype="multipart/form-data">
           						<table class="create_modal_table" >
           							<tr class="table_row">
           								<td class="table_menu">팀명</td>
           								<td class="table_contents"><input type="text" placeholder="Enter Team Name" name ="team_name" required></td>
           								<!--중복확인 넣기-->
           							</tr>          						
           							<tr class="table_row">
           								<td class="table_menu">닉네임</td>
           								<td class="table_contents"><input type="text" name="nickname"required></td>
           							</tr>
           							<tr class="table_row">
           								<td class="table_menu">위치</td>
           								<td class="table_contents">
           									<form action="#">
												<select name="area" class="custom-select mb-3" id="city">
													<option value=''>지역 선택</option>
													<option value="강동구">강동구</option>
													<option value="강북구">강북구</option>
													<option value="강서구">강서구</option>
													<option value="관악구">관악구</option>
													<option value="광진구">광진구</option>
													<option value="구로구">구로구</option>
													<option value="금천구">금천구</option>
													<option value="노원구">노원구</option>
													<option value="도봉구">도봉구</option>
													<option value="동대문구">동대문구</option>
													<option value="동작구">동작구</option>
													<option value="마포구">마포구</option>
													<option value="서대문구">서대문구</option>
													<option value="서초구">서초구</option>
													<option value="성동구">성동구</option>
													<option value="성북구">성북구</option>
													<option value="송파구">송파구</option>
													<option value="양천구">양천구</option>
													<option value="영등포구">영등포구</option>
													<option value="용산구">용산구</option>
													<option value="은평구">은평구</option>
													<option value="종로구">종로구</option>
													<option value="중구">중구</option>
													<option value="중랑구">중랑구</option>
												</select>
											</form>
           								</td>
           							</tr>
           							<tr class="table_row">
           								<td class="table_menu">연령</td>
           								<td class="table_contents"><input type="text" placeholder="Enter Age" name="age" required></td>
           							</tr>
           							<tr class="table_row">
           								<td class="table_menu">엠블럼</td>
           								<td class="table_contents"><input type="file" placeholder="put in your emblem" name="emblem2" required></td>
           							</tr>
           							<tr class="table_row">
           								<td class="table_menu">실력</td>
           								<td class="table_contents"><input type="text" placeholder="Enter Level" name="ability" required></td>
           							</tr>
           							<tr class="table_row">
           								<td class="table_menu">인원</td>
           								<td class="table_contents"><input type="text" placeholder="Enter Number of Team" name="number_team" required></td>
           							</tr>
           							<tr class="table_row">
           								<td class="table_menu">팀소개</td>
           								<td class="table_contents">
           								<textarea class="team_text" name="intro" ></textarea>
           								</td>
           							</tr>
           						</table>
           						
           						<button type="submit" name="create">Create</button>
                				<button type="reset" name="reset">Reset</button>
                				</form>
                			</div>
                		</div>
                	</div>
                </div> 	
           
           <table class="table">
           <thead>
               <tr class="success">
                 <th>팀명</th>
                 <th>위치</th>
                 <th>팀 주장</th>
                 <th>실력</th>
                 <th>인원</th>
               </tr>
          </thead>
           <tbody class="table-body" id="team_print">
           		
           
              
           </tbody>
           </table>
        </div>
        
        <div class="container-page">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#">Previous</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item active"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
        
      </div>
           
     </div>
        
      <!-- main contents end -->
           
    </div>
      

</body>
</html>