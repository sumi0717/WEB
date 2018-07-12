<%@page import="test.users.dao.UserDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파라미터로 전달되는 아이디 읽어오기
	String inputId=request.getParameter("inputId");

	//2. DB에서 사용 가능한 아이디인지 확인한다
	boolean canUse=UserDao.getInstance().canUseId(inputId); //true 나 false로 사용가능 여부 설정

	//3. 가능한지 여부를 적당한 문자열 형식으로 응답한다
	
	
	//html or json or xml or 자기만의 형식
	//가급적 json 형식으로 응답하는 게 좋다
	//그러면 contentType에 코딩할 문자열 형식을 적어 둔다
	
// 이 문자열은 success:function(responseData){}, responseData에 들어가게 된다 
%>

{"canUse":<%=canUse %>}