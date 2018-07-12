<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	
	//파라미터로 전달된 쿠키 이름과 쿠키 값을 읽어온다
	String name = request.getParameter("name");
	String value = request.getParameter("value");
	//쿠키 객체를 생성해서 정보를 담고
	Cookie cook=new Cookie(name, value);
	cook.setMaxAge(60);
	response.addCookie(cook);
	
	//바로 리다이렉트 응답 주기
	response.sendRedirect("cookie_form.jsp");
	//이것 자체가 응답
	//addCookie를 통해 쿠키가 심어지고. 
	//=> 리다이렉트 요청을 통해, 출력할 내용이 더 없을때 이 경로로 다시 요청하라는 응답이 됨		
%>