<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<title>/views/users/login.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${isLoginSuccess }">
	<p><strong>${id }</strong> 님 로그인 되었습니다</p>
	<a href="${url }">확인</a>
	</c:when>
	<c:otherwise>
	<p> 아이디 혹은 비밀번호가 틀려요</p>
	<a href="loginform.do?url=${url }">확인</a>
	</c:otherwise>
</c:choose>


</body>
</html>