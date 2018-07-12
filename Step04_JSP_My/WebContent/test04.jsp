<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
	List<MemberDto> members=new ArrayList<>();
	members.add(new MemberDto(1,"구라쓰","노량진"));
	members.add(new MemberDto(2,"해골","행신동"));
	members.add(new MemberDto(3, "냠냠이","쩝쩝동"));
	
%>
<h3>회원 목록입니다</h3>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
	</thead>
	<tr>
		<td><%=members.get(0).getNum() %></td>
		<td><%=members.get(1).getName() %></td>
		<td><%=members.get(2).getAddr() %></td>
	</tr>
	<%for(int i=0; i<members.size(); i++) {%>
	<tr>
		<td><%=members.get(i).getNum() %></td>
		<td><%=members.get(i).getName() %></td>
		<td><%=members.get(i).getAddr() %></td>
		
	</tr>
	<%} %>
	<%for(MemberDto tmp:members){ %>
	<tr>
		<td><%=tmp.getNum() %></td>
		<td><%=tmp.getName() %></td>
		<td><%=tmp.getAddr() %></td>
	</tr>
	<%} %>
</table>
</body>
</html>