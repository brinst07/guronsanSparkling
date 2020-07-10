<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>썸네일 등록</title>
<script>
$(function(){
	 $('#thumbnail_content').summernote({
 		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
 });


 $('form[name=freeboardForm]').submit(function() {
 	
 	if(!$('#thumbnail_title').val().validationTITLE()){
 		return alertPrint('제목을 바르게 입력해주세요.'); 
 	}
 	
 	
 	var thumbnail_content = $('#thumbnail_content').summernote('code');
		$(this).append('<input type="hidden" name="thumbnail_content" value="' + thumbnail_content + '"/>');
 		$(this).append('<input type="password" class="form-control" id="thumbnail_pwd" name="thumbnail_pwd" value="admin">');
		$(this).append('<input type="hidden" name="thumbnail_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
		$(this).append('<input type="text" class="form-control" id="thumbnail_nickname" value="admin" name="thumbnail_nickname">');
		$(this).append('<input type="hidden" name="thumbnail_ip" value="${pageContext.request.remoteAddr}"/>');
		
		$(this).attr('action', '/admin/thumbnail/insertThumbnail.do');
		
		return true;
	});
    
    $('#btnList').on('click',function(){
    	location.replace('/admin/thumbnail/thumbnailList.do');
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
<form name="freeboardForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="thumbnail_title" name="thumbnail_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자:</label>
		<div class="col-sm-10"> 
			<input type="text" disabled="disabled" class="form-control" id="thumbnail_nickname" value="admin" name="thumbnail_nickname">
		</div>
	</div>
	<!-- <div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="thumbnail_pwd" name="thumbnail_pwd" placeholder="패스워드 입력...">
		</div>
	</div> -->
	<!-- <div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="thumbnail_mail" name="thumbnail_mail" placeholder="메일주소 입력...">
		</div>
	</div> -->
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="thumbnail_content"><p>내용을 입력해주세요...</p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
		</div>
	</div>	
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
			<button type="button" id="btnList" class="btn btn-primary" style="float: right">취소</button>
		</div>
	</div>
</form>
</body>
</html>