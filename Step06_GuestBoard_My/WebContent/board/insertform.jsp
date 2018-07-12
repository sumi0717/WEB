<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insertform.jsp</title>
</head>
<body>
<h3>새 글 작성 폼입니다</h3>
<form action="insert.jsp" method="post">
	<label for="writer">작성자</label>
	<input type="text" name="writer" id="writer" /><br /> <!-- 이런 name 속성이 getParmeter로 읽히는데 일치해야함 -->
	<label for="title">제목</label>
	<input type="text" name="title" id="title" /><br />
	<label for="content">내용</label>
	<textarea name="content" id="content" cols="30" rows="10" ></textarea>
	<br />
	<button type="submit">작성 완료</button>
	<button type="reset">취소</button>
	
</form>
</body>
</html>