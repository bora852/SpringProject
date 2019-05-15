<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*,java.net.*,javax.xml.parsers.*,org.w3c.dom.*,javax.xml.xpath.*,org.xml.sax.InputSource"%>
<%@ page import="com.ssafy.model.service.*"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>안전먹거리 프로젝트</title>
<head>
<!-- js, jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
<c:url value="/static/css/heroic-features.css" var="heroiccss"></c:url>
<c:url value="/static/css/main.css" var="maincss"></c:url>
<c:url value="/static/css/modal.css" var="modalcss"></c:url>
<link href="${heroiccss }" rel="stylesheet">
<link href="${maincss }" rel="stylesheet">
<link href="${modalcss }" rel="stylesheet">
<script src="http://www.w3schools.com/lib/w3data.js"></script>
<style>
div.jumbotron:hover div.for_hover {
	display: block;
}

.label {
	height: 25px;
	display: inline;
	padding: .2em .6em .3em;
	font-size: medium;
	font-weight: 700;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: .25em;
	line-height: 18px;
	margin: 8px 5px;
}

.label-danger {
	background-color: #d9534f;
}
.fleft {
	float:left;
}
.clear {
	clear: both;
}
.item_content{
	width: 500px;
	height: 300px;
}
.rank_content {
	height: 300px;
}
</style>
</head>
<body>

<header>
		<jsp:include page="../include/Navbar2.jsp" />
</header>
	
	<div class="container main_block">
	<c:set var="rank" value="1" />
	<c:forEach var="rankFood" items="${rankFoods }">
	<div class="clear rank_content">
		        <div class="col p-4 d-flex flex-column position-static item_content fleft">
		          <c:url value="/static/img/rank${rank }.png" var="rankimg"></c:url>
		          <c:set var="rank" value="${rank + 1}"/>
		          <img width="50" height="80" src="${rankimg }">
		        <!--   <strong class="d-inline-block mb-2 text-primary">World</strong>
		         -->  <h3 class="mb-0">${rankFood.name }</h3>
		             <p class="card-text mb-auto">${rankFood.content }</p>
		        <div class="col p-6 fleft" style="margin-left: 300px">
		       <c:url value="/addEat?code=${rankFood.getCode() }" var="addEat"></c:url>
									<button type="button" id="addButton"
										class="btn btn_d btn-outline-info"
										onclick="location.href='${addEat}'">추가</button>
				
									<c:url value="/addLike?code=${rankFood.getCode() }" var="addLike"></c:url>
									<button type="button" onclick="location.href='${addLike}'" class="btn btn_d btn-outline-info">찜</button>
		        </div>
		        </div>
		        <div class="col-auto d-none d-lg-block fleft">
		        <c:url value="/static/${rankFood.img }" var="rankFoodimg"></c:url>
		        <img class="bd-placeholder-img"  width="200" height="250" src="${rankFoodimg }">
		         <!--  <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> 
		  -->     </div>
	</div>
	<hr/>
	</c:forEach>
	</div>
</body>
</html>