<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test4/main.jsp</title>
</head>
<body>
<!-- 인클루드 시키는 방법2, 코드를 읽을때 좀 더 직관적으로 알아볼 수 있음 -->
<jsp:include page="../include_files/header.jsp"/>
<div class="main">
	<h3>메인 컨텐츠입니다4</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae neque tempore dolorum laborum eligendi iure debitis sunt in doloremque aspernatur praesentium cupiditate aliquid obcaecati perferendis voluptas. Obcaecati cum quas earum?</p>
</div>
<jsp:include page="../include_files/footer.jsp"/>
</body>
</html>