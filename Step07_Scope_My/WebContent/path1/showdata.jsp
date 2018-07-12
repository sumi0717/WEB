<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/path1/showdata.jsp</title>
</head>
<body>
<%
	//request 영역에 "dto"라는 키 값으로 저장된 MemberDto type
	//객체의 참조값 얻어오기
	MemberDto dto=(MemberDto)request.getAttribute("dto");
	//request에서 setAttribute로 담은 값을 getAttribute로 얻어올 수 있음.
	//어떻게 담았는지 키값을 기억해야! 원래 객체 타입으로 온전히 get 해오려면
	// 해당 객체 원래 type으로 () Casting 해줘야한다.
%>
<p>번호 : <strong><%=dto.getNum() %></strong></p>
<p>이름 : <strong><%=dto.getName() %></strong></p>
<p>주소 : <strong><%=dto.getAddr() %></strong></p>
</body>
</html>