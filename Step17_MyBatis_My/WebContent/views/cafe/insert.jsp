<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/cafe/private/insert.jsp</title>
</head>
<body>
<h3>카페 새 글 저장 결과</h3>
<c:choose>
	<c:when test="${isSuccess }">
		<p>${id }님 새 글을 저장했습니다</p>
		<a href="../list.do">글 목록 보기</a>
	</c:when>
	<c:otherwise>
		<p>글 저장 실패!</p>
		<a href="insertform.do">글 다시 쓰기</a>
	</c:otherwise>
</c:choose>
</body>
</html>