<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test04.jsp</title>
</head>
<body>
<%--
	page 영역에 값 저장하기 
	
	pageContext.setAttribute();	
--%>
<c:set var="num" value="1"/>
<c:set var="name" value="만두"/>
<c:set var="addr" value="량노진"/>

<p>번호 : <strong>${num }</strong></p>
<p>이름 : <strong>${name }</strong></p>
<p>주소 : <strong>${pageScope.addr }</strong></p>

<p>번호 : <strong><c:out value="${num2 }" default="0"/></strong></p>
	<%-- c:out은 디폴트 값을 지정할 수 있음, 해당 데이터가 없으면 디폴트 값을 출력해줌 --%>
<p>이름 : <strong><c:out value="${name2 }" default="홍길동"/></strong></p>
<p>주소 : <strong><c:out value="${addr2 }" default="동서남북쓰"/></strong></p>

<%
	//테스트를 위해 request에 문자열 담아 놓기
	request.setAttribute("markup", "<a href=''>링크</a>");
%>
<p>${markup }</p>
<p><c:out value="${markup }" escapeXml="true"/></p>
</body>
</html>