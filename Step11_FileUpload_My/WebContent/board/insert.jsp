<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 내용을 추출해서
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	//2. DB에 저장하고
	BoardDto dto = new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	//BoardDao 객체의 참조값 얻어와서 db내용 삽입
	BoardDao dao = BoardDao.getInstance();
	boolean isSuccess = dao.insert(dto);

	//3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insert.jsp</title>
</head>
<body>
<% if(isSuccess){ %>
	<p><strong><%=writer %></strong> 님의 글이 저장되었습니다</p>
	<a href="list.jsp">글 목록 보기</a>
<%}else{ %>
	<p>글 정보 저장 실패</p>
	<a href="insertform.jsp">새 글 작성 폼</a>
<%} %>
</body>
</html>