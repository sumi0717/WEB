<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/path2/result.jsp</title>
</head>
<body>
<%
	//session 영역(session scope)에 "myName"이라는 key값으로
	//저장된 stirng type 데이터 읽어오기
	String myName=(String)session.getAttribute("myName");
						//session.setAttribute("myName","구라쓰"); 값을 담았었음.
						//원래 타입(String)으로 캐스팅 해서 값(value) 가져오기
						
	request.getSession();
%>
<p>세션 영역에 저장된 myName : <strong><%=myName %></strong></p>
<a href="remove.jsp">세션에 저장된 정보 삭제</a>
</body>
</html>