<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 리스트</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$('#addBTN').on('click', function() {
			location.replace('/admin/thumbnail/thumbnailForm.do');
		});
		
		$('#freeboardBody tr').on('click', function() {
			thumbnail_no = $(this).find('td:eq(0) input').val();		
			rnum = $(this).find('td:eq(0)').text();
			$(location).attr('href', '/admin/thumbnail/thumbnailView.do?thumbnail_no=' + thumbnail_no);
		});
	});
</script>
</head>
<body>
	<div class="wrap">
		<table width="1000" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td width="180"><jsp:include page="thumbnailMenu.jsp"></jsp:include></td>
				<td width="30">&nbsp;</td>
				<td width="790">
					<div id="container">
						<div class="title">자료실</div>
						<table border="0" cellspacing="1" cellpadding="1">
							<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="10%">썸네일</th>
					<th scope="col" width="55%">제목</th>
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
						<td><input type="hidden" value="${thumbnailInfo.thumbnail_no }"/>${thumbnailInfo.rnum }</td>

						<td>
							<c:if test="${!empty thumbnailInfo.items}">
								<img src="/files/${thumbnailInfo.items.get(0).thumbfile_save_name}" width="40px" height="40px" alt="pic1">
							</c:if>
							<c:if test="${empty thumbnailInfo.items}">
								<img src="/files/dsfsd8aa6802b198243779a54ddf7eb9c6dfd.jpg" width="40px" height="40px" alt="pic1">
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
${pagination.getPagingHtmls() }
						<form action="/admin/thumbnail/thumbnailList.do" method="post" name="search">
							<div style="text-align: right;">
								<select style="width: 100px;" id="search_keycode" name="search_keycode">
									<option selected="selected" value="TITLE">제목</option>
									<option value="CONTENT">내용</option>
									<option value="NICKNAME">닉네임</option>
								</select> 
								<input name="search_keyword" type="text" id="search_keyword" size="20" />
								<input class="btn1" type="submit" id="submitBTN" value="검색" />
								<input class="btn1" type="button" id="addBTN" value="등록" />
							</div>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>