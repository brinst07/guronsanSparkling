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
    $('#qna_writer').val('${qnaInfo.qna_writer}');
    $('#qna_mail').val('${qnaInfo.qna_mail}');
    var qna_title = '${qnaInfo.qna_title}';
    var qna_group = '${qnaInfo.qna_group}';
    var qna_depth = '${qnaInfo.qna_depth}';
    var qna_seq = '${qnaInfo.qna_seq}';
    var qna_writer = '${qnaInfo.qna_writer}';
    
	
	$('#listBTN').on('click', function() {
		$(location).attr('href', '${pageContext.request.contextPath}/admin/qna/qnaList.do');
	});
	
	$('#btn3').click(function(){
		
// 		$(location).attr('href','${pageContext.request.contextPath}/admin/qna/qnaReplyCheck.do?qna_no=${qnaInfo.qna_no}');
// 		$(location).attr('href','/admin/qnaReplyCheck.do?qna_no=${qnaInfo.qna_no}');
		var flag = '${flag}';
		
		if(flag == true){
		 	var queryString = '?rnum=${qnaInfo.rnum}&qna_title='+qna_title;
		 	var parentInfo = '&qna_group='+qna_group+'&qna_seq='+qna_seq+'&qna_depth='+qna_depth + '&qna_writer=' + qna_writer;
	 		$(location).attr('href','${pageContext.request.contextPath}/admin/qna/qnaReplyForm.do' + queryString + parentInfo); 
		}
		else{
			alert('댓글이 존재합니다.');
			return false;
		} 
		
		/* var queryString = '?rnum=${qnaInfo.rnum}&qna_title='+qna_title;
	 	var parentInfo = '&qna_group='+qna_group+'&qna_seq='+qna_seq+'&qna_depth='+qna_depth;
 		$(location).attr('href','/admin/qnaReplyForm.do' + queryString + parentInfo);  */
	});
	/* $('#btn3').on('click', function() {
    	var flag = true;
    	if(eval('${qnaInfo.qna_group}') == '0'){
    		var queryString = '?rnum=${qnaInfo.rnum}&qna_title='+qna_title;
    	 	var parentInfo = '&qna_group='+qna_group+'&qna_seq='+qna_seq+'&qna_depth='+qna_depth;
    		$(location).attr('href','/admin/qnaReplyForm.do' + queryString + parentInfo); 
    	}else{
	    	flag = false;
    	}
    	if(!flag){
    		BootstrapDialog.show({
			    title: '알림',
			    message: '답글하나만 작성 가능.'
			});
    	}
	}); */

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
<form class="form-horizontal" role="form" action="" method="post" name="qnaView">

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
						  <th>작성자</th>
						  <td>
							<input type="text" class="form-control" class="qna_writer" id="qna_writer" name="qna_writer" ></input>
						  </td>
						</tr>
						<tr>
						  <th>메일</th>
						  <td>
							<input type="text" class="form-control" class="qna_mail" id="qna_mail" name="qna_mail" ></input>
						  </td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="qna_content" disabled="disabled" style="overflow: auto;"></textarea> </td>
						</tr>
					</table>
					<div style="text-align:right">
						<c:if test="${qnaInfo.qna_depth eq '0'}">
							<button type="button" class="btn btn-primary" id="btn3">답글</button>
						</c:if>
						<input class="btn2" id="listBTN" type="button" value="목록"/>
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
						<img src="/files/${qnaitemInfo.qnafile_save_name }" alt="pic1" 
						onclick="javascript:location.href='/user/qnaFileDownload.do?qnafile_seq=${qnaitemInfo.qnafile_seq }';"/>
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