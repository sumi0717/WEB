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
	//셋어트리뷰트로 thisPage에 home이라는 문자열을 담아두면 
	request.setAttribute("thisPage", "home");
%>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
	<h1>Home</h1>
	<p>홈이다냥 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam eaque iusto voluptatibus sunt est odit vitae laboriosam officia delectus facere accusamus vero quas nemo aliquam cupiditate veniam similique eum fugiat.</p>
</div>
</body>
</html>