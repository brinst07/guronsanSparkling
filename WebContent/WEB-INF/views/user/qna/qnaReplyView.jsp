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
    $('#qna_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#qna_title').val('${qnaInfo.qna_title}');
    $('#qna_nickname').val('${qnaInfo.qna_nickname }');
    $('#qna_pwd').val('${qnaInfo.qna_pwd}');
    $('#qna_mail').val('${qnaInfo.qna_mail}');
    $('#qna_content').summernote('code','${qnaInfo.qna_content}');
    var qna_title = '${qnaInfo.qna_title}';
    var qna_group = '${qnaInfo.qna_group}';
    var qna_depth = '${qnaInfo.qna_depth}';
    var qna_seq = '${qnaInfo.qna_seq}';
    
    $('form[name=qnaView]').submit(function() {
    	
    	var qna_content = $('#qna_content').summernote('code');
		$(this).append('<input type="hidden" name="qna_content" value="' + qna_content + '"/>');
		$(this).append('<input type="hidden" name="qna_no" value="${qnaInfo.qna_no}"/>');
    	
		$(this).append('<input type="hidden" name="qna_ip" value="${pageContext.request.remoteAddr}"/>');
		$(this).attr('action', '${pageContext.request.contextPath}/admin/qna/updateQnaReply.do');
		
	});
    $('#btnList').on('click', function(){
    	location.replace("${pageContext.request.contextPath}/user/qna/qnaList.do");
    })
    
    $('#btnDelete').on('click', function() {
    	var flag = true;
    	if(eval('${!empty LOGIN_MEMBERINFO}')){
    		if('${LOGIN_MEMBERINFO.mem_id}'== '${qnaInfo.qna_writer}'){
		    	//deletefreeboardFormInfo.jsp?bo_no=1
				$(location).attr('href', '/user/deleteQna.do?qna_no=${qnaInfo.qna_no}');
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
</script>
</head>
<body>
<form class="form-horizontal" role="form" action="" method="post" name="qnaView">
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="qna_title" name="qna_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="qna_content"><p></p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
			<!-- Wrapper for slides -->

			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<c:forEach items="${qnaInfo.items }" var="qnafileInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last}">
						<div class="item">
					</c:if>
						<img src="/files/${qnafileInfo.qnafile_name }" alt="pic1"
						onclick="javascript:location.href='/user/qnaFileDownload.do?qnafile_seq=${qnafileInfo.qnafile_seq }';"/>
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
			<button type="button" class="btn btn-info" id="btnList">목록</button>
		</div>
	</div>
</form>
</body>
</html>