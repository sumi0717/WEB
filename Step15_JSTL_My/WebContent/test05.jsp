<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<MemberDto> list=new ArrayList<>();
	list.add(new MemberDto(1, "만두", "만두왕국"));
	list.add(new MemberDto(2, "만두2", "만두왕국"));
	list.add(new MemberDto(3, "만두3", "만두왕국"));
	// 컨트롤러에서 Model을 request에 담았다고 가정
	request.setAttribute("list", list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test05.jsp</title>
</head>
<body>
<h3>회원 목록입니다</h3>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
		<tr>
			<td>${tmp.num }</td>
			<td>${tmp.name }</td>
			<td>${tmp.addr }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>