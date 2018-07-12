<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.users.dao.UserDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//폼 전송되는 아이디 비밀번호를 읽어와서
	request.setCharacterEncoding("utf-8"); //한글 안 깨지게
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	//DB의 정보와 일치하는지 확인해서
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	//지금은 정보가 2개밖에 되지 않지만 dto 객체 생성해서 객체에 담아서 일치 여부 확인하면 좀 더 손쉬움! 
	//일일이 id, pwd 등 정보 따로 각 대응해가며 매치하는 것 보다는!!!
	//이게 dto 객체 생성해서 setter 메소드 써서 정보 담아두는 이유!
	
	//로그인 성공 여부
	boolean isLoginSuccess=UserDao.getInstance().isValid(dto);
	
	//유효한 정보면 로그인 처리를 하고 응답,
	//유효한 정보가 아니면 아이디, 혹은 비밀번호가 잘못 되었다고 응답
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
<%
	//로그인 성공 후 원래 가야할 곳의 정보
	String url=request.getParameter("url");
	//url 변수를 어디에서 읽어오는건지??

%>

<%if(isLoginSuccess){ 
	//세션에 id 담기
	session.setAttribute("id", id);%>
	<p><strong><%=id %></strong> 님 로그인 되었습니다</p>
	<a href="<%=url %>">확인</a>
<%}else{ %>
	<p> 아이디 혹은 비밀번호가 틀려요</p>
	<a href="loginform.jsp?url=<%=url %>">확인</a>
<%} %>
</body>
</html>