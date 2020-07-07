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
		$('input[type=submit]').on('click', function() {
			location.replace('/guronsan/controller/admin/thumFormAction.do');
		});

		$('#thumRegistBTN').on('click', function() {
			location.href = '/admin/thum/thumForm.tiles'
		});

		$('#tbody tr').on('click', function() {
			var num = $(this).find('td:eq(0)').text();
			location.href = '/admin/thum/thumInfo.do?num=' + num;
		});

		$('input[name=src]').on('click', function() {
			$('input[name=select]').val($('#condition').val());
			$('form[name=search]').submit();
		});
		
		$('input[name=add]').on('click',function(){
			location.href = '/admin/thum/thumForm.tiles';
		});
		
	});
</script>
</head>
<body>
	<div class="wrap">
		<table width="1000" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td width="180"><jsp:include page="thumMenu.jsp"></jsp:include></td>
				<td width="30">&nbsp;</td>
				<td width="790">
					<div id="container">
						<div class="title">자료실</div>
						<table border="0" cellspacing="1" cellpadding="1">
							<thead>
								<tr>
									<th width="5%">번호</th>
									<th width="50%">사진</th>
									<th width="60%">제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody id="freeboardBody">
								<c:if test="${empty thumbnailList }">
									<tr align="center">
										<td colspan="5"><font color="red">등록된 게시글이 존재하지
												않습니다.</font></td>
									</tr>
								</c:if>

								<c:if test="${!empty thumbnailList }">
									<c:forEach items="${thumbnailList }" var="thumbnailInfo">
										<tr>
											<%-- ${freeboardInfo.bo_rnum } --%>
											<td><input type="hidden"
												value="${thumbnailInfo.thumbnail_no }" />${thumbnailInfo.rnum }</td>

											<td><c:if test="${!empty thumbnailInfo.items}">
													<img
														src="/files/${thumbnailInfo.items.get(0).thumbfile_save_name}"
														width="200px" height="200px" alt="pic1">
												</c:if> <c:if test="${empty thumbnailInfo.items}">
													<img src="/files/spring.png"
														width="200px" height="200px" alt="pic1">
												</c:if>
											</td>
											<td align="left">${thumbnailInfo.thumbnail_title }</td>
											<td>${thumbnailInfo.thumbnail_nickname }</td>
											<td>${thumbnailInfo.thumbnail_reg_date }</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						${pagination }
						<form action="/admin/thum.do" method="post" name="search">
							<div style="text-align: right;">
								<select style="width: 100px;" id="condition">
									<option selected="selected" value="TITLE">제목</option>
									<option value="CONTENT">내용</option>
									<option value="NICKNAME">닉네임</option>
								</select> <input type="hidden" name="select" value=""> <input
									name="unname" type="text" id="uname" size="20" /> <input
									class="btn1" type="button" name="src" value="검색" />
									<input
									class="btn1" type="button" name="add" value="등록" />
							</div>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>