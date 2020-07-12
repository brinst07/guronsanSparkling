<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는질문</title>
<script type="text/javascript">
$(function() {
	$('button[type=button]').on('click', function() {
		location.replace('/user/faq/faqFormAction.do');
	});
	
	$('#freeboardBody tr').on('click', function() {
		faq_no = $(this).find('td:eq(0) input').val();
		
		rnum = $(this).find('td:eq(0)').text();
		
		var search_keycode = '${search_keycode}';
		var search_keyword = '${search_keycode}';
		
		$(location).attr('href', '/user/faq/faqView.do?faq_no=' + faq_no);
	});
	
});
</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">자주하는 질문</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="freeboardBody">
			<c:if test="${empty faqList }">
				<tr align="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
				</tr>
			</c:if>
			
			<c:if test="${!empty faqList }">
				<c:forEach items="${faqList }" var="faqInfo">
					<tr>
						<%-- ${freeboardInfo.bo_rnum } --%>
						<td><input type="hidden" value="${faqInfo.faq_no }"/>${faqInfo.rnum }</td>
						<td align="left">							
							${faqInfo.faq_title }
						</td>
						<td>${faqInfo.faq_writer }</td>
						<td>${faqInfo.faq_reg_date }</td>
						<td>${faqInfo.faq_hit }</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
<div >
${pagination}
<form action="/user/faq/faqList.do" method="post" class="form-inline pull-right">
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