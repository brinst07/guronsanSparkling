<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('table tr:gt(0)').on('click',function(){
			var mem_id = $(this).find('td:eq(0)').text();
			$(location).attr('href','${pageContext.request.contextPath}/user/member/memberView.do?mem_id='+mem_id);
		});
	});
</script>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>성명</th>
			<th>주민번호1</th>
			<th>직업</th>
			<th>취미</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${memberList }" var="member">
		<tr>
			<td>${member.mem_id }</td>
			<td>${member.mem_name }</td>
			<td>${member.mem_regno1}</td>
			<td>${member.mem_job }</td>
			<td>${member.mem_like }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>