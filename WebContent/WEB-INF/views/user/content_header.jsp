<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page-title-breadcrumb">
	<ol class="breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="/user/notice/noticeList.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li>${boardlist }&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li class="active"><a href="${boardhref }">목록</a></li>
		<li><i class="fa fa-angle-right"></i>&nbsp;&nbsp;${boardview }&nbsp;&nbsp;&nbsp;&nbsp;</li>
	</ol>
	<div class="clearfix"></div>
</div>
</body>
</html>