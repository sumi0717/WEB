<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/list.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
.page_display a {
	text-decoration: none;
	color: #000;
}

.page_display a.active {
	font-weight: bold;
	color: red;
	text-decoration: underline;
}

.page_display a.muted {
	color: #cecece;
}
</style>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${ not empty id }">
				<p>
					<strong>${id }</strong> 님 로그인중...
				</p>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
			</c:otherwise>
		</c:choose>

		<a href="private/insertform.do">새 글 작성</a>
		<h3>카페 글 목록 입니다.</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td>${tmp.title }</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
						<td><c:if test="${tmp.writer eq id }">
								<a href="javascript:deleteConfirm(${tmp.num })">삭제</a>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징 처리 -->
		<div class="page_display" style="text-align: center;">
		<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javas cript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }"
			end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active">
						<a href="list.do?pageNum=${i }">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.do?pageNum=${i }">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a class="muted" href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>		
	</ul>
			
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script>
	
		//삭제 확인을 하는 함수 
		function deleteConfirm(num) {
			var isDelete = confirm(num + "번 글을 삭제 하시겠습니까?");
			if (isDelete) {
				location.href = "private/delete.do?num=" + num;
			}
		}
		
	
	</script>
</body>
</html>