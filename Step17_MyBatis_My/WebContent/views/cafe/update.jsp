<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/views/cafe/private/update.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${isSuccess }">
		<script>
			alert("수정 하였습니다");
			location.href="../list.do";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("수정 실패!");
			location.href="../list.do";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>