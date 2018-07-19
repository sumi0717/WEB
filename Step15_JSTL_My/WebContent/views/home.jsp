<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/views/home.jsp</title>
</head>
<body>
<%
	//공지사항 목록 얻어오기	
	List<String> msgs=(List<String>)request.getAttribute("msgsKey");
%>
<h3>home 페이지 입니다</h3>
<ul>
	<li><a href="member/list.do">회원 목록 보기</a></li>
</ul>

<h3>오늘의 공지 사항</h3>
<ul>
	<%for(String tmp:msgs){ %>
		<li><%=tmp %></li>
	<%} %>
</ul>
</body>
</html>