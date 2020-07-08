<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    // 도큐먼트 초기값 설정
    $('#bo_title').val('${freeboardInfo.bo_title}');
    $('#bo_writer').val('${freeboardInfo.bo_writer}');
    $('.bo_content').summernote('code','${freeboardInfo.bo_content}');
    var bo_title = '${freeboardInfo.bo_title}';
    
    
	$('form[name=freeboardView]').submit(function() {
    	if(!$('#bo_title').val().validationTITLE()){
    		return alertPrint('제목을 바르게 입력해주세요.'); 
    	}
	
		//$('#updateBTN').click(function(){
    	var bo_content = $('.bo_content').summernote('code');
		$(this).append('<input type="hidden" name="bo_content" value="' + bo_content + '"/>');
		$(this).append('<input type="hidden" name="bo_no" value="${freeboardInfo.bo_no}"/>');
		$(this).append('<input type="hidden" name="bo_writer" value="${freeboardInfo.bo_writer}"/>');
   		$(this).attr('action', '${pageContext.request.contextPath}/admin/freeboard/updateFreeboard.do');
		
	});
	
	$('#deleteBTN').on('click', function() {
    	
		$(location).attr('href', '${pageContext.request.contextPath}/admin/freeboard/deleteFreeboard.do?bo_no=${freeboardInfo.bo_no}');
    		
	});
	
	$('#listBTN').on('click', function(){
    	location.replace("${pageContext.request.contextPath}/admin/freeboard/freeboardList.do");
    })

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
<form class="form-horizontal" role="form" action="" method="post" name="freeboaradView">

<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="freeboardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자유게시판</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td>
							<input type="text" class="form-control" class="bo_title" id="bo_title" name="bo_title" ></input>
						  </td>
						  <!-- <td><label rows="10" cols="110" class="notice_title" disabled="disabled" style="overflow: auto;"></textarea></td> -->
						</tr>
						<tr>
						  <th>작성자</th>
						  <td>
							<input type="text" class="form-control" class="bo_writer" id="bo_writer" name="bo_writer" disabled="disabled"></input>
						  </td>
						</tr>						
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="bo_content" disabled="disabled" style="overflow: auto;"></textarea> </td>
						</tr>
						<!-- <tr>
						  <th>IP Addr.</th>
						  <td><label class="bo_ip"></label></td>
						</tr> -->
					</table>
					<div style="text-align:right">
						<input class="btn2" id="updateBTN" type="submit" value="수정"/> 
						<input class="btn2" id="deleteBTN" type="button"  value="삭제"/> 
						<input class="btn2" id="listBTN" type="button"  value="목록"/>
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
				<c:forEach items="${freeboardInfo.items }" var="freeboarditemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last}">
						<div class="item">
					</c:if>
						<img src="/files/${freeboarditemInfo.freefile_save_name }" alt="pic1"
						onclick="javascript:location.href='/user/fileDownload.do?freefile_seq=${freeboarditemInfo.freefile_seq }';" />
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