<%@page import="test.users.dao.UserDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
						
    pageEncoding="UTF-8"%>
<%

	// ajax 요청 파라미터 추출
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	//유효한 정보인지 확인
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	boolean isLoginSuccess=UserDao.getInstance().isValid(dto);
	if(isLoginSuccess){
		//로그인 처리하기
		session.setAttribute("id",id);
		//세션에 담았다는 것은, 서버에 정보를 담았다는 뜻이므로, 로그인 했단 소링미
	}
	%>
	{"isSuccess":<%=isLoginSuccess %>}
	
	<% if(isLoginSuccess){%>
		{"isSuccess":true}
	<%}else{ %>
		{"isSuccess":false}
	<%} %>

	<% %>