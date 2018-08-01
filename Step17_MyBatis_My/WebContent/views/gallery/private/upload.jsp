<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallery/private/upload.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${isSuccess }">
	<p>사진을 업로드 했습니다</p>
	<a href="../list.do">목록 보기</a>
	</c:when>
	<c:otherwise>
	<p>사진 업로드 실패!</p>
	<a href="../list.do"></a>
	</c:otherwise>
</c:choose>

</body>
</html>

