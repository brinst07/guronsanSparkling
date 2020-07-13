<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주하는질문 리스트</title>
<script type="text/javascript">
$(function() {
	
	$('#faqRegistBTN').on('click', function() {
		location.replace('/admin/faq/faqRegistForm.do');
	});
	
	$('#faqBody tr').on('click', function() {
		bo_title = $(this).find('td:eq(1) input').val();
		if(bo_title=='삭제된게시글입니다'){
			alert('삭제된 게시글 입니다.');
			return true;
		}else if(bo_title=='삭제된댓글입니다'){
			alert('삭제된 댓글 입니다.');
			return true;
		}
		var faq_no = $(this).find('td:eq(0) input').val();

		$(location).attr('href', '/admin/faq/faqViewAction.do?faq_no=' + faq_no+'&search_keycode=${search_keycode}&search_keyword=${search_keyword}');
	});
});
</script>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="faqMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자주하는 질문</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="60%">제목</th>
							  <th>작성일</th>
							</tr>
						</thead>
						<tbody id="faqBody">
						
						
						
						<c:if test="${empty faqList }">
				<tr align="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
				</tr>
				
			</c:if>
			<c:if test="${!empty faqList }">
				<c:forEach items="${faqList }" var="faqInfo">
					<tr>
						<td><input type="hidden" value="${faqInfo.faq_no }"/>${faqInfo.rnum }</td>
						<td align="left">
							<%-- <c:forEach begin="1" end="${noticeInfo.notice_no }" varStatus="stat">
								&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
									<i class="fa fa-angle-right"></i>
								</c:if>
							</c:forEach> --%>
							<input type="hidden" value="${faqInfo.faq_title }"/>
							${faqInfo.faq_title }
							
						</td>
								<td>${faqInfo.faq_reg_date }</td>
				
					</tr>
				</c:forEach>
			</c:if>	
						</tbody>
					</table>
					<form action="/admin/faq/faqList.do">
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
 						<input class="btn2" type="button" id="faqRegistBTN" value="등록"/>
 					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
<div>

${pagination}
</div>

</body>
</html>