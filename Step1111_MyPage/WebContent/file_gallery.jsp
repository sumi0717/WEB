<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test5/game.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param value="game" name="thisPage"/>
</jsp:include>
<div class="container">
	<h1>File & Gallery</h1>
	<p>파일과 이미지를 자유롭게 업로드 하고 다운 받아 보세요</p>
</div>
</body>
</html>