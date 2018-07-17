<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<h3>회원 정보 입니다</h3>
<p>번호 : <strong><%=dto.getNum() %></strong></p>
<p>번호 : <strong>${dto.num }</strong></p>

<p>이름 : <storng><%=dto.getName() %></storng></p>
<p>이름 : <strong>${dto.name }</strong></p>

<p>이름 : <storng><%=dto.getAddr() %></storng></p>
<p>이름 : <strong>${dto.addr }</strong></p>
</body>
</html>