<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- Top menu -->
  <nav class="navbar navbar-default navbar-fixed-top">
    <!-- Logo div -->
    <div class="navbar-header">
      <a class="navbar-brand" href="home.do">NAONNA</a>
    </div>
    <!-- Logo div end -->

    <!-- Main menu -->
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="ground_info.do">대관신청</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">매칭신청
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="matching_search.do">매칭 검색/등록</a></li>
            <li><a href="player_search.do">용병 모집/등록</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">팀관리
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="team_search.do">팀 검색/생성</a></li>
          </ul>
        </li>
        

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="notice.do">공지사항</a></li>
            <li><a href="faq.do">FAQ</a></li>
            <li><a href="qna.do">QnA</a></li>
          </ul>
        </li>

        <li><a href="#">자유게시판</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">관리메뉴
          <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#">회원관리</a></li>
            <li><a href="#">경기장 등록</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- Main menu end -->
  </nav>
  <!-- end of top menu -->
</body>
</html>