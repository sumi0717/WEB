<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<c:if test="${not empty id }">
	<p> <strong><a href="users/private/info.do">${id }</a></strong> 님 로그인 중...</p>
	<a href="users/logout.do">로그아웃</a>
</c:if>

<ul>
	<li><a href="users/signup_form.do">회원가입</a></li>
	<li><a href="users/loginform.do?url=${pageContext.request.contextPath }/index.jsp">로그인</a></li>
							<!--  /Step08_Auth_My/index.jsp  -->
	<li><a href="market/buy.do">상품 구입</a></li>
	<li><a href="market/buy2.do">상품 구입2</a></li>
	<li><a href="market/buy3.do">상품 구입3</a></li>
</ul>
</body>
</html>