<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/views/showmember.jsp</title>
</head>
<body>
<%
	MemberDto showmem=(MemberDto)request.getAttribute("showmem");
%>
<h3>회원 한명의 정보 보기</h3>
<!-- getNum, name, addr 메소드를 이용해서 해야함 -->
<p>번호 : <strong><%=showmem.getNum() %></strong></p>
<p>이름 : <strong><%=showmem.getName() %></strong></p>
<p>주소 : <strong><%=showmem.getAddr() %></strong></p>
<a href="index.jsp">인덱스로 가기</a>
<!-- 현재 경로가 최상위경로므로(url을 살펴봤을떄,) 그냥 index.jsp해줘야 인덱스로 감 -->
<a href="../index.jsp">인덱스로 가기</a>
<!-- 이렇게 하면, 컨텐츠를 건너뛰고 1계단 더 윗 경로로 이동됨. -->
</body>
</html>