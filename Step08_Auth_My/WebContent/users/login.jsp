<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.users.dao.UserDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>

	<p><strong>${answer }</strong></p>
	<a href="${url }">확인</a>

	<p>${answer2 }</p>
	<a href="loginform.do?url=${url }">확인</a>

</body>
</html>