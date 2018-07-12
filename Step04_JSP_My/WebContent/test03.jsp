<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	List<String> list=new ArrayList<>();
	list.add("김씨");
	list.add("이씨");
	list.add("박씨");
	list.add("정씨");
	list.add("최씨");
	
%>
<h3> 친구 목록입니다 / 1번 방법 단순 참조</h3>
<ul>
	<li><%=list.get(0) %></li>
	<li><%=list.get(1) %></li>
	<li><%=list.get(2) %></li>
	<li><%=list.get(3) %></li>
	<li><%=list.get(4) %></li>
</ul>
<h3> 친구 목록입니다 / 2번 방법 for 문 돌리기</h3>
<ul>
	<%for(int i=0; i<list.size(); i++){ %>
	<li><%=list.get(i) %></li>	
	<%} %>
</ul>
<h3> 친구 목록입니다 / 3번 방법 for 문 확장</h3>
<ul>
	<%for(String tmp:list){ %>
	<li><%=tmp %></li>
	<%} %>
</ul>
</body>
</html>