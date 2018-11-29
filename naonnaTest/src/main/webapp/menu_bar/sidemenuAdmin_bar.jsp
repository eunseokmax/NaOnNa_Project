<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% 

 	String admin = (String)session.getAttribute("admin");			
	String ground_name = (String)session.getAttribute("groundName");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script>
  
    $(document).ready(function() {
    				
	         $('#ground_admin').blur(function(){
	        	if($('#ground_admin').val().leng<4){
	        		$('#adminHelper').text('아이디는 4자이상')
	        		$('#ground_admin').focus();
	        	}
	        	else{
	        		$('#adminHelper').text('');
	        		$('#ground_ad_pw').focus();
	        	}
	        	  
	          });
	          
	          $('#ground_ad_pw').blur(function(){
	        	  
	        	 if($('#ground_ad_pw').val() == ''){       				
	       			$('#ad_pwHelper').text('비밀번호가 공백입니다.');      		
	       			$('#ground_ad_pw').focus();
	       		}	        	  
	        	 else if($('#ground_ad_pw').val().leng<4){
	          		$('#ad_pwHelper').text('비밀번호는 4자이상')
	          		$('#ground_ad_pw').focus();
	          	}          	
	          	else{
	          		$('#ad_pwHelper').text('');	          		
	          	}
	          	  
	           }); 
	    	  
	    	  $('#ground_ad_pin').blur(function(){
	          	if($('#ground_ad_pin').val().length < 2){
	          		$('#ad_pinHelper').text('pin번호는 3자리입니다')
	          		$('#ground_ad_pin').focus();
	          	}
	          	else if ($('#ground_ad_pin').val() != 'aaa'){            		
	          		$('#ad_pinHelper').text('알려드린 pin번호를 입력하세요');
	          		$('#ground_ad_pin').focus();
	          	}
	          	else{
	            		$('#ad_pinHelper').text('');
	            		$('#ground_name').focus();
	            	}
	          	  
	           });
	                      
      });
  
    
      //end of kakao

      //start multiple modal
      
      $(function() { 
    	  return $(".modal").on("show.bs.modal", function() {
          var curModal;
          curModal = this;
          $(".modal").each(function() {
            if(this != curModal) {
              $(this).modal("hide");
            }
          });
        });

      });
      //end of multiple modal
     </script>  
     
      <script>
     //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
      var idck = 0;
      $(function() {
          //idck 버튼을 클릭했을 때 
          $("#idck").click(function() {
              
              //userid 를 param.
              var userid =  $("#admin").val(); 
              
              $.ajax({
                  async: true,
                  type : 'POST',
                  data : userid,
                  url : "idcheck.do",
                  dataType : "json",
                  contentType: "application/json; charset=UTF-8",
                  success : function(data) {
                      if (data.cnt > 0) {
                          
                          alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                         //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                         // $("#admin").addClass("has-error")
                         // $("#admin").removeClass("has-success")
                          $("#admin").focus();
                          
                      
                      } else {
                          alert("사용가능한 아이디입니다.");
                          //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                          //$("#admin").addClass("has-success")
                          // $("#admin").removeClass("has-error")
                          $("#password").focus();
                          //아이디가 중복하지 않으면  idck = 1 
                          idck = 1;
                          
                      }
                  },
                  error : function(error) {
                      
                      alert("error : " + error);
                  }
              });
          });
          

           $('#submitbut').click(function () {
             	//아이디공백체크
       			if($('#ground_admin').val() == ''){
       				$('#ground_admin').focus();
       				$('#adminHelper').text('아이디가 공백입니다.');
       				
       			
       			}//비밀번호 공백체크
       			else if($('#ground_ad_pw').val() == ''){
       				$('#ground_ad_pw').focus();
       				$('#ad_pwHelper').text('비밀번호가 공백입니다.');
       			
       			}//pin 공백체크
       			else if($('#ground_ad_pin').val() == ''){
       				$('#ground_ad_pin').focus();
       				$('#ad_pinHelper').text('pin번호가 공백입니다.');
       			}
       			else if($('#ground_name').val() == ''){
       				$('#ground_name').focus();
       				$('#ground_nameHelper').text('해당 경기장이름이 공백입니다.');
       			}
       			else {
       				 $('#joinForm').submit();
       			}       	       	  
               }); 
          });
        	             
	</script>   
      
 
  
</head>
<body>
  <!-- start main body -->
  <div class="container-content">
    <!-- side menu bar start -->
    <div class="side-profile col-sm-4">
      <div class="card">
        <!-- <img src="a1.jpg" alt="John" style="width:100%"> -->
        <img id="profileImage" src="/naonnaTest/resources/a1.jpg" alt="John" style="width:100%">
        <h1><%=admin %></h1> 안녕하세요 환영합니다.<br/>
        <!--로그인과 로그아웃 구분하기 하위 메뉴에 히든주기!!!!!!!!!!!!!! -->
				
				<p><a href="manager.do?admin=<%=admin %>" id="register">관리자페이지</a></p>				
				<p><a href="#" id="booking"></a></p>

        <!-- show login modal -->
        
		<%if(session.getAttribute("admin") == null){ %>
				<button id="login-button" type="button" data-toggle="modal" data-target="#LoginModal" name="login_btn">Login</button>
		<%}else{%>	
				<a href="logout_a.do">로그아웃</a>
		 <%} %>			
		<!-- Modal -->
		
        <div class="modal fade" id="LoginModal" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal">&times;</button>

				
                <ul class="nav nav-tabs nav-justified" name="login_select">
                  <li class="active"><a data-toggle="tab" href="#login_P">사용자 로그인</a></li>
                  <li><a data-toggle="tab" href="#login_A">관리자 로그인</a></li>
                </ul>

                <div class="tab-content">
                  <div id="login_P" class="tab-pane fade in active">
                    <div id="kakao-logged-group"></div>
                      <a id="custom-login-btn" href="javascript:loginWithKakao()" style="cursor:hand;"></a>
                  </div>
                  
				  <!-- 로그인 부분 -->
				  <form action="login_a.do" method="post">
                  <div id="login_A" class="tab-pane fade">
                    <label for="ground_admin"><b>Username</b></label>
                    <input type="text"  placeholder="Enter ID" name="ground_admin" required>
                    <label for="ground_ad_pw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="ground_ad_pw" required>
                    <button type="submit" name="login">Login</button>
                    <a href="#" data-toggle="modal" data-target="#JoinModal" name="join_btn">Join</a>
                  </div>
                  </form>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- end of login modal  -->

        <div class="modal fade" id="JoinModal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>Only for Ground_Admin!!!</h3>
              </div>

             <div class="modal-body">
                <div id="join">
                
					<!-- 회원가입 부분  -->
				  <form id="joinForm" action="joinAdmin.do" method="post">
				  
                  <label for="ground_admin"><b>Id</b></label>
                  <input type="text" id="ground_admin" name="ground_admin" placeholder="Enter id"  required>				 
				  <input type="button" value="중복확인" id="idck" >
				  <br/><span id="adminHelper"></span>
				  
                  <label for="ground_ad_pw"><b>Password</b></label>
                  <input type="password" id="ground_ad_pw" name="ground_ad_pw" placeholder="Enter Password" required>
                  <br/><span id="ad_pwHelper"></span>
                                                    
                  <label for="ground_ad_pin"><b>PIN</b></label>
                  <input type="password" id="ground_ad_pin" name="ground_ad_pin" placeholder="Enter PIN" required>
                  <br/><span id="ad_pinHelper"></span>
                                 
                  <label for="ground_name"><b>Ground Name</b></label>
                  <input type="text" id="ground_name" name="ground_name" placeholder="Enter Ground Name"  required>
                  <br/><span id="ground_nameHelper"></span>
                </div>
                </div>
              </div>

              <div class="modal-footer">
                <button type="button" id="submitbut" name="join" >Join</button>
                <button type="reset" name="reset">Reset</button>
              </div>
              </form> 
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- side menu bar end -->
</body>
</html>