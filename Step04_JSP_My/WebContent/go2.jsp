<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>go2.jsp</title>
</head>
<body>
<%
	String cPath=request.getContextPath();
%>
<script>
	alert("로그인이 필요합니다");
	// javascript를 로딩시켜서 클라이언트를 이동 시키기
	location.href="<%=cPath%>/test01.jsp";
</script>
</body>
</html>