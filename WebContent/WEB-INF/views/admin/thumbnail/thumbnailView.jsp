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
<script type="text/javascript">
$(function(){
	 $('#btnList').on('click', function(){
	    	//location.replace("/admin/thumbnail/thumbnailList.do");
		 	window.history.back();
	    })
	    
	    $('#btnDelete').on('click', function() {	    	
			$(location).attr('href', '/admin/thumbnail/deleteThumbnail.do?thumbnail_no=${thumbnailInfo.thumbnail_no}');
		});
	  
	 $('form[name=freeboardView]').submit(function() {
		 if(!$('#thumbnail_title').val().validationTITLE()){
	    		return alertPrint('제목을 바르게 입력해주세요.'); 
	    	}
	    	if(!$('#thumbnail_nickname').val().validationNICKNAME()){
	    		return alertPrint('대화명을 바르게 입력해주세요.');
	    	}
	    	if(!$('#thumbnail_pwd').val().validationPWD()){
	    		return alertPrint('패스워드를 바르게 입력해주세요.');
	    	}
	    	if(!$('#thumbnail_mail').val().validationMAIL()){
	    		return alertPrint('메일을 바르게 입력해주세요.');
	    	}
	    	
			$(this).attr('action', '/user/thumbnail/updateThumbnail.do');
		});
	
})
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
			<td width="180"><jsp:include page="thumbnailMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
			<form action="/admin/thumbnail/updateThumbnailForm.do" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${thumbnailInfo.thumbnail_nickname }" name="thumbnail_nickname">
				<input type="hidden" value="${thumbnailInfo.thumbnail_pwd }" name="thumbnail_pwd">
				<input type="hidden" value="${thumbnailInfo.thumbnail_mail }" name="thumbnail_mail">
				<input type="hidden" value="${thumbnailInfo.thumbnail_hit }" name="thumbnail_hit">
				<input type="hidden" value="${thumbnailInfo.thumbnail_reg_date }" name="thumbnail_reg_date">
				<input type="hidden" value="${thumbnailInfo.thumbnail_status }" name="thumbnail_status">
				<input type="hidden" value="${pageContext.request.remoteAddr}" name="thumbnail_ip" />
				
				<div id="container">
					<div class="title">썸네일</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>번호</th>
						  <td><label class="thum_no">${thumbnailInfo.thumbnail_no }</label>
						  <input type="hidden" value="${thumbnailInfo.thumbnail_no }" name="thumbnail_no">
						  </td>
						</tr>
						<tr>
						  <th>제목</th>
						  <td><label class="thum_title">${thumbnailInfo.thumbnail_title }</label></td>
						  <input type="hidden" value="${thumbnailInfo.thumbnail_title }" name="thumbnail_title">
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="thum_writer">${thumbnailInfo.thumbnail_writer }</label></td>
						    <input type="hidden" value="${thumbnailInfo.thumbnail_writer }" name="thumbnail_writer">
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" id="text" class="thum_content"  style="overflow: auto;" disabled="disabled"	>${thumbnailInfo.thumbnail_content }</textarea> 
						  <input type="hidden"  value="${thumbnailInfo.thumbnail_content }" name="thumbnail_content">
						  </td>
						</tr>
						<tr>
						  <th>첨부파일</th>
							  <td>
							  <c:if test="${!empty thumbnailInfo.items}">
							  	<img src="/files/${thumbnailInfo.items.get(0).thumbfile_name }" alt="pic1"
									onclick="javascript:location.href='/user/thumbnail/thumbFileDownload.do?thumbfile_seq=${thumbnailInfo.items.get(0).thumbfile_seq }';" 
										width="100px" height="80px"
								/>
							  </c:if>
							  <c:if test="${empty thumbnailInfo.items}">
							  		<img src="/files/noimg.jpg" width="200px" height="200px" alt="pic1">
							  </c:if>
							  </td>
						</tr>
					</table>
					<div style="text-align:right">
						<input class="btn2" type="submit"  id="modify" value="수정"/> 
						<input class="btn2" type="button" id="btnDelete" value="삭제"/> 
						<input class="btn2" type="button" id="btnList" value="목록"/>
					</div>
				</div>
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>