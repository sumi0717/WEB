<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/delete.jsp</title>
</head>
<body>
<p> 파일을 삭제 했습니다. </p>
<a href="${pageContext.request.contextPath }/file/list.jsp">확인</a>
</body>
</html>



