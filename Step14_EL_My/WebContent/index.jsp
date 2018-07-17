<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
</head>
<body>
<h3>인덱스 페이지입니다</h3>
<ul>
	<li><a href="Hello.jsp">Hello Expression Language</a></li>
	<li><a href="scope/test01.jsp">스코프 영역</a></li>
	<li><a href="fortune.do">오늘의 운세</a></li>
	<li><a href="person.do">오늘의 인물</a></li>
	<li><a href="info.do">회원 한명의 정보 보기</a></li>
	<li><a href="test.do?num=1&name=gura">요청 param 테스트</a></li>
	<li><a href="test.do?num=2&name=monkey">요청 param 테스트2</a></li>
</ul>
<p>컨택스트 경로를 EL로 출력하기</p>
<p>현재 context path : <strong>${pageContext.request.contextPath }</strong></p>
						<!-- request.getContextPath()와 동일 
						하드 코딩은 안됨. 경로가 바뀌면 돌아가지지 않음.-->
</body>
</html>