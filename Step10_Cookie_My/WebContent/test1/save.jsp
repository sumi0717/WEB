<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>save.jsp</title>
</head>
<body>
<%
   request.setCharacterEncoding("utf-8");
   String msg = request.getParameter("msg");
   
   //1. 쿠키 객체 생성 (클라이언트 side에 문자열을 저장하고 싶을때)
   Cookie cookie = new Cookie("savedMsg",URLEncoder.encode(msg,"UTF-8"));
   //2. 최대 유지 시간(초단위)
   cookie.setMaxAge(60);
   //3. ,response 객체에 담으면
   response.addCookie(cookie);//결국 응답이다 응답될때 자동으로 심어짐
   
   //응답할 때 응답되는 웹브라우져에 자동 저장된다.
%>
<p>당신의 웹브라우져에 쿠키를 저장했습니다.</p>
<a href="read_cookie.jsp">저장된 쿠키 읽어와 보기</a>
</body>
</html>