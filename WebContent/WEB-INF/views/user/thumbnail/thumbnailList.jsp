<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script type="text/javascript">
$(function() {
	
	$('button[type=button]').on('click', function() {
		location.replace('/user/thumbnail/thumbnailForm.do');
	});
	
	$('#freeboardBody tr').on('click', function() {
		thumbnail_no = $(this).find('td:eq(0) input').val();		
		rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '/user/thumbnail/thumbnailView.do?thumbnail_no=' + thumbnail_no);
	});
	
});
</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">썸네일 게시판</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
				
					<th scope="col" width="1%"></th>
					<th scope="col" width="10%">썸네일</th>
					<th scope="col" width="59%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="freeboardBody">
			<c:if test="${empty thumbnailList }">
				<tr align="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
				</tr>
			</c:if>
			
			<c:if test="${!empty thumbnailList }">
				<c:forEach items="${thumbnailList }" var="thumbnailInfo">
					<tr>
						<%-- ${freeboardInfo.bo_rnum } --%>
						<td><input type="hidden" value="${thumbnailInfo.thumbnail_no }"/></td>

						<td>
							<c:if test="${!empty thumbnailInfo.items}">
								<img src="/files/${thumbnailInfo.items.get(0).thumbfile_save_name}" width="200px" height="200px" alt="pic1">
							</c:if>
							<c:if test="${empty thumbnailInfo.items}">
								<img src="/files/dsfsd8aa6802b198243779a54ddf7eb9c6dfd.jpg" width="200px" height="200px" alt="pic1">
							</c:if>
						</td>
						<td align="left">							
							${thumbnailInfo.thumbnail_title }
						</td>
						<td>${thumbnailInfo.thumbnail_nickname }</td>
						<td>${thumbnailInfo.thumbnail_reg_date }</td>
						<td>${thumbnailInfo.thumbnail_hit }</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
<div >
${pagination.getPagingHtmls() }
<form action="${pageContext.request.contextPath}/user/thumbnail/thumbnailList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="NICKNAME">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" class="btn btn-info form-control">게시글 등록</button>
</form>
</div>	
</body>
</html>