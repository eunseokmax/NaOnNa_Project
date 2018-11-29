<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		
		<!-- include summernote css/js -->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script>
		$(document).ready(function() {
			 $('.summernote').summernote({
		          height : 300,
		          minHeight : null,
		          maxHeight : null,
		          focus : false,
		          lang : 'ko-KR'
		        });
		});
	</script>
	<style>
	
		.writing-container {
			background-color : red;
			margin : 120px 0 0 0;
		}
		.writing-headname {
			background-color : white;
			margin : 20px 0; 
		}
		.head-blank label, .head-blank input {
			display : inline-block;
		}

	</style>
</head>
	<body>
		<jsp:include page="./menu_bar/top_nav.jsp" flush="true"></jsp:include>
		<div class="container-content">
			<jsp:include page="./menu_bar/side_menubar.jsp" flush="true"></jsp:include>
			<div class="main col-sm-8">
				<div class="writing-form col-sm-12">
				<div class="writing-headname">
					<div class="head-blank form-group">
						<input type="text" class="form-control" id="writing-title">
					</div>
				</div>
				<div class="summernote"></div>
  				<button id="altim" class="btn btn-primary" onclick="showingz()" type="button">알림</button>
		  <script>
		      var showingz = function() {
		        var sHTML = $('.summernote').summernote('code');
		        alert(sHTML);
		      };
  </script>
	  			</div>
  			</div>
  		</div>
	</body>
</html>