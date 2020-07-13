<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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


    $('form[name=qnaReplyForm]').submit(function() {
    	if(!$('#qna_title').val().validationTITLE()){
    		return alertPrint('제목을 바르게 입력해주세요.'); 
    	}
  	
    	var qna_content = $('#qna_content').summernote('code');
		$(this).append('<input type="hidden" name="qna_content" value="' + qna_content + '"/>');
    	
		$(this).append('<input type="hidden" name="qna_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
		$(this).append('<input type="hidden" name ="qna_ip" value="${pageContext.request.remoteAddr}"/>');
		$(this).append('<input type="hidden" name ="qna_group" value="${param.qna_group}"/>');
		$(this).append('<input type="hidden" name ="qna_seq" value="${param.qna_seq}"/>');
		$(this).append('<input type="hidden" name ="qna_depth" value="${param.qna_depth}"/>');
		$(this).attr('action', '${pageContext.request.contextPath}/admin/qna/insertQnaReply.do');
		
		return true;
	});
    
    $('#qnaListBTN').on('click', function() {
		$(location).attr('href', '${pageContext.request.contextPath}/admin/qna/qnaList.do');
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
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="qnaMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">Q&A댓글</div>
					<table border="0" cellspacing="1" cellpadding="1">

						<form name="qnaReplyForm" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data" > 
							<div class="form-group">
								<label class="control-label col-sm-2" for="qna_title">제목:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="qna_title" name="qna_title" placeholder="제목 입력...">
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
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-info" style="float: right">댓글등록</button>
									<button type="button" class="btn btn-danger" style="float: right">취소</button>
									<button type="button" id="qnaListBTN" class="btn btn-primary" style="float: right">목록</button>
								</div>
							</div>
						</form>




 					</div>
				</div>
			</td>
		</tr>
	</table>
</div>








</body>
</html>