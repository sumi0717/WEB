<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test02.jsp</title>
</head>
<body>
<h3>JSTL if 문</h3>
<c:if test="true">
	<p>출력이 돼요</p>
</c:if>
<c:if test="false">
	<p>출력이 안 돼요</p>
</c:if>
<c:if test="${10 gt 2 }">
	<p>10은 2보다 커요</p>
</c:if>
<c:if test="${10 lt 2 }">
	<p>10은 2보다 작아요</p>
</c:if>
<% request.setAttribute("num", 10); %>
<c:if test="${num gt 2 }">
	<p>${num }은 2보다 작아요</p>
</c:if>
<% session.setAttribute("id", "gura"); 
//세션 영역에 id라는 키값으로 저장된 값이 null(empty)가 아니면 p가 출력
//session.scope.id나 마찬가지 

/* true면 when 내부 코딩이 출력되고,
		 false면 otherwise 내부 코딩이 출력된다 */

%>
<c:if test="${not empty id }">
	<p>${id }님 로그인 중..</p>
</c:if>

<c:choose>
	
	<c:when test="${not empty id }">
		<p>${id }님 로그인 중..</p>
	</c:when>
	<c:otherwise>
		<a href="loginform.jsp">로그인 하러 가기</a>
	</c:otherwise>

</c:choose>
</body>
</html>