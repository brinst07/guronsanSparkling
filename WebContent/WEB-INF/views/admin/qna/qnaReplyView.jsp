<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 보기</title>

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
    // 도큐먼트 초기값 설정
    $('#qna_title').val('${qnaInfo.qna_title}');
    $('.qna_content').summernote('code','${qnaInfo.qna_content}');
    var qna_title = '${qnaInfo.qna_title}';
    var qna_group = '${qnaInfo.qna_group}';
    var qna_depth = '${qnaInfo.qna_depth}';
    var qna_seq = '${qnaInfo.qna_seq}';
    
	
	$('#listBTN').on('click', function() {
		$(location).attr('href', '${pageContext.request.contextPath}/admin/qna/qnaList.do');
	});
	$('#deleteBTN').on('click', function() {
		$(location).attr('href', '${pageContext.request.contextPath}/admin/qna/deleteQnaReply.do?qna_no=${qnaInfo.qna_no}');
	});
	
	$('#btn3').click(function(){
	 	var queryString = '?rnum=${qnaInfo.rnum}&qna_title='+qna_title;
	 	var parentInfo = '&qna_group='+qna_group+'&qna_seq='+qna_seq+'&qna_depth='+qna_depth;
	 	$(location).attr('href','/admin/qnaReplyForm.do' + queryString + parentInfo); 
	});
	
	$('form[name=qnaReplyView]').submit(function() {
    	if(!$('#qna_title').val().validationTITLE()){
    		return alertPrint('제목을 바르게 입력해주세요.'); 
    	}
    	
    	var qna_content = $('.qna_content').summernote('code');
		$(this).append('<input type="hidden" name="qna_content" value="' + qna_content + '"/>');
		$(this).append('<input type="hidden" name="qna_no" value="${qnaInfo.qna_no}"/>');
    	
		$(this).append('<input type="hidden" name="qna_ip" value="${pageContext.request.remoteAddr}"/>');
		$(this).attr('action', '${pageContext.request.contextPath}/admin/qna/updateQnaReply.do');
		
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
<form class="form-horizontal" role="form" action="" method="post" name="qnaReplyView">

<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="qnaMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">Q&A</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td>
							<input type="text" class="form-control" class="qna_title" id="qna_title" name="qna_title" ></input>
						  </td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="qna_content" disabled="disabled" style="overflow: auto;"></textarea> </td>
						</tr>
					</table>
					<div style="text-align:right">
						<button type="button" id="listBTN" class="btn btn-primary">목록</button>
						<button type="submit" id="updateBTN" class="btn btn-primary" >수정</button>
						<button type="button" id="deleteBTN" class="btn btn-primary" >삭제</button>
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
				<c:forEach items="${qnaInfo.items }" var="qnaitemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last}">
						<div class="item">
					</c:if>
						<img src="/files/${qnaitemInfo.qnafile_name }" alt="pic1"
						onclick="javascript:location.href='/user/qna/qnaFileDownload.do?qnafile_seq=${qnaitemInfo.qnafile_seq }';"/>
					</div>
				</c:forEach>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
		
				</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>