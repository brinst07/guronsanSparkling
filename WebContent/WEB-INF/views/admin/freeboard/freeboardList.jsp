<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 리스트</title>
<script type="text/javascript">
$(function() {
	
	$('#freeboardBody tr').on('click', function() {
		var bo_no = $(this).find('td:eq(0) input').val();
		$(location).attr('href', '${pageContext.request.contextPath}/admin/freeboard/freeboardView.do?bo_no=' + bo_no);
	});
});
</script>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="freeboardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자유게시판</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="50%">제목</th>
							  <th width="20%">작성자</th>
							  <th>작성일</th>
							</tr>
						</thead>
						<tbody id="freeboardBody">
						
						
						
						<c:if test="${empty freeboardList }">
				<tr align="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
				</tr>
				
			</c:if>
			<c:if test="${!empty freeboardList }">
				<c:forEach items="${freeboardList }" var="freeboardInfo">
					<tr>
						<td><input type="hidden" value="${freeboardInfo.bo_no }"/>${freeboardInfo.rnum }</td>
						<td align="left">
							<c:forEach begin="1" end="${freeboardInfo.bo_depth }" varStatus="stat">
								&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
									<i class="fa fa-angle-right"></i>
								</c:if>
							</c:forEach>
							${freeboardInfo.bo_title }							
						</td>
						<td>${freeboardInfo.bo_writer }</td>
						<td>${freeboardInfo.bo_reg_date }</td>
					</tr>
				</c:forEach>
			</c:if>	
		</tbody>
					</table>
					<form action="${pageContext.request.contextPath}/admin/freeboard/freeboardList.do">
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