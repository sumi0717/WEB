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
	<h1>Game</h1>
	<p>게임이다냥 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam eaque iusto voluptatibus sunt est odit vitae laboriosam officia delectus facere accusamus vero quas nemo aliquam cupiditate veniam similique eum fugiat.</p>
</div>
</body>
</html>