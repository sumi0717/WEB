<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/views/member/alert.jsp</title>
</head>
<body>
<%
	//request에 담긴 문자열 읽어오기
	String msg=(String)request.getAttribute("msg");
	String url=(String)request.getAttribute("url");
	//context 경로
	String cPath=request.getContextPath();
%>
<h3>알림 페이지</h3>
<p><%=msg %></p>
<a href="<%=cPath%><%=url%>">확인</a>
</body>
</html>