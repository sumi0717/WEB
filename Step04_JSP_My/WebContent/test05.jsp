<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	여기는 주석 영역입니다 jsp페이지가 해석하지 않아요 
--%>
<%
	//여기는 service() 메소드 안 쪽 영역입니다
%>
<%!
	//여기는 클래스 안 쪽 영역 입니다
	
	//멤버 필드
	public String myName="김구라";

	//멤버 메소드
	public void test(){
		
	}
%>
<%
	//service() 메소드 안에서 myName이라는 필드 참조	
	System.out.println(myName);
	//service() 메소드 안에서 test() 멤버 메소드 호출
	test();
%>
</body>
</html>