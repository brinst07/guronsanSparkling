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
    $('#faq_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    // 도큐먼트 초기값 설정
    $('#faq_title').val('${faqInfo.faq_title}');
    $('.faq_content').summernote('code','${faqInfo.faq_content}');
    var faq_title = '${faqInfo.faq_title}';
    
    
	$('form[name=faqView]').submit(function() {
	//$('#updateBTN').click(function(){
    	var faq_content = $('.faq_content').summernote('code');
		$(this).append('<input type="hidden" name="faq_content" value="' + faq_content + '"/>');
		$(this).append('<input type="hidden" name="faq_no" value="${faqInfo.faq_no}"/>');
   		$(this).attr('action', '/admin/faq/FAQModifyAction.do');
		
	});
	
	$('#deleteBTN').on('click', function() {
    	
		$(location).attr('href', '/admin/faq/deleteFAQAction.do?faq_no=${faqInfo.faq_no}');
    		
	});
	
	$('#listBTN').on('click', function(){
//    	location.href = "/admin/faq/faqListAction.do?search_keycode=${search_keycode}&search_keyword=${search_keyword}";
    	window.history.back();
    });

    
/*     // 글쓰기
    $('#btn1').click(function(){
    	// /ddit/13/main.jsp?contentPage=/13/freeboard/freeboardForm.jsp
    	$(location).attr('href', '${freeboardFormURI}');
    }); */
    
    // 삭제
    /* $('#btn2').click(function(){
    	var flag = true;
    	if(eval('${!empty LOGIN_MEMBERINFO}')){
    		if('${LOGIN_MEMBERINFO.mem_id}' == '${noticeInfo.notice_writer}'){
		    	// /ddit/13/freeboard/deleteFreeboardInfo.jsp?bo_no=1
		    	$(location).attr('href', '${deleteFreeboardURI}?notice_no=${noticeInfo.notice_no}');	
    		} else {
    			flag = false;
    		}
    		flag = false;
    	} else {
    		flag = false;
    	}
    	if(!flag){
    		BootstrapDialog.show({
    			title: '알림',
    			message: '작성자만 공지사항 삭제가 가능합니다.'
    		});
    	}
    }); */
});
    
</script>

</head>
<body>
<form class="form-horizontal" role="form" action="" method="post" name="faqView">

<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="faqMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">공지사항</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td>
							<input type="text" class="form-control" class="faq_title" id="faq_title" name="faq_title" ></input>
						  </td>
						  <!-- <td><label rows="10" cols="110" class="notice_title" disabled="disabled" style="overflow: auto;"></textarea></td> -->
						</tr>
						 <tr>
						  <th>작성자</th>
						  <td><label class="faq_writer"></label></td>
						</tr> 
						
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="faq_content" disabled="disabled" style="overflow: auto;"></textarea> </td>
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
					
		<!-- <label class="control-label col-sm-2" for="faq_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			Indicators
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
			Wrapper for slides

			
			Left and right controls
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div> -->
		
				</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>