<%@page import="test.friends.dto.FriendsDto"%>
<%@page import="test.friends.dao.FriendsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>friends/delete.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	//회원 삭제하는 폼
	// /friends/delete.jsp?num=x
	
	int num=Integer.parseInt(request.getParameter("num"));

	FriendsDao fdao=FriendsDao.getInstance();
	fdao.delete(num);
%>

<script>
	alert("<%=num %> 번 회원 정보를 삭제했습니다");
	location.href="list.jsp";
</script>
</body>
</html>