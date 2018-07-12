<%@page import="test.friends.dto.FriendsDto"%>
<%@page import="test.friends.dao.FriendsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>friends/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	// /friends/updateform.jsp?num=x 요청명.
	
	//파라미터로 전달되는 수정할 회원의 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));

	FriendsDao fdao=FriendsDao.getInstance();
	FriendsDto fdto=fdao.getData(num);
	
%>
<h3>친구 수정 폼</h3>
<form action="update.jsp" method="post">
	<input type="hidden" name="num" value="<%=fdto.getNum() %>"/>
	<label>번호</label>
	<input type="text" value="<%=fdto.getNum()%>" disabled/><br />
	<label for="name">이름</label>
	<input type="text" name="name" id="name" value="<%=fdto.getName()%>"/><br />
	<label for="addr">주소</label>
	<input type="text" name="addr" id="addr" value="<%=fdto.getAddr()%>"/>
	<button type="submit">수정 확인</button>
</form>
</body>
</html>