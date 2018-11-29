<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aecd4acbce2512282f0d82282be7ebb3"></script>
  <!-- <link rel="stylesheet" href="naonna_main.css"> -->
  <style>
   	 .ds-btn li{ list-style:none; float:left; padding:10px; }
	 .ds-btn li a span{padding-left:15px;padding-right:5px;width:100%;display:inline-block; text-align:left;}
	 .ds-btn li a span small{width:100%; display:inline-block; text-align:left;}
   	 .btn-container {
   	 	margin-top : 40px;
   	 }
   	 .team-table, .away-table {
   	 	border : 1px solid black;
   	 }
   	 .team-table td:nth-child(odd), .away-table td:nth-child(odd) {
   	 	border : 3px solid black;
   	 	width : 30%;
   	 	text-align : center;
   	 }
   	 .vs-table {
   	 	margin-top : 20px;
   	 	border : 2px solid red;
   	 }
   	 .vs-table h1 {
   	 	text-align : center;
   	 	font-weight : 900;
   	 	color : red;
   	 }
   	 #page_title {
   	  	font-weight : 900;
   	 }
   	 .team-name {
   	 	text-align : center;
   	 }
   	 .team-name-p {
   	 	font-weight : 900;
   	 	background-color : black;
   	 	color : white;
   	 	padding : 20px 0;
   	 }
   	 .matching-detail-table {
   	 	margin-top : 40px;
   	 	border : 1px solid yellow;
   	 }
   	 .matching-detail-table tr {
   	 	height : 40px;
   	 	text-align : center;
   	 	font-weight : 600;
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
	<jsp:include page="./menu_bar/top_nav.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content container-fluid">
		<jsp:include page="./menu_bar/side_menubar.jsp" flush="true"></jsp:include>
		<!-- start main content -->
		<div class="main col-sm-8">
			<div class="player-board-container col-sm-12">
				<div class="player-nameboard col-sm-12"><h1 id="page_title">매칭 디테일</h1></div>
				<div class="player-table-container row justify-content-md-center col-sm-12">
					<div class="team-table col-sm-5 col-md-5 col-lg-5">
						<div class="team-name row"><h2 class="team-name-p">나온나</h2></div>
						<table class="matching-detail-table table-responsive table-striped table-condensed col-sm-12">
							<thead>
								<tr>
									<td>위치</td>
									<td>노원</td>
								</tr>
							</thead>
								<tr>
									<td>실력</td>
									<td>축신</td>
								</tr>
								<tr>
									<td>인원</td>
									<td>11명</td>
								</tr>
								<tr>
									<td>참가자</td>
									<td>김경우1 김경우1 김경우1 김경우1 김경우1 김경우1 김경우1 김경우1 김경우1 김경우1</td>
								</tr>
							<tbody>
							</tbody>
						</table>	
					</div>
					<div class="vs-table col-sm-2 col-md-2 col-lg-2">
						<h1>VS</h1>
					</div>
					<div class="away-table col-sm-5 col-md-5 col-lg-5">
						<div class="team-name row"><h2 class="team-name-p">나오니라</h2></div>
						<table class="matching-detail-table table-responsive table-striped table-condensed col-sm-12">
							<thead>
								<tr>
									<td>위치</td>
									<td>노원</td>
								</tr>
							</thead>
								<tr>
									<td>실력</td>
									<td>축신</td>
								</tr>
								<tr>
									<td>인원</td>
									<td>11명</td>
								</tr>
								<tr>
									<td>참가자</td>
									<td>김경우1 김경우1 김경우1 김경우1 김경우1 김경우1 김경우1 김경우1 김경우1 김경우1</td>
								</tr>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn-container col-md-11 col-md-offset-1">
					 <ul class="ds-btn">
					     <li>
					         
					         <i class="glyphicon glyphicon-road pull-left"></i><span>위치<br><small>노원구</small></span> 
					            
					     </li>
					     <li>
					         <i class="glyphicon glyphicon-user pull-left"></i><span>인원<br><small>11 vs 11</small></span> 
					    </li>
					    <li>
					         <i class="glyphicon glyphicon-time pull-left"></i><span>시간<br><small>18년 9월 1일 09시 30분</small></span> 
					    </li>
					    <li>
					        <a class="btn btn-lg btn-info" href="http://dotstrap.com/">
					        <span>매칭신청</span></a>
					    </li>
					</ul>
    
				</div>
			</div>
		</div>
		<!-- main contents end -->
	</div>


</body>
</html>