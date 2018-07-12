<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header" style="background-color:gray;">
<%
	String id=(String)session.getAttribute("id");
%>
<%if(id!=null){ %>
	<p><strong><%=id %></strong> 님 로그인중...</p>
	<a href="users/logout.jsp">로그아웃</a>
<%}else{%>
	<a href="users/loginform.jsp">로그인</a>
<%}%>
<img src="images/쌀국수.jpg" alt="" />
<h3>인덱스 페이지 입니다.</h3>
<div class="navbar navbar-inverse">
	<div class="navbar-header">
	<ul class="nav navbar-nav">
	<li><a href="users/signup_form.jsp">회원가입</a></li>
	<li><a href="file/list.jsp">자료실</a></li>
	<li><a href="gallery/list.jsp">사진 겔러리</a></li>
	<li><a href="board/list.jsp">게시글 목록 보기</a></li>
	<li><a href="dropzone/upload_form.jsp">drop zone 테스트</a></li>
</ul>
	</div>
</div>
</div>
