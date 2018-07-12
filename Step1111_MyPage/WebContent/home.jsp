<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test5/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
<%if(id!=null){ %>
	<p><strong><%=id %></strong> 님 로그인중...</p>
	<a href="users/logout.jsp">로그아웃</a>
<%}else{%>
	<a href="users/loginform.jsp">로그인</a>
<%}%>

<jsp:include page="navbar.jsp">
	<jsp:param value="home" name="thisPage"/>
</jsp:include>

<div class="container">
	<h1>Home</h1>
	<p>홈이다냥 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam eaque iusto voluptatibus sunt est odit vitae laboriosam officia delectus facere accusamus vero quas nemo aliquam cupiditate veniam similique eum fugiat.</p>
</div>
</body>
</html>