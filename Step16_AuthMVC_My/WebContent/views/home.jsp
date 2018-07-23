<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
</head>
<body>
<h3>home 페이지 입니다</h3>
<!-- session 영역에 id가 비어있지않으면 (로그인 된 상태라면) ㄴ -->
<c:if test="${not empty sessionScope.id }">
   <p> <strong><a href="users/private/info.do?id=${id}">${id }</a></strong> 님 로그인중...</p>
   <a href="users/logout.do">로그아웃</a>
</c:if>
<ul>
   <li><a href="users/signup_form.do">회원 가입</a></li>
   <li><a href="users/loginform.do">로그인</a></li>
</ul>

<h3>공지 사항 입니다.</h3>
<ul>
   <c:forEach var="tmp" items="${msgsKey }">
      <li>${tmp }</li>
   </c:forEach>
</ul>
</body>
</html>




