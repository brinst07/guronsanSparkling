<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 댓글등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#library_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    
    $('form[name=freeboardReplyForm]').submit(function(){
	
		var library_content = $('#library_content').summernote('code');
		$(this).append('<input type="hidden" name ="library_content" value="'+library_content+'"/>');
			
		$(this).append('<input type="hidden" name ="library_writer" value="${LOGIN_MEMBERINFO.mem_id}"/>');
		$(this).append('<input type="hidden" name ="library_ip" value="${pageContext.request.remoteAddr}"/>');
		$(this).append('<input type="hidden" name ="library_group" value="${param.library_group}"/>');
		$(this).append('<input type="hidden" name ="library_seq" value="${param.library_seq}"/>');
		$(this).append('<input type="hidden" name ="library_depth" value="${param.library_depth}"/>');
		$(this).attr('action','${pageContext.request.contextPath}/user/library/insertLibraryReply.do');
		
		return true;
	});
	
	$('#btn1').click(function() {
	      $(location).attr('href', '/user/libraryList.do');
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
<div class="row">
<!-- 	 <div class="col-sm-3"> -->
<!-- 		 <label class="col-sm-2 control-label">No :</label> -->
<%--   		 <p class="form-control-static">${param.rnum}</p> --%>
<!-- 	 </div> -->
<!-- 	 <div class="col-sm-8"> -->
<!-- 	 	<label class="col-sm-2 control-label">제목 :</label> -->
<%--     	<p class="form-control-static">${param.library_title }</p> --%>
<!-- 	 </div> -->
	 <div class="col-sm-1">
	 	<p class="text-right text-danger bg-danger">${LOGIN_MEMBERINFO.mem_name }의 댓글</p>
	 </div>
</div>
<hr />
<form class="form-horizontal" name="freeboardReplyForm" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="library_title" name="library_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="library_nickname" name="library_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="library_pwd" name="library_pwd" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="library_mail" name="library_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="library_content"><p></p></div>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success" style="float: right;">답글등록</button>
			<button type="button" class="btn btn-danger">취소</button>
			<button type="button" class="btn btn-info" id="btn1">목록</button>
		</div>
	</div>
</form>
</body>
</html>