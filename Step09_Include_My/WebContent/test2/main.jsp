<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test2/main.jsp</title>
</head>
<body>
<%
	//header.jsp에서 사용할 데이터를 main.jsp에서 전달하려면 ?
	
	//request에 담는다
	request.setAttribute("myName", "냠냐미");
	
%>
<%@include file="header.jsp" %>	
<div class="main">
	<h3>메인 컨텐츠입니다2</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
	Delectus velit ipsum debitis at id earum ducimus recusandae illo dolorum 
	necessitatibus amet beatae rem voluptas magni 
	corrupti! Ullam veritatis sit eius!</p>
</div>	
<%@include file="footer.jsp" %>
</body>
</html>