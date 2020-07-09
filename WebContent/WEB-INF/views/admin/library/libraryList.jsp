<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 리스트</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	$('input[type=submit]').on('click', function() {
		location.replace('/guronsan/controller/admin/libraryFormAction.do');
	});
	
	$('#libraryRegistBTN').on('click',function(){
		location.href = '/admin/library/libraryForm.tiles'
	});
	
	$('#tbody tr').on('click',function(){
		var library_no = $(this).find('td:eq(0)').text();
		location.href = '${pageContext.request.contextPath}/admin/library/libraryView.do?library_no='+library_no;
	});
	
	$('input[name=src]').on('click',function(){
		$('input[name=select]').val($('#condition').val());
		$('form[name=search]').submit();
	});
});
</script>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="libraryMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자료실</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="60%">제목</th>
							  <th>작성자</th>
							  <th>작성일</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${libraryList }" var="libraryInfo">
							<tr>
								<td>${libraryInfo.library_no }</td>
								<td>
								<c:forEach begin="1" end="${libraryInfo.library_depth }" varStatus="stat">
							&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
									<i class="fa fa-angle-right"></i>
								</c:if>
							</c:forEach>
								${libraryInfo.library_title }</td>
								<td>${libraryInfo.library_writer }</td>
								<td>${libraryInfo.library_reg_date }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					${pagingHTML }
					<form action="/admin/library.do" method="post" name="search">
					<div style="text-align:right;">
						<select style="width:100px;" id="condition">
							<option selected="selected" value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
							<option value="NICKNAME">닉네임</option>
						</select> 
						<input type="hidden" name="search_keycode" value="">
						<input name="unname" type="text" id="search_keyword" size="20" /> 
						<input class="btn1" type="button" name="src" value="검색"/>
					</div>
 					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>