<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 조건을 3가지 준비해 놓고, 상황별로 각각 다르게 출력하기 
	navbar.jsp를
	jsp:include함수를 이용해서
	home.jsp, game.jsp, contact.jsp에 인클루드 시킨다.
-->

<%
	// navbar.jsp 페이지를 include 하면서 전달된 파라미터를 읽어온다
	String thisPage=request.getParameter("thisPage");
%>

<%if(thisPage.equals("home")){ %>
<div class="navbar navbar-inverse">
	<div class="navbar-header">
		<ul class="nav navbar-nav">
			<li class="active"><a href="home.jsp">Home</a></li>
			<li><a href="game.jsp">Game</a></li>
			<li><a href="contact.jsp">Contact</a></li>
		</ul>
	</div>
</div>
<%}else if(thisPage.equals("game")){ %>
<div class="navbar navbar-inverse">
	<div class="navbar-header">
		<ul class="nav navbar-nav">
			<li><a href="home.jsp">Home</a></li>
			<li class="active"><a href="game.jsp">Game</a></li>
			<li><a href="contact.jsp">Contact</a></li>
		</ul>
	</div>
</div>
<%}else if(thisPage.equals("contact")){ %>

<div class="navbar navbar-inverse">
	<div class="navbar-header">
		<ul class="nav navbar-nav">
			<li><a href="home.jsp">Home</a></li>
			<li><a href="game.jsp">Game</a></li>
			<li class="active"><a href="contact.jsp">Contact</a></li>
		</ul>
	</div>
</div>
<%} %>




