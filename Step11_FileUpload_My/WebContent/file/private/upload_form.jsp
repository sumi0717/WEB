<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
</head>
<body>
<%
	/*
		[ 파일 업로드 폼 작성법]
				
		1. method="post"
		2. enctype="multipart/form-data"
		3. <input type="file" />
	*/
	//로그인 한 사용자의 아이디
	String id=(String)session.getAttribute("id");
%>
<p> <strong><%=id %></strong>님 로그인 중...</p>
<h3>파일 업로드 폼 입니다.</h3>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
	<label for="title">제목</label>
	<input type="text" name="title" id="title"/><br/>
	<label for="myFile">첨부파일</label>
	<input type="file" name="myFile" id="myFile" /><br/>
	<button type="submit">업로드</button>
</form>
</body>
</html>
