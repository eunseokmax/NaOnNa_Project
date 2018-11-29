<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- 캘린더 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- 캘린더 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<!-- 캘린더 라이브러리-->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- 캘린더 라이브러리-->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naonna_main.css"> --%>

  <style>
  
     .matching-filter {
        width : 800px;
        height : 200px;
        margin : 45px 45px 45px 150px;
        padding : 30px 40 0px 30px;
        border : 1px solid black;
     }
     .matching-filter-name {
        width : 90%;
     }
     
     .subject-location {
        margin : 8px 0px 10px 8px;
        display : block;
     }
     
     .subject-location h3 {
        color : #252525;
        display : block;
        text-align : center;
        height : 60px;
        padding : 18px 0;
        margin : 8px;
        letter-spacing : 0.8px;
        font-size : 24px;
        width : 144px;
     }
     .filter-location {
        display : inline-block;
        width : 300px;
        padding : 20px 0px 10px 20px;
        margin-left : 20px;   
     }
     
     .filter-location h4 {
        font-size : 16px;
        color : black;
        display : inline;
        text-align : center;
        height : 50px;
        padding : 17px 0;
        margin : 8px;
     }
     .filter-location form {
        display :inline;
     }
     .filter-location select {
        height : 40px;
     }
     .btn {
        width : 100px;
        margin-bottom : 15px;
     }
     .create-matching{
        float : right;
     }
     .table th {
        text-align : center;
     }
     .table-body tr td {
        text-align : center;
        background-color : skyblue;
        border : 1px solid red;
        padding : 10px 5px;
        vertical-align : middle;
     }
     
/* 매칭생성 모달 */
#matching_create{
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
#matching_create:hover{
	color:white;
	background-color: #2c2d28;
}
#MatchingModal {
    display: none;
    position: fixed;
    width: 100%;
    background-color: rgba(67, 68, 64, 0.4);
    padding-top: 80px;  /*top으로 부터 얼마나 띄울지*/
}
.modal-content{
	height: 550px;
}

/* 모달바디 */
.matching_title{
	font-family: sans-serif;
	font-size: 20px;
	margin-left: 42%;
}
#matching_close{
	margin-top: 3px;
}
.matching_create_table{
  	border: 1px solid silver;;
  	border-left-style: none;
  	border-right-style: none;
  	width: 100%;
  	margin-top: 20px;
  	margin-bottom: 20px;
  	table-layout: fixed;
}
.table_row{
 	border-bottom : 1px solid silver; 
}
.table_menu{
	background-color: #F9F6F6;
  	padding: 20px;
  	text-align: center;
  	width:30%;
  	height:50px;
} 
#city{
	width:100%;
	height:40px;
}
#datepick{
	width:50%;
	height:40px;
}
.table_contents{
  	padding: 20px;
  	font-size: 13px;
  	height: 50px;
}
.table_contents input[type="text"]{
	width:100%;
	height: 40px;
	padding-left: 10px;
}
button[name="create"], [name="reset"]{
	float: right;
	border: none;
	outline:0; /* 버튼 누르고 나서 테두리 없애기 위해 */
  	margin-right: 50px;
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
		$(function() {
			var currentDate = new Date();
			//					var tomorrow = currentDate.setDate(currentDate.getDate()+1);
			$('input[name="datetimes"]').daterangepicker({

				singleDatePicker : true,
				//        		 		timePicker: true,
				showDropdowns : true,
				startDate : moment().startOf('hour'),
				minDate : currentDate,
				//    		     endDate: moment().startOf('hour').add(0, 'hour'),
				locale : {
					format : 'YYYY/M/DD hh:00'
				//         		    	format: 'YYYY/M/DD'

				}
			});
		});

		
		
		
		
		$(function() {
			$.ajax({
				url:'/naonnaTest/print_matching.do',
				type:'POST',
				dataType: "json",
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
				success:function(data) {
					
					$('#print_match').html('');		//기존 것 날려주고..		
					var output = '';
					$.each(data, function(
							index, match) {		//새로 뿌리기
						var d = new Date(match.playDate);
						var y = d.getFullYear();
						var m = (d.getMonth()+1);
						var da = d.getDate();
						var h = d.getHours();
						var mi = d.getMinutes();
						
						
						output += '<tr>';
						output += '<td>' + match.matchLocation + '</td>';
						output += '<td>' + y + '-' + m + '-' + da + '&nbsp' + h + ':' + mi + '</td>';
						output += '<td>' + match.homeTeam + '</td>';
						output += '<td>' + match.matchingID + '</td>';
						output += '<td>' + match.people + '</td>';
						output += '<td><button type="button" class="btn btn-success" id="match_want">신청</button></td>';
						output += '</tr>';
						console.log("output:" + output);
						
					});
					$('#print_match').html(output);
					console.log(data);
				},
				error:function() {
					alert("ajax통신 실패!!");
				}
			});
		});

		$(document).on('click', '#match_want', function() {
			alert('되니?!!!!');
		});

		$('#search_matching').click(function(){
			var matchingCity = $('#city').val();
	  		var matchDate = new Date($('#datePick').val());
	  		search_match(matchDate, matchingCity);
		});
		
	});
		
	function search_match(matchDate, matchingCity) {
		$.ajax({
			url:'/naonnaTest/searchMatching.do',
			type:'POST',
			dataType: "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			data:{	'matchLocation' : matchingCity,
					'playDate' : matchDate},
			
			//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
			success:function(data) {
				
				$('#print_match').html('');		//기존 것 날려주고..
				
				$.each(data, function(index, match) {		//새로 뿌리기
					
					var d = new Date(match.playDate);
					var y = d.getFullYear();
					var m = (d.getMonth()+1);
					var da = d.getDate();
					var h = d.getHours();
					var mi = d.getMinutes();
					
					var output = '';
					output += '<tr>';
					output += '<td>' + match.matchLocation + '</td>';
					output += '<td>' + y + '-' + m + '-' + da + '&nbsp' + h + ':' + mi + '</td>';
					output += '<td>' + match.homeTeam + '</td>';
					output += '<td>' + match.matchingID + '</td>';
					output += '<td>' + match.people + '</td>';
					output += '<td><input type="button" class="btn btn-success" id="match_want">신청</td>';

					output += '</tr>';
					console.log("output:" + output);
					$('#print_match').append(output);
				});
				
				console.log(data);
			},
			error:function() {
				alert("ajax통신 실패!!");
			}	
		});
	}

</script>
</head>

<body>
 	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content">
		<jsp:include page="./menu_bar/sidemenu_bar.jsp" flush="true"></jsp:include>

		<!-- start main content -->

		<div class="main col-sm-8">
			<br>

			<!--  team filter start -->
			<div class="matching-filter">
				<div class="matching-filter-name">
					<div class="subject-location">
						<h3>매칭 검색</h3>
					</div>
					<div class="filter-location">
						<h4>위치</h4>
						<form action="#">
							<select name="location" class="custom-select mb-3" id="city">
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
					</div>
					<div class="filter-location">
						<h4>날짜</h4>
						<!--  시간 선택 API  -->
						<input type="text" id="datePick" name="datetimes" style="width: 55%" />
						<button type="button" class="btn btn-primary" id="search_matching">검색</button>

					</div>
				</div>

			</div>

			<div class="container-board">
				<button id="matching_create" type="button" data-toggle="modal" data-target="#MatchingModal">매칭생성</button>
					<div class="modal fade" id="MatchingModal" role="dialog">
          				<div class="modal-dialog">
            				<div class="modal-content">
            					<div class="modal-body">
            						<span class="matching_title">매 칭 등 록</span>
            						<button type="button" id="matching_close" class="close" data-dismiss="modal">&times;</button>
            						
            						<table class="matching_create_table">
      									<tr class="table_row">
      										<td class="table_menu">경기지역</td>
      										<td class="table_contents">
      											<form action="#">
													<select name="location" class="custom-select mb-3" id="city">
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
      										<td class="table_menu">경기일정</td>
      										<td class="table_contents"><input type="text" id="datePick" name="datetimes"/></td>
      									</tr>
      									<tr class="table_row">
      										<td class="table_menu">팀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
      										<td class="table_contents"><input type="text" placeholder="Enter Team Name" required></td>
      									</tr>
      									<tr class="table_row">
      										<td class="table_menu">매칭제목</td>
      										<td class="table_contents"><input type="text" placeholder="Enter Matching Title" required></td>
      									</tr>
      									<tr class="table_row">
      										<td class="table_menu">매칭인원</td>
      										<td class="table_contents"><input type="text" placeholder="Enter Matching Population" required></td>
      									</tr>
      								</table>
      								
      								<button type="submit" name="create">Create</button>
                					<button type="reset" name="reset">Reset</button>
            					</div>	
            				</div>
            			</div>
            		</div>
            				
				<table class="table">
					<thead>
						<tr class="success">
							<th>지역</th>
							<th>경기일정</th>
							<th>팀</th>
							<th>제목</th>
							<th>인원</th>
							<th>신청 버튼</th>							
						</tr>
					</thead>
					<tbody class="table-body" id="print_match">

					</tbody>
				</table>
			</div>
		</div>

		<!-- main contents end -->

	</div>


</body>
</html>