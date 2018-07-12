<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<%
	// context path 읽어오기
	String cPath=request.getContextPath();

	// session에 "id"라는 키값으로 담겨 있는 문자열을 읽어와 본다
	String id=(String)session.getAttribute("id");
	/*
		로그인 된 상태면 id에는 로그인한 회원의 아이디가 들어있고
		로그인 되지 않은 상태면 id에는 null이 들어 있다
	*/
%>
<h3>인덱스 페이지입니다</h3>
<%if(id!=null){ //id가 null이 아니라는 의미는, 
				//session에 id 키값으로 담겨있는 문자열이 있다는 뜻 
				// 즉, 로그인 중인 사람이 있다는 소리임%>
	<p> <strong><a href="users/private/info.jsp"><%=id %></a></strong> 님 로그인 중...</p>
	<a href="users/logout.jsp">로그아웃</a>
<%} %>
<ul>
	<li><a href="users/signup_form.jsp">회원가입</a></li>
	<li><a href="users/loginform.jsp?url=<%=cPath%>/index.jsp">로그인</a></li>
							<!--  /Step08_Auth_My/index.jsp  -->
	<li><a href="market/buy.jsp">상품 구입</a></li>
	<li><a href="market/buy2.jsp">상품 구입2</a></li>
	<li><a href="market/buy3.jsp">상품 구입3</a></li>
</ul>
</body>
</html>