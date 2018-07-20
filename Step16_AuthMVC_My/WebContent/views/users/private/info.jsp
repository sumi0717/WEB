<%@page import="test.users.dao.UserDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
</head>
<body>
<%
	//1. 세션에 저장된 아이디를 읽어와서
	String id=(String)session.getAttribute("id");
	//2. DB 에서 해당 아이디의 개인정보를 읽어와서 
	UsersDto dto=UserDao.getInstance().getData(id);
	//3. 응답한다. 
%>
<h3>개인 정보 입니다.</h3>
<table>
	<thead>
		<tr>
			<th>항목</th>
			<th>정보</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>아이디</th>
			<td>${requestScope.dto.id }</td>
			<%//줄여서 dto.id %>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.regdate }</td>
		</tr>
	</tbody>
</table>
<a href="updateform.do">회원정보 수정</a>
<a href="javascript:deleteConfirm()">회원 탈퇴</a>
<script>
	function deleteConfirm(){
		var isDelete=confirm("회원 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.do"; //여기로 이동됨
		}
	}
</script>
</body>
</html>
