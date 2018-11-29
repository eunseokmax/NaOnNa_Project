<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aecd4acbce2512282f0d82282be7ebb3"></script>
<!-- <link href="assets/css/bootstrap-responsive.css" rel="stylesheet"> -->
<title>Insert title here</title>

<style>
	/* 바디 */
	body{
		background-color:#F2F2F2;
		margin:0;
	}
	
	/* 상단메뉴 */
	.mainMenu{
		background-color:red;
		/* width:100%; */
	}
	
	/* 바디컨테이너 */
	.mainbox{
		margin-left:10%;
		margin-right:10%;
	}
	
	/* 사이드메뉴 */
	.sideMenu{
		background-color:yellow;
		display:inline-block;
		/* width:19%; */
		margin:0;
	}
	
	/* 본문내용 */
	.bodyContents{
		background-color:blue;
		display:inline-block;
		/* width:80%; */
		margin:0;
	}
	
	/* 푸터 */
	.footer{
		background-color:#D8D8D8;
		/* width:100%; */
	}
	
	
</style>
</head>
<body>
	<nav class="mainMenu container col-sm-12">상단 메뉴부분</nav>
	
	
	
	
	<div class="container col-sm-12 mainbox">
		<div class="sideMenu container col-sm-3">사이드 메뉴</div>
		
		
		
		<div class="bodyContents container col-sm-9">본문 바디 내용</div>
	</div>
	
	
	
	
	<div class="footer container col-sm-12">footer</div>
	
</body>
</html>