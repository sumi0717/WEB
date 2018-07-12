<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/ajax/loginform.jsp</title>
<style>
.result {
	background-color: #000;
	color: #fff;
	border-radius: 10px;
	margin-top: 10px;
	font-weight: bold;
}
</style>
</head>
<body>
<%
	//세션에 저장된 id 읽어오기
	String id=(String)session.getAttribute("id");
%>
<%if(id!=null){ %>
	<p>
		<strong><%=id %></strong>님 로그인 중..
		<a href="logout.jsp">로그아웃</a>
	</p>
<%} %>

	<h3>jquery를 활용한 ajax form 전송</h3>
	<form action="login.jsp" method="post" id="myForm">
		<label for="id">아이디</label> <input type="text" name="id" id="id" /> <label
			for="pwd">비밀번호</label> <input type="text" name="pwd" id="pwd" />
		<button type="submit">로그인</button>
	</form>
	<div class="result"></div>

	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script>
		$("#myForm").submit(function() {
			//폼에 입력한 값을 serialize 문자열로 읽어내기
			// id=xxx?pwd=xxx ....
			var param = $(this).serialize();
			console.log(param);

			//ajax request 를 이용해서 폼에 입력한 내용 서버에 전송
			$.ajax({//이 요청(ajax)을 login.jsp에서 읽어와서->
				url : "login.jsp", //요청 경로
				method : "post", //요청 메소드
				data : param, //요청 파라미터

				// -> login.jsp를 거쳐서 success/error 함수로 응답이 됨
				success : function(responseData) { //응답 데이터
					console.log(responseData);
					$(".result").text(responseData);
					//responseData 는 object다
					if(responseData.isSuccess){
						alert("로그인 됐습니다");
					}else{
						alert("아이디 혹은 비밀번호가 틀려요");
					}
				},
				error : function(xhr) {
					$(".result").text(xhr.responseText);
				}
			});

			return false;//폼 전송 막기(페이지 전환 방지)
		});
	</script>
</body>
</html>