<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 정보</title>
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
    $('#library_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#library_title').val('${libraryInfo.library_title}');
    $('#library_nickname').val('${libraryInfo.library_nickname }');
    $('#library_pwd').val('${libraryInfo.library_pwd}');
    $('#library_mail').val('${libraryInfo.library_mail}');
    $('#library_content').summernote('code','${libraryInfo.library_content}');
    var library_title = '${libraryInfo.library_title}';
    var library_group = '${libraryInfo.library_group}';
    var library_depth = '${libraryInfo.library_depth}';
    var library_seq = '${libraryInfo.library_seq}';
    
    
    $('form[name=libraryView]').submit(function() {

    	var flag = true;
    	if(eval('${!empty LOGIN_MEMBERINFO}')){
    		if('${LOGIN_MEMBERINFO.mem_id}'== '${libraryInfo.library_writer}'){
		    	//deletefreeboardFormInfo.jsp?bo_no=1
		    			
    			if(!$('#library_title').val().validationTITLE()){
    	    		return alertPrint('제목을 바르게 입력해주세요.'); 
    	    	}
    	    	if(!$('#library_nickname').val().validationNICKNAME()){
    	    		return alertPrint('대화명을 바르게 입력해주세요.');
    	    	}
    	    	if(!$('#library_pwd').val().validationPWD()){
    	    		return alertPrint('패스워드를 바르게 입력해주세요.');
    	    	}
    	    	if(!$('#library_mail').val().validationMAIL()){
    	    		return alertPrint('메일을 바르게 입력해주세요.');
    	    	}	

		    			
		    	var library_content = $('#library_content').summernote('code');
				$(this).append('<input type="hidden" name="library_content" value="' + library_content + '"/>');
				$(this).append('<input type="hidden" name="library_no" value="${libraryInfo.library_no}"/>');
		    	
				$(this).append('<input type="hidden" name="library_ip" value="${pageContext.request.remoteAddr}"/>');
				$(this).attr('action', '${pageContext.request.contextPath}/user/library/updateLibrary.do');
				
				// $(location).attr('href', '${pageContext.request.contextPath}/user/library/deleteLibrary.do?library_no=${libraryInfo.library_no}');
    		}else{
	    		flag = false;
    		}
    	}else{
	    	flag = false;
    	}
    	if(!flag){
    		return alertPrint("작성자만 수정이 가능합니다.");
    	}

	});
    
    
    $('#btnList').on('click', function(){
    	//location.replace("${pageContext.request.contextPath}/user/library/libraryList.do");
    	window.history.back();
    })
    
    $('#btnDelete').on('click', function() {
    	var flag = true;
    	if(eval('${!empty LOGIN_MEMBERINFO}')){
    		if('${LOGIN_MEMBERINFO.mem_id}'== '${libraryInfo.library_writer}'){
		    	//deletefreeboardFormInfo.jsp?bo_no=1
				$(location).attr('href', '${pageContext.request.contextPath}/user/library/deleteLibrary.do?library_no=${libraryInfo.library_no}');
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
    
    $('#btn3').click(function(){
 	   if(eval('${!empty LOGIN_MEMBERINFO}')){
 	   var queryString = '?rnum=${libraryInfo.rnum}&library_title='+library_title;
 	   var parentInfo = '&library_group='+library_group+'&library_seq='+library_seq+'&library_depth='+library_depth;
 	   $(location).attr('href','${pageContext.request.contextPath}/user/library/libraryReplyForm.do' + queryString + parentInfo); 
 	   }
 	   else{
 		   BootstrapDialog.show({
 	             title: '알림',
 	             message: '로그인 후 작성이 가능합니다.'
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
<form class="form-horizontal" role="form" action="" method="post" name="libraryView">
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
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
			<!-- Wrapper for slides -->

			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<c:forEach items="${libraryInfo.items }" var="fileitemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last}">
						<div class="item">
					</c:if>
						<img src="/files/${fileitemInfo.libraryfile_name }" alt="pic1"
						onclick="javascript:location.href='/user/library/libraryFileDownload.do?libraryfile_seq=${fileitemInfo.libraryfile_seq }';" />
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
			<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
			<button type="button" class="btn btn-primary" id="btn3">댓글</button>
			<button type="button" class="btn btn-info" id="btnList">목록</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
		</div>
	</div>
</form>
</body>
</html>