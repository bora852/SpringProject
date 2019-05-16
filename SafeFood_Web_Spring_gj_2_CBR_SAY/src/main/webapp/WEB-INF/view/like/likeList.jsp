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

.liek_img {
	height: 150px;
	width: 150px;
}

.fleft {
	float:left;
}
.clear {
	clear: both;
}
</style>
</head>
<body>
<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar2.jsp" />
	</header>
	
	<div class="container main_block">
		<h2 style="padding : 20px">상품 목록</h2>
		<div id = "likelist">
		<c:url value="/daySum" var="daySum"></c:url>
		<form id="target" action="daySum" method="get">
		<c:forEach var="food" items="${likefoodlist }">
		 	<c:url value="/static/${food.img }" var="foodimg"></c:url>
		 	<div class="fleft">
				<img class="liek_img" src="${foodimg }"> 
				<input type="checkbox" name="likeCheck" value="${food.code }"> 
			</div>
		</c:forEach>
		<button class="btn btn-sm btn-primary" type="input" >예상 그래프 보기</button>
		</form>
		</div>
		<div class = "clear">
		<c:if test="${!empty foodSum}">
			<h2>예상 섭취 그래프</h2>
			<div id="chart_div" style="width:900px; height: 500px;"></div>
			</div>
		</c:if>
	</div>
</body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
	
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
					['nutrient', '현재', '섭취 후'],
					//['supportpereat',  ${foodSum.supportpereat},      938],
					['calory',  ${foodSum.calory}, ${afterSum.calory}],
					['carbo',  ${foodSum.carbo},  ${afterSum.carbo}],
					['protein',  ${foodSum.protein}, ${afterSum.protein}],
					['fat',  ${foodSum.fat}, ${afterSum.fat}],
					['sugar',  ${foodSum.sugar}, ${afterSum.sugar}],
					['natrium',  ${foodSum.natrium}, ${afterSum.natrium}],
					['chole',  ${foodSum.chole},  ${afterSum.chole}],
					['fattyacid',  ${foodSum.fattyacid}, ${afterSum.fattyacid}],
					['transfat',  ${foodSum.transfat},  ${afterSum.transfat}]
				]);
			var options = {
					title : '예상 섭취 그래프',
					vAxis: {title: '섭취량'},
					hAxis: {title: '영양소'}, 
					seriesType: 'bars',
					series: {300: {type: 'line'}}
				};
			
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
		
		let t = document.getElementById('target'); 
		t.addEventListener('change', function(event){ 
			console.log("aa");
		});

</script>

</html>