<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>
<script type="text/javascript">
$(function() {
	
	$('#noticeRegistBTN').on('click', function() {
		location.replace('${pageContext.request.contextPath}/admin/notice/noticeForm.do');
	});
	
	$('#noticeBody tr').on('click', function() {
		var notice_no = $(this).find('td:eq(0) input').val();
		$(location).attr('href', '${pageContext.request.contextPath}/admin/notice/noticeView.do?notice_no=' + notice_no);
	});
});
</script>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="noticeMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">공지사항</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="60%">제목</th>
							  <th>작성일</th>
							</tr>
						</thead>
						<tbody id="noticeBody">
						
						
						
						<c:if test="$
						{empty noticeList }">
				<tr align="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
				</tr>
				
			</c:if>
			<c:if test="${!empty noticeList }">
				<c:forEach items="${noticeList }" var="noticeInfo">
					<tr>
						<td><input type="hidden" value="${noticeInfo.notice_no }"/>${noticeInfo.rnum }</td>
						<td align="left">
							<%-- <c:forEach begin="1" end="${noticeInfo.notice_no }" varStatus="stat">
								&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
									<i class="fa fa-angle-right"></i>
								</c:if>
							</c:forEach> --%>
							${noticeInfo.notice_title }
							
						</td>
								<td>${noticeInfo.notice_reg_date }</td>
				
					</tr>
				</c:forEach>
			</c:if>	
						
						
						
						
						
							<%-- <c:forEach items="${noticeList }" var="noticeInfo">
							<tr>
								<td>${noticeInfo.notice_no }</td>
								<td>${noticeInfo.notice_title }</td>
								<td>${noticeInfo.notice_writer }</td>
								<td>${noticeInfo.notice_reg_date }</td>
							</tr>
							</c:forEach> --%>
						</tbody>
					</table>
					<form action="/admin/notice.do">
					<div style="text-align:right;">
						<select name="search_keycode" style="width:100px;">
							<option selected="selected" value="TOTAL">전체</option>
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>	
						</select> 
						<input  type="text"  name="search_keyword" id="search_keyword" size="20" /> 
						<input class="btn1" type="submit" value="검색"/>
					</div>
					</form>
 					<div style="text-align:right; margin-top: 5px;">
 						<input class="btn2" type="button" id="noticeRegistBTN" value="등록"/>
 					</div>
 					<%-- ${pagination.paginationMenu } --%>
				</div>
			</td>
		</tr>
	</table>
</div>
<div>

 					${pagination.getPagingHtmls() }
</div>

</body>
</html>