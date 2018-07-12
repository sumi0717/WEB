<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 수정할 글 번호를 읽어온다
	int num=Integer.parseInt(request.getParameter("num"));
	//2. BoardDao를 이용해서 수정할 글 정보를 얻어온다
	BoardDto dto=BoardDao.getInstance().getData(num);
	//3. 글 수정 폼을 응답한다
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/updateform.jsp</title>
</head>
<body>
<h3>글 수정 폼입니다</h3>
<form action="update.jsp" method="post">
	<input type="hidden" name="num" value="<%=dto.getNum() %>" />
	<label for="num">번호</label>
	<input type="text" id="num" value="<%=dto.getNum() %>" disabled /><br />
	<label for="writer">작성자</label>
	<input type="text" name="writer" id="writer" value="<%=dto.getWriter() %>"/><br />
	<label for="title">제목</label>
	<input type="text" name="title" id="title" value="<%=dto.getTitle() %>"/><br />
	<label for="content">내용</label>
	<textarea name="content" id="content" cols="30" rows="5"><%=dto.getContent() %></textarea>
	<br />
	<button type="submit">수정 확인</button>
	
</form>
</body>
</html>