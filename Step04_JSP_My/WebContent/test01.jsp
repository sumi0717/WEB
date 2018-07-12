<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test01.jsp</title>
</head>
<body>
<%
	
	//여기는 java 코딩을 할 수 있는 영역입니다
	int num=1;
	String name="김구라";
	String addr="노량진";
	
%>
<h3>jsp 테스트</h3>
<p> 번호 : <strong><% out.print(num); %></strong></p>
<p> 이름 : <strong><% out.print(name); %></strong></p>
<p> 주소 : <strong><% out.print(addr); %></strong></p>
<hr />
<p> 번호 : <strong><%=num %></strong></p> 
		<!-- =num 은, out.print(num);을 그대로 출력한 것  -->
<p> 이름 : <strong><%=name %></strong></p>
<p> 주소 : <strong><%=addr %></strong></p>
			<!--  이 위치에 참조되는 내용이 숫자나 문자인 경우에 
				  그대로 참조하고 싶을 시,
		   		 =변수명 이런식으로 참조 가능. -->
		   		 
</body>
</html>