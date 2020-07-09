<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script>

$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용

    
    $('#faq_title').val('${faqInfo.faq_title}');
    $('#faq_writer').val('${faqInfo.faq_writer }');
    $('#faq_content').val('${faqInfo.faq_content}');   
    
    
    $('#btnList').on('click', function(){
    	location.replace("/user/faq/faqList.do");
    })  
   
   
});
</script>
</head>
<body>
<form class="form-horizontal" role="form" action="" method="post" name="faqView">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="faq_title" name="faq_title" disabled="disabled" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="faq_writer" name="faq_writer" disabled="disabled">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="faq_content" disabled="disabled"><p></p></input>
		</div>
	</div>
	
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">			
			<button type="button" class="btn btn-info" id="btnList">목록</button>			
		</div>
	</div>
</form>
</body>
</html>