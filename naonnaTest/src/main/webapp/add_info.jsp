<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String forPerson = (String)request.getAttribute("forPerson");
// 	out.println("<script>");
// 	out.println("alert("+ forPerson +")");
// 	out.println("</script>");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertUserInfo.do" method = "POST">
<input type="hidden" name="forPerson" value=' <%=forPerson %> ' />
<label>닉네임</label> <input id="nickname" name="nickname" type="text" size="20" placeholder="사용하실 닉네임을 적어주세요"/>
<select name="city" id="act_city">
										<option value=''>구 선택</option>									
										<option>강남구</option>
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
<label>이메일</label> <input name="email" type="email" placeholder="이메일을 적어주세요."/>
<label>성별</label> 
<input id="gender" name="gender" type="radio" value="남">남
<input id="gender" name="gender" type="radio" value="여">여
<label>생년월일</label> <input id="birth" name = "age" type="number" size="4" placeholder="나이를 적어주세요"/>	
<input type="submit">
<input type="reset">
</form>
</body>
</html>