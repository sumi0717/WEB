<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="../include_files/header.jsp" />
	<jsp:include page="../include_files/css_loading2.jsp" />

	<%
		//글 목록 불러오기
		List<BoardDto> list = BoardDao.getInstance().getList();
	%>
	<div class="container ceter-block" style="margin-top: 150px;">
		<div class="row">
			<div class="col-md-8 col-sm-3 ml">
				<a href="insertform.jsp">새글 작성</a>
				<h3>게시글 목록 입니다.</h3>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (BoardDto tmp : list) {
						%>
						<tr>
							<td><%=tmp.getNum()%></td>
							<td><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a></td>
							<td><%=tmp.getWriter()%></td>
							<td><%=tmp.getRegdate()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="space" style="height: 150px"></div>
   
</body>

</html>
<jsp:include page="/include_files/footer.jsp" /> 