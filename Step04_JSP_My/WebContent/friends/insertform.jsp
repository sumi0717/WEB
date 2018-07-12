<%@page import="test.friends.dto.FriendsDto"%>
<%@page import="java.util.List"%>
<%@page import="test.friends.dao.FriendsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>friends/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<h3>친구 추가 폼</h3>
<form action="insert.jsp" method="post">
	<label for="name">이름</label>
	<input type="text" name="name" id="name" />
	<lable for="addr">주소</lable>
	<input type="text" name="addr" id="addr" />
	<button type="submit">추가</button>
	<button type="reset">취소</button>

</form>
</body>
</html>