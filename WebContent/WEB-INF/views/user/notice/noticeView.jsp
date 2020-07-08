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
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#notice_title').val('${noticeInfo.notice_title}');
    $('#notice_writer').val('${noticeInfo.notice_writer }');
    $('#notice_content').summernote('code','${noticeInfo.notice_content}');   
    
    
    $('#btnList').on('click', function(){
    	location.replace("${pageContext.request.contextPath}/user/notice/noticeList.do");
    })  
   
   
});
</script>
</head>
<body>
<form class="form-horizontal" role="form" action="" method="post" name="noticeView">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="notice_title" name="notice_title" disabled="disabled" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="notice_writer" name="notice_writer" disabled="disabled">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="notice_content" disabled="disabled"><p></p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			</ol>
			<!-- Wrapper for slides -->
			
			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<div class="item">
					<img src="/files/${noticeImg}" alt="pic1"
						onclick="javascript:location.href='/user/noticeFileDownload.do?noticefile_seq=${fileitemInfo.noticefile_seq }';" />
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
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