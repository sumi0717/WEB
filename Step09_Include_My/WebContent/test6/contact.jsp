<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test5/contact.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	request.setAttribute("thisPage", "contact");
%>
<jsp:include page="navbar2.jsp">
	<jsp:param value="contact" name="thisPage"/>
</jsp:include>
<div class="container">
	<h1>Contact</h1>
	<p>컨택트다냥 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam eaque iusto voluptatibus sunt est odit vitae laboriosam officia delectus facere accusamus vero quas nemo aliquam cupiditate veniam similique eum fugiat.</p>
</div>
</body>
</html>