<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	if(id==null){//만일 로그인을 하지 않았으면
		
		String cPath=request.getContextPath();
		response.sendRedirect(cPath+"/users/loginform.jsp");
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/market/buy.jsp</title>
</head>
<body>
<p>상품 구입 페이지입니다</p>
<a href="">구입하기</a>
</body>
</html>