<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<!-- Top menu -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<!-- Logo div -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#myPage">Input NAONNALogo</a>
		</div>
		<!-- Logo div end -->

		<!-- Main menu -->

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#myPage">대관신청</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">매칭 신청 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">매칭 검색/등록</a></li>
						<li><a href="#">용병 모집/등록</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">팀 관리 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">팀 검색/생성</a></li>
						<li><a href="#">용병 모집/등록</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">고객센터 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">QnA</a></li>
					</ul></li>
				<li><a href="#tour">자유게시판</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">관리메뉴 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">회원관리</a></li>
						<li><a href="#">경기장 등록</a></li>
					</ul></li>
			</ul>
		</div>

		<!-- Main menu end -->

	</nav>
</body>
</html>