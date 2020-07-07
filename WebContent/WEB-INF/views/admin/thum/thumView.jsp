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
	$('#modify').on('click',function(){
		$('input[name=content]').val($('#text').val());
		alert($('#text').text());
		$('form').submit();
	});
})
</script>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="thumMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
			<form action="/admin/thumFileUpload.do" method="post" enctype="multipart/form-data">
				<div id="container">
					<div class="title">썸네일</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>번호</th>
						  <td><label class="thum_title">${vo.getthum_no() }</label>
						  <input type="hidden" value="${vo.getthum_no() }" name="no">
						  </td>
						</tr>
						<tr>
						  <th>제목</th>
						  <td><label class="thum_title">${vo.getthum_title() }</label></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="thum_writer">${vo.getthum_writer() }</label>
						  </td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" id="text" class="thum_content"  style="overflow: auto;">${vo.getthum_content() }</textarea> 
						  <input type="hidden" value="" name="content">
						  </td>
						</tr>
						<tr>
						  <th>첨부파일</th>
						  <td>
						  	<c:forEach items="${filesList }" var="file">
						  		<a href="/admin/thum/filedown.do?num=${file.getthumfile_seq()}">${file.getthumfile_name() }</a>
						  	</c:forEach>
						  	<input type="file" name="addfile">
						  </td>
						  
						</tr>
					</table>
					<div style="text-align:right">
						<input class="btn2" type="button"  id="modify" value="수정"/> 
						<input class="btn2" type="button" id="delete" value="삭제"/> 
						<input class="btn2" type="button" id="list" value="목록"/>
					</div>
				</div>
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>