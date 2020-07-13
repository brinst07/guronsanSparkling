<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<script type="text/javascript">
$(function() {
	$('button[type=button]').on('click', function() {
		location.replace('/user/noticeboardFormAction.do');
	});
	
	$('#noticeBody tr').on('click', function() {
		
		
		notice_no = $(this).find('td:eq(0) input').val();
		
		rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/user/notice/noticeView.do?notice_no=' + notice_no);
	});
	
});
</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">공지사항 목록</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="noticeBody">
			<c:if test="${empty noticeList }">
				<tr align="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
				</tr>
			</c:if>
			
			<c:if test="${!empty noticeList }">
				<c:forEach items="${noticeList }" var="noticeInfo">
					<tr>
						<%-- ${freeboardInfo.bo_rnum } --%>
						<td><input type="hidden" value="${noticeInfo.notice_no }"/>${noticeInfo.rnum }</td>
						<td align="left">				
							${noticeInfo.notice_title }
						</td>
						<td>${noticeInfo.notice_reg_date }</td>
						<td>${noticeInfo.notice_hit }</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
<div >
${pagination.getPagingHtmls() }
<form action="${pageContext.request.contextPath}/user/notice/noticeList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
</form>
</div>	
</body>
</html>