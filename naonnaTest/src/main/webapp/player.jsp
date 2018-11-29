<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  	 .player-board-container {
  	 	margin-top : 15px;
  	 }
  	 .player-board-container h3 {
  	 	font-weight : 700;
  	 	display : inline-block;
  	 }
  	 .player-table-container {
  	 	margin-top : 80px;
  	 }
  	 .table {
  	 	margin-top : 30px;
  	 }
     .table thead td, .table tbody td:first-child, .table tbody td:nth-child(2), table tbody td:nth-child(3), table tbody td:nth-child(4) {
     	text-align : center;
     }
   
   	 #right {
   	 	margin-top : 20px;
   	 	float : right;
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
			<div class="player-board-container col-sm-12">
				<div class="player-nameboard col-sm-12">
					<h3>용병 모집/등록</h3>
					<span id="right"><button class="wirte-button btn btn-success">글쓰기</button></span>
				</div>
				<div class="player-table-container">
					<table class="player-table table table-striped table-hover">
						<thead>
							<tr>
								<td>종류</td>
								<td>제목</td>
								<td>작성자</td>
								<td>등록날짜</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>용병출전</td>
								<td>어제 좆두 드리블 가르쳐주고 왔습니다 ㅎㅎ</td>
								<td>붉은다리제프</td>
								<td>2018.08.05</td>
							</tr>
							<tr>
								<td>용병출전</td>
								<td>메시랑 1:1 해서 메시울리고옴 ㅠ 미안;</td>
								<td>카밀</td>
								<td>2018.08.05</td>
							</tr>
							<tr>
								<td>용병모집</td>
								<td>씨가랑 쓰루패스, 하이스피드 배우신분만</td>
								<td>져보고싶다</td>
								<td>2018.08.05</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- main contents end -->
	</div>


</body>
</html>