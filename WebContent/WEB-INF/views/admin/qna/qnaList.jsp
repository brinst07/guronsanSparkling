<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 리스트</title>
<script type="text/javascript">
$(function() {
	$('input[type=submit]').on('click', function() {
		location.replace('/admin/qnaForm.do');
	});
	
	$('#qnaBody tr').on('click', function() {
		var qna_no = $(this).find('td:eq(0) input').val();
		$(location).attr('href', '/admin/qnaView.do?qna_no=' + qna_no);
	});
});
</script>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="qnaMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">QnA</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="60%">제목</th>
							  <th>작성자</th>
							  <th>작성일</th>
							</tr>
						</thead>
						<tbody id="qnaBody">
							<c:if test="${empty qnaList }">
								<tr align="center">
									<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
								</tr>
				
							</c:if>
							<c:if test="${!empty qnaList }">
								<c:forEach items="${qnaList }" var="qnaInfo">
									<tr>
										<td><input type="hidden" value="${qnaInfo.qna_no }"/>${qnaInfo.rnum }</td>
										<td align="left">
											<c:forEach begin="1" end="${qnaInfo.qna_depth }" varStatus="stat">
											&nbsp;&nbsp;&nbsp;
												<c:if test="${stat.last }">
													<i class="fa fa-angle-right"></i>
												</c:if>
											</c:forEach>
											${qnaInfo.qna_title }
										</td>
										<td>${qnaInfo.qna_writer}</td>
										<td>${qnaInfo.qna_reg_date }</td>
									</tr>
								</c:forEach>
							</c:if>	
						</tbody>
					</table>
					<form action="/admin/qna.do">
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

 					${pagination.getPagingHtmls()}
				</div>
			</td>
		</tr>
	</table>
</div>

</body>
</html>