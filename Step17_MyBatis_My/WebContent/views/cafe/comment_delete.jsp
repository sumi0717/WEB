<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코멘트 삭제 페이지</title>
</head>
<body>
<c:choose>
	<c:when test="${isSuccess }">
		<p>댓글을 삭제했습니다</p>
	</c:when>
	<c:otherwise>
		<p>댓글 삭제 실패!</p>
	</c:otherwise>
</c:choose>
<a href="/cafe/detail.do?num="+ref_group">글 목록 보기</a>
</body>
</html>