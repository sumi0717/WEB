<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/dragdrop/test1.jsp</title>
<style>
	.box{
		width:100px;
		height: 100px;
		background-color: orange;
		border: 1px solid red;
		float: left;
	}
	.drop-area{
		width: 300px;
		height: 300px;
		background-color: pink;
		margin: 0 auto;
		clear: left;
	}
</style>
</head>
<body>
<h3>drag and drop 테스트</h3>
<div class="box" draggable="true" id="one">drag me!</div>
<div class="box" draggable="true" id="two">drag me!</div>
<div class="box" draggable="true" id="three">drag me!</div>
<div class="drop-area"></div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//드래그가 시작 되었을 때 실행할 함수 등록
	$(".box").on("dragstart", function(e){
		
		$(this).text("dragging...");
		var id=$(this).attr("id");
		e.originalEvent.dataTransfer.setData("info", id);
	});
	
	//드래그가 끝났을 때 실행할 함수 등록
	$(".box").on("dragend", function(e){
		$(this).text("dragend!");
	});
	
	//무언가 드래그 오버 되었을 때 실행할 함수 등록
	$(".drop-area").on("dragover",function(e){
		e.preventDefault(); //기본 이벤트 막기
		e.stopPropagation(); //이벤트 전파 막기
	});
	
	//무언가 드랍 되었을 때 실행할 함수 등록
	$(".drop-area").on("drop", function(e){
		e.preventDefault(); //이 두 함수를 이용하지 않으면, 
		e.stopPropagation(); // 드래그 했을때 이미지 파일이 웹 상에서 열려버림.
		//drop된 요소의 정보 읽어오기
		var info=e.originalEvent.dataTransfer.getData("info");
		
		$(this).text(info+ " droped!");
	});
</script>
</body>
</html>