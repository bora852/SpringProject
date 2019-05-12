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
</style>
</head>
<body>
	<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar.jsp" />
	</header>
	
	<!-- Page Content -->
	<div class="container main_block">
		<c:choose>
			<c:when test="${list ne null }">
				<c:forEach var="food" items="${list }">
					<div class="jumbotron my-4 row">
						<div class="col-lg-3 main_img_box">
							<c:url value="/static/${food.img }" var="foodimg"></c:url>
							<img class="main_img" src="${foodimg }">
							<div class="for_hover">
								<h2 style="color: white; margin-top: 14px;">${food.maker }</h2>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="main_name border_line row">
								<h2 class="p_name" id="detail_name" >${food.name }</h2>
								<c:if test="${!empty loginUser }">
									<c:set var="loop_flag" value="false" />
									<c:forEach var="allergyitem" items="${allergy }" >
										<c:if test="${not loop_flag }">
											<c:if test="${fn:contains(food.material,allergyitem)}">
												<span class="label label-danger">알레르기주의</span>
												<c:set var="loop_flag" value="true" />
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>

							</div>
							<div class="main_mat row">
								<a>${food.material }</a>
							</div>
							<div class="main_bt">
								<div class="info_bt row">
									<c:if test="${not empty loginUser }">
									<c:url value="/addEat?code=${food.getCode() }" var="addEat"></c:url>
									<button type="button" id="addButton"
										class="btn btn_d btn-outline-info"
										onclick="location.href='${addEat}'">추가</button>
									<c:url value="/addLike?code=${food.getCode() }" var="addLike"></c:url>
									<button type="button" onclick="location.href='${addLike}'" class="btn btn_d btn-outline-info">찜</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>

</body>
<script>
	$(document).ready(function() {
		$(document).on('click', '#detail_name', function() {
			console.log("AAA");
			let url = "detail?name="+$(this).text();
			location.href = encodeURI(url);
		});
	}) 
</script>
</html>