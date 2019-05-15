<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

	<c:url value="/home" var="mainUrl"></c:url>
	<a id="home" href="${mainUrl}">로딩중입니당..</a>
</body>

<script>
	$(document).ready(function() {
		let href = $('#home').attr('href');
		window.location.href = href;
	});
</script>
</html>

