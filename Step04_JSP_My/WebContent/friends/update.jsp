<%@page import="test.friends.dao.FriendsDao"%>
<%@page import="test.friends.dto.FriendsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 한글 깨지지 않도록	
	request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
	
	//폼 전송되는 수정할 회원의 정보를 읽어온다
	int num=Integer.parseInt(request.getParameter("num"));
	
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	//MemberDao 객체를 이용해서 DB에 수정 반영
	FriendsDto dto=new FriendsDto(num,name,addr);
	FriendsDao dao=FriendsDao.getInstance();
	dao.update(dto);
	
	//응답하기
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>friends/update.jsp</title>
</head>
<body>
<script>
alert("<%=num%> 번 회원 정보가 수정됐습니다");
//javascript로 페이지 이동
location.href="list.jsp";
</script>
</body>
</html>