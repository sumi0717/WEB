<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header" style="background-color:gray;">
<%
	String id=(String)session.getAttribute("id");
String cPath=request.getContextPath();
String strRoot=request.getSession().getServletContext().getRealPath("/");
%>
<%if(id!=null){ %>
	<p><strong><%=id %></strong> 님 로그인중...</p>
	<a href="users/logout.jsp">로그아웃</a>
<%}else{%>
	<a href="users/loginform.jsp">로그인</a>
<%}%>

<%
	// navbar.jsp 페이지를 include 하면서 전달된 파라미터를 읽어온다
	String thisPage=request.getParameter("thisPage");
%>




<nav class="navbar navbar-expand-lg navbar-inverse fixed-top" style="color: #24FCFF" id="mainNav" >
<div class="container">
        <a class="navbar-brand" href="<%=strRoot %>/index.jsp" style="font-size: 20px; color: #24FCFF; margin-top: 10px">HomePage</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link " href="users/signup_form.jsp" style="font-size: 20px; color: pink">Join Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="users/loginform.jsp?url=<%=cPath%>/index.jsp" style="font-size: 20px; color: pink">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="board/list.jsp" style="font-size: 20px; color: pink">Board</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="dropzone/upload_form.jsp" style="font-size: 20px; color: pink">Gallery</a>
            </li>
             <li class="nav-item">
              <a class="nav-link " href="file/list.jsp" style="font-size: 20px; color: pink">Files</a>
            </li>
           
          </ul>
        </div>
      </div>
      </nav>


</div>

</div>
