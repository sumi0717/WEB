<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${isSuccess }">
		<p>업로드 되었습니다 <a href="../list.do">목록 보기</a></p>
	</c:when>
	<c:otherwise>
		<p>업로드 실패! <a href="upload_form.do">업로드 하기</a></p>
	</c:otherwise>
</c:choose>
</body>
</html>


