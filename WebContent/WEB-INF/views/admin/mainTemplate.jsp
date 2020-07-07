<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="page-content">
				<tiles:insertAttribute name="content"></tiles:insertAttribute>
			</div>
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</div>
	</div>
</body>
</html>