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

<%-- 
	navbar.jsp 페이지를 include하고
	thisPage라는 파라미터 명으로 home이라는 파라미터 값을
	전달할 수도 있다
	
	- 전달한 파라미터는 navbar.jsp 페이지에서
	request.getParameter("thisPage")해서 읽어올 수 있다
	
 --%>
 <%
	request.setAttribute("thisPage", "home");
%>
<jsp:include page="navbar2.jsp">
	<jsp:param value="home" name="thisPage"/>
</jsp:include>

<div class="container">
	<h1>Home</h1>
	<p>홈이다냥 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam eaque iusto voluptatibus sunt est odit vitae laboriosam officia delectus facere accusamus vero quas nemo aliquam cupiditate veniam similique eum fugiat.</p>
</div>
</body>
</html>