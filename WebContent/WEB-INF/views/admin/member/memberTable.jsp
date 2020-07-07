<%@ page language="java" contentType="application/vnd.excel; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="0" cellspacing="1" cellpadding="1">
							<thead>
								<tr>
									
									<th width="20%">아이디</th>
									<th>이름</th>
									<th>생일</th>
									<th>메일</th>
								</tr>
							</thead>
							<tbody class="memberList">
								<c:forEach var="excelmember" items="${excelList }">
									<tr>
										
										<td class="td">${excelmember['mem_id']}</td>
										<td class="td">${excelmember['mem_name']}</td>
										<td class="td">${excelmember['mem_bir']}</td>
										<td class="td">${excelmember['mem_mail']}</td>
									</tr>
								</c:forEach>
							</tbody>
</body>
</html>