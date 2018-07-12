<%@page import="test.friends.dao.FriendsDao"%>
<%@page import="test.friends.dto.FriendsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>friends/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	//post 방식 전송 파라미터 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");


	//전송되는 파라미터 추출
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	//FriendsDto에 담아서
	FriendsDto fdto=new FriendsDto();
	fdto.setName(name);
	fdto.setAddr(addr);
	
	//FriendsDao 객체를 이용해서 DB에 저장
	FriendsDao fdao=FriendsDao.getInstance();
	fdao.insert(fdto);
%>
</body>
<script>
alert("친구 정보를 추가했습니다");
//javascript로 페이지 이동
location.href="list.jsp";
</script>
</html>