<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#qna_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });

    $('form[name=qnaForm]').submit(function() {
    	if(!$('#qna_title').val().validationTITLE()){
    		return alertPrint('제목을 바르게 입력해주세요.'); 
    	}
    	if(!$('#qna_nickname').val().validationNICKNAME()){
    		return alertPrint('대화명을 바르게 입력해주세요.');
    	}
    	if(!$('#qna_pwd').val().validationPWD()){
    		return alertPrint('패스워드를 바르게 입력해주세요.');
    	}
    	if(!$('#qna_mail').val().validationMAIL()){
    		return alertPrint('메일을 바르게 입력해주세요.');
    	}
    	
    	var qna_content = $('#qna_content').summernote('code');
		$(this).append('<input type="hidden" name="qna_content" value="' + qna_content + '"/>');
    	
		$(this).append('<input type="hidden" name="qna_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
		$(this).append('<input type="hidden" name="qna_ip" value="${pageContext.request.remoteAddr}"/>');
		$(this).attr('action', '/user/InsertQna.do');
		
		return true;
	});
    
    $('#btnList').on('click', function() {
		location.replace('${pageContext.request.contextPath}/user/qna/qnaList.do');
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
<form name="qnaForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="qna_title" name="qna_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="qna_nickname" name="qna_nickname" placeholder="대화명 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="qna_pwd" name="qna_pwd" placeholder="패스워드 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="qna_mail" name="qna_mail" placeholder="메일주소 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="qna_content"><p>내용을 입력해주세요...</p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file02">첨부파일2:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file02" name="files" data-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
			<button type="button" class="btn btn-danger" style="float: right">취소</button>
			<button type="button" id="btnList" class="btn btn-primary" style="float: right">목록</button>
		</div>
	</div>
</form>
</body>
</html>