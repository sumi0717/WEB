<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax3/upload_form.jsp</title>
</head>
<body>
<h3>ajax 파일 업로드 예제</h3>
<form action="upload.jsp" method="post"
	enctype="multipart/form-data" id="myForm">
	<label for="image">이미지 선택</label>
	<input type="file" name="image" id="image"/>
	<button type="submit">업로드</button>
</form>
<div class="result">
	
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//폼 제출 이벤트가 발생하면 ajax 요청을 통해서 전송하도록 
	$("#myForm").ajaxForm(function(responseData){
		$("<img/>").attr("src", responseData.imagePath)
		.css("width","300px")
		.appendTo(".result");
	});
	//파일을 선택하면 실행할 함수 등록 (폼 자동 제출)
	$("#image").on("input",function(){
		//폼 강제 제출 
		$("#myForm").submit();
	});
</script>
</body>
</html>