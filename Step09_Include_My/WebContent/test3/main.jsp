<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/main.jsp</title>
<%@include file="../include_files/css_loading.jsp" %>
</head>
<body>
<%--
	include 시킬 때는 현재 물리적인 위치를 기준으로 상대 경로로
	include 시켜야 한다
 --%>
<%@include file="../include_files/header.jsp" %>
<div class="main">
	<h3>main 컨텐츠 입니다3</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
	Obcaecati fugiat accusamus nihil consectetur nam quis praesentium 
	in dolorem recusandae expedita officia voluptatum optio nisi! 
	Ab unde amet officiis quod adipisci.</p>
</div>
<%@include file="../include_files/footer.jsp" %>
</body>
</html>