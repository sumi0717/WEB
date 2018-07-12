<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 방법2
	class는 active라는 문자열로
	옮겨다니며 출력되는 건데 그냥 직접 li에 if 문 작성하기
	
	혹은
	자바 스크립트로
	특정 li에다 addClass하는 방법도 있당
-->

<%
	//request에 "thisPage"라는 키 값으로 담긴 문자열을 읽어온다
	String thisPage=(String)request.getAttribute("thisPage");

%>

<div class="navbar navbar-inverse">
	<div class="navbar-header">
		<ul class="nav navbar-nav">
			<li <%if(thisPage.equals("home")) {%>class="active"<%}%>><a href="home.jsp">Home</a></li>
			<li <%if(thisPage.equals("game")) {%>class="active"<%}%>><a href="game.jsp">Game</a></li>
			<li <%if(thisPage.equals("contact")) {%>class="active"<%}%>><a href="contact.jsp">Contact</a></li>
		</ul>
	</div>
</div>


