<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 수정</title>
<script type="text/javascript">
$(function(){
	$('#listBTN').on('click',function(){
		location.replace("/admin/thumbnail/thumbnailList.do");
	});
	
	$('form[name=freeboardView]').submit(function() {
		 if(!$('#thumbnail_title').val().validationTITLE()){
	    		return alertPrint('제목을 바르게 입력해주세요.'); 
	    	}
	    		    	
		var thumbnail_content = $('#thumbnail_content').val();
		var thumbnail_title = $('#thumbnail_title').val();
		$(this).append('<input type="hidden" name="thumbnail_title" value="' + thumbnail_title + '"/>');
		$(this).append('<input type="hidden" name="thumbnail_content" value="' + thumbnail_content + '"/>');
		$(this).append('<input type="hidden" name="thumbnail_no" value="${param.thumbnail_no}"/>');
		$(this).append('<input type="hidden" name="thumbnail_ip" value="${pageContext.request.remoteAddr}"/>');
		$(this).append('<input type="hidden" name="thumbnail_nickname" value="${param.thumbnail_nickname}"/>');
		$(this).append('<input type="hidden" name="thumbnail_pwd" value="${param.thumbnail_pwd}"/>');
		$(this).append('<input type="hidden" name="thumbnail_mail" value="${param.thumbnail_mail}"/>');
		$(this).append('<input type="hidden" name="thumbnail_hit" value="${param.thumbnail_hit}"/>');
		$(this).append('<input type="hidden" name="thumbnail_reg_date" value="${param.thumbnail_reg_date}"/>');
		$(this).append('<input type="hidden" name="thumbnail_status" value="${param.thumbnail_status}"/>');
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
<form name="freeboardView" action="/admin/thumbnail/updateThumbnail.do">
	<div class="wrap">
		<table width="1000" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td width="180"><jsp:include page="thumbnailMenu.jsp"></jsp:include></td>
				<td width="30">&nbsp;</td>
				<td width="790"> 
					<div id="container">
						<div class="title">썸네일</div>
						<table border="0" cellspacing="1" cellpadding="1">
							<tr>
							  <th>제목</th>
							  <td><input type="text" id="thumbnail_title" class="thumbnail_title" value="${param.thumbnail_title }"></td>
							</tr>
							<tr>
							  <th>작성자</th>
							  <input type="hidden" class="thumbnail_writer" value="${param.thumbnail_writer }">
							  <td><input type="text" class="thumbnail_writer" disabled="disabled" value="${param.thumbnail_writer }"></td>
							</tr>
							<tr>
							  <th>내용</th>
							  <td><textarea rows="10" cols="110" class="thumbnail_content" id="thumbnail_content" style="overflow: auto;" >${param.thumbnail_content }</textarea> </td>
							</tr>
							<tr>
							  <th>IP Addr.</th>
							  <td><input type="text" class="thumbnail_ip" disabled="disabled" value="${pageContext.request.remoteAddr}"></td>
							</tr>
						</table>
						<table border="0" cellspacing="0" cellpadding="0">
						  <tr></tr>
						</table>
						<div style="text-align:right">
							<input class="btn2" type="submit"  value="등록"/> 
							<input class="btn2" type="button" id="listBTN" value="목록"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>	
</form>
</body>
</html>