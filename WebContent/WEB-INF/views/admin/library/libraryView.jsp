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
	/* $('#modify').on('click',function(){
		$('input[name=content]').val($('#text').val());
		$('form').submit();
		location.replace('${pageContext.request.contextPath}/admin/library/updateLibrary.do');
	}); */
	
	// 도큐먼트 초기값 설정
	$('#library_title').val('${libraryInfo.library_title}');
	$('#library_writer').val('${libraryInfo.library_writer}');
	$('#library_content').val('${libraryInfo.library_content}');
	var library_title = '{libraryInfo.library_title}';
	var library_writer = '{libraryInfo.library_writer}';
	
	
	$('form[name=libraryView]').submit(function(){
		
		if(!$('#library_title').val().validationTITLE()){
    		return alertPrint('제목을 바르게 입력해주세요.'); 
    	}
		
		var library_content = $('#library_content').val();
		$(this).append('<input type="hidden" name="library_nickname" value="${libraryInfo.library_nickname}"/>');
		$(this).append('<input type="hidden" name="library_content" value="'+library_content+'"/>');
		$(this).append('<input type="hidden" name="library_no" value="${libraryInfo.library_no}"/>');
		$(this).attr('action', '${pageContext.request.contextPath}/admin/library/updateLibrary.do');
	});
	
	$('#delete').on('click',function(){
		var library_no = $('input[name=library_no]').val();
		location.href='${pageContext.request.contextPath}/admin/library/deleteLibrary.do?library_no='+library_no;
	});
	
	$('#list').on('click', function(){
		location.replace('${pageContext.request.contextPath}/admin/library/libraryList.do');
    })
})
</script>
</head>
<body>
<form action="form-horizontal" role="form" action="" method="post" name="libraryView">

<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="libraryMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
			<form action="/admin/libraryFileUpload.do" method="post" enctype="multipart/form-data">
				<div id="container">
					<div class="title">자료실</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>번호</th>
						  <td><label class="library_no">${libraryInfo.rnum }</label>
						   </td>
						</tr>
						<tr>
						  <th>제목</th>
						  <td>
						  <input type="text" class="form-control" id="library_title" class="library_title" name="library_title" ></input>
						  
<%-- 						  <label id="library_title" class="library_title">${libraryInfo.library_title }</label></td> --%>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label id="library_writer" class="library_writer">${libraryInfo.library_writer }</label>
						  </td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110"  id="library_content" class="library_content"  style="overflow: auto;">${libraryInfo.library_content }</textarea> 
						  </td>
						</tr>
						<tr>
						  <th>첨부파일</th>
						  <td>
						  	<c:forEach items="${filesList }" var="file">
						  		<a href="/user/library/libraryFileDownload.do?library_no=${file.getLibraryfile_seq()}">${file.getLibraryfile_name() }</a>
						  	</c:forEach>
						  	<input type="file" name="addfile">
						  </td>

						</tr>
					</table>
					
					<label class="control-label col-sm-2" for="library_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
			<!-- Wrapper for slides -->

			<div class="carousel-inner" role="listbox" style="height: 450px;">
				<c:forEach items="${libraryInfo.items }" var="libraryitemInfo" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last}">
						<div class="item">
					</c:if>
						<img src="/files/${libraryitemInfo.libraryfile_name }" alt="pic1"
						onclick="javascript:location.href='/user/library/libraryFileDownload.do?libraryfile_seq=${libraryitemInfo.libraryfile_seq }';" />
					</div>
				</c:forEach>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
				
	
				</div>
				
					<div style="text-align:right">
						<input class="btn2" type="submit"  id="modify" value="수정"/> 
						<input class="btn2" type="button" id="delete" value="삭제"/> 
						<input class="btn2" type="button" id="list" value="목록"/>
					</div>
				
				</form>
			</td>
		</tr>
	</table>
</div>

</form>
</body>
</html>