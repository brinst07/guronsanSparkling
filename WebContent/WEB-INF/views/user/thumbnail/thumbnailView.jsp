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
    $('#thumbnail_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#thumbnail_title').val('${thumbnailInfo.thumbnail_title}');
    $('#thumbnail_nickname').val('${thumbnailInfo.thumbnail_nickname }');
    $('#thumbnail_pwd').val('${thumbnailInfo.thumbnail_pwd}');
    $('#thumbnail_mail').val('${thumbnailInfo.thumbnail_mail}');
    $('#thumbnail_content').summernote('code','${thumbnailInfo.thumbnail_content}');
    var thumbnail_title = '${thumbnailInfo.thumbnail_title}';
    
    $('form[name=freeboardView]').submit(function() {
    	var flag = true;
    	if(eval('${!empty LOGIN_MEMBERINFO}')){
    		if('${LOGIN_MEMBERINFO.mem_id}'== '${thumbnailInfo.thumbnail_writer}'){
		    	/* //deletefreeboardFormInfo.jsp?bo_no=1
				$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/deleteFreeboard.do?bo_no=${freeboardInfo.bo_no}'); */
    			if(!$('#thumbnail_title').val().validationTITLE()){
    	    		return alertPrint('제목을 바르게 입력해주세요.'); 
    	    	}
    	    	if(!$('#thumbnail_nickname').val().validationNICKNAME()){
    	    		return alertPrint('대화명을 바르게 입력해주세요.');
    	    	}
    	    	if(!$('#thumbnail_pwd').val().validationPWD()){
    	    		return alertPrint('패스워드를 바르게 입력해주세요.');
    	    	}
    	    	if(!$('#thumbnail_mail').val().validationMAIL()){
    	    		return alertPrint('메일을 바르게 입력해주세요.');
    	    	}
    	    	
    	    	var thumbnail_content = $('#thumbnail_content').summernote('code');
    			$(this).append('<input type="hidden" name="thumbnail_content" value="' + thumbnail_content + '"/>');
    			$(this).append('<input type="hidden" name="thumbnail_no" value="${thumbnailInfo.thumbnail_no}"/>');
    	    	
    			$(this).append('<input type="hidden" name="thumbnail_ip" value="${pageContext.request.remoteAddr}"/>');
    			$(this).attr('action', '/user/thumbnail/updateThumbnail.do');

    		}else{
	    		flag = false;
    		}
    	}else{
	    	flag = false;
    	}
    	if(!flag){
    		return alertPrint('작성자만 게시글 수정이 가능합니다.');
    	}
    	
    	
	});
    $('#btnList').on('click', function(){
    	location.replace("/user/thumbnail/thumbnailList.do");
    })
    
    $('#btnDelete').on('click', function() {
    	var flag = true;
    	if(eval('${!empty LOGIN_MEMBERINFO}')){
    		if('${LOGIN_MEMBERINFO.mem_id}'== '${thumbnailInfo.thumbnail_writer}'){
		    	//deletefreeboardFormInfo.jsp?bo_no=1
				$(location).attr('href', '/user/thumbnail/deleteThumbnail.do?thumbnail_no=${thumbnailInfo.thumbnail_no}');
    		}else{
	    		flag = false;
    		}
    	}else{
	    	flag = false;
    	}
    	if(!flag){
    		BootstrapDialog.show({
			    title: '알림',
			    message: '작성자만 게시글 삭제가 가능합니다.'
			});
    	}
	});
 
});


function alertPrint(msg) {
	BootstrapDialog.show({
	    title: '알림',
	    message: msg
	}); 
	return false;
}
</script>
</head>
<body>
<form class="form-horizontal" role="form" action="" method="post" name="freeboardView">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="thumbnail_title" name="thumbnail_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="thumbnail_nickname" name="thumbnail_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="thumbnail_pwd" name="thumbnail_pwd" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="thumbnail_mail" name="thumbnail_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="thumbnail_content"><p></p></div>
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
				<c:forEach items="${thumbnailInfo.items }" var="fileitemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last}">
						<div class="item">
					</c:if>
						<img src="/files/${fileitemInfo.thumbfile_name }" alt="pic1"
						onclick="javascript:location.href='/user/thumbnail/thumbFileDownload.do?thumbfile_seq=${fileitemInfo.thumbfile_seq }';" 
						width="200px" height="150px"
						/>
					</div>
				</c:forEach>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-info" id="btnList" style="float: right">목록</button>
			<button type="submit" class="btn btn-info" style="float: right">수정</button>
			<button type="button" class="btn btn-danger" id="btnDelete" style="float: right">삭제</button>
		</div>
	</div>
</form>
</body>
</html>