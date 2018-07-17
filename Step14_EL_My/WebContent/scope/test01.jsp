<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*

		[ 영역(scope) ]
		
		1. page 영역(scope)
		2. request 영역 - 응답하기 전까지 유지가 됨. 
		 - forward 이동 자체는 응답을 아직 안한것이기 때문에 유효. 
		 - redirect는 응답이기때문에 데이터 사라짐
		3. session 영역
		4. application 영역
		 - 서버를 껐다 킬때까지 살아있음.
		 
		=> 주로 쓰는 것은 request와 session 영역
		
	*/
	
	//page scope에 "myName"이라는 키값으로 String type 저장
	pageContext.setAttribute("myName", "김구라");
	//request scope에 "yourName"이라는 키값으로 String type 저장
	request.setAttribute("yourName", "원숭이");
	//session scope에 "ourName"이라는 키값으로 String type 저장
	session.setAttribute("ourName", "Acorn");
	//application scope에 "herName"이라는 키값으로 String type 저장
	application.setAttribute("herName", "신민아");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/scope/test01.jsp</title>
</head>
<body>

<p>myName=<strong>${pageScope.myName }</strong></p>
<p>myName=<strong>${myName }</strong></p> 
<!-- 이렇게만 써도 myName이란 키값을 찾아서 좁은 범위로 계속 파고 들어감 
	   뒤져서 해당 키값이 나오지 않으면 아무것도 출력하지 않음
	   jsp에서만 유효 -->

<p>yourName=<strong>${requestScope.yourName }</strong></p >
<p>yourName=<strong>${yourName }</strong></p>

<% 
// ${ourName}으로 대체할 수 있다. 
String ourName=(String)session.getAttribute("ourName"); 
%>
<p>ourName=<strong><%=ourName %></strong></p>
<!-- 자바코드로 쓰면 이렇게 됨 -->

<p>ourName=<strong>${sessionScope.ourName }</strong></p>
<p>ourName=<strong>${ourName }</strong></p>

<p>herName=<strong>${applicationScope.herName }</strong></p>
<p>herName=<strong>${herName }</strong></p>
</body>
</html>