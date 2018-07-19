<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test03.jsp</title>
</head>
<body>
<%
	//test를 위해 "jumsu"라는 키값으로 숫자 담아 놓기
	request.setAttribute("jumsu", 85);
%>
<h3> jstl에서 java의 switch문과 유사한 구문이 있다</h3>
<c:choose>
	<c:when test="${jumsu ge 90 }">
		<p>점수는 ${jumsu }이고 성적은 A 입니다</p>
	</c:when>
	<c:when test="${jumsu ge 80 }">
		<p>점수는 ${jumsu }이고 성적은 B 입니다</p>
	</c:when>
	<c:when test="${jumsu ge 80 }">
		<p>점수는 ${jumsu }이고 성적은 C 입니다</p>
	</c:when>
	<c:when test="${jumsu ge 60 }">
		<p>점수는 ${jumsu }이고 성적은 D 입니다</p>
	</c:when>
	<c:otherwise>
		<p>점수는 ${jumsu }이고 성적은 F 입니다</p>
	</c:otherwise>
</c:choose>
<%
	//test를 위해 로그인 정보를 session에 담기
	//session.setAttribute("id", "gura");
%>


<c:choose>
	<c:when test="${not empty id }">
		<p>${id }님 있는 중</p>
	</c:when>
	<c:otherwise>
		<form action="login.jsp">
			<input type="text" placeholder="아이디 입력" />
			<button type="submit">로그인</button>
		</form>
	</c:otherwise>
</c:choose>

	
</body>
</html>