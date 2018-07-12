<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/main.jsp</title>
</head>
<body>
<!-- 여기 들어갈 작업 내용을 다른 곳에 작업 가능, 부분 마크업(header.jsp에서 작업)-->
<%@include file="header.jsp" %>

<div>
	<h3>메인 컨텐츠입니다1</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
	Soluta quae officia obcaecati ex aliquam aperiam repellendus sapiente magni 
	tempora quidem quaerat possimus. Atque quidem provident. 
	In suscipit ullam voluptate magni.</p>
	
</div>

<%@include file="footer.jsp" %>
<!-- 여기 들어갈 작업 내용을 다른 곳에 작업 가능, 부분 마크업(footer.jsp에서 작업)-->
<!-- 딱 들어갈 내용만 적기, 형식 완전하게 하면 이상해짐. 

		header.jsp
		main.jsp
		footer.jsp
		를 만들면
		실행시점에 3개가 합쳐져서
		하나의 서블릿이 된다.
		이 서블릿을 통해 request/response 된다.
	(코드만 따로 떨어져 있는 1개의 서블릿으로 보면 됨, 코드 병합돼서 작동됨)

-->
</body>
</html>