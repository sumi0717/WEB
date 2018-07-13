<%@page import="test.users.dao.UserDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 회원 정보를 추출해서
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id"); //안에 들어가는 객체는 인풋 요소의 네임 속성과 같아야함
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	
	//DB에 저장하고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	boolean isSuccess=UserDao.getInstance().insert(dto);
	
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
<jsp:include page="../include_files/header.jsp" />
<jsp:include page="../include_files/css_loading2.jsp" />
<h3>회원 가입 요청 결과 페이지</h3>
<%if(isSuccess){%>
	<p> <strong><%=id %></strong> 회원님 가입되었습니다</p>
	<a href="loginform.jsp">로그인 하기</a>
<% }else{ %>
	<p>가입 실패!</p>
	<a href="signup_form.jsp">다시 가입하러 가기</a>
<%} %>
</body>
</html>