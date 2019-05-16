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
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/paper/bootstrap.min.css" rel="stylesheet"/>
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

.fright {
	float:right;
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
		<form id="target" action="daySum" method="get" style="padding: 30px">
		<c:forEach var="food" items="${likefoodlist }">
		 	<c:url value="/static/${food.img }" var="foodimg"></c:url>
		 	<div class="fleft" style="margin: 15px;">
				<img class="liek_img" src="${foodimg }"> 
					<div class="checkbox">
						<input type="checkbox" class=" class="custom-control-input" name="likeCheck" value="${food.code }">
					</div>
			</div>
		</c:forEach>
<<<<<<< HEAD
		<button class="btn btn-sm btn-primary" type="input" >예상 그래프 보기</button>
=======
		<button type="input" class="btn btn-primary fright" style="margin-top: 50px%; margin-right: 30px;">예상 그래프 보기</button>
>>>>>>> branch 'master' of https://lab.ssafy.com/ayoung/safefood_web_spring_gj_2_cbr_say.git
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
					['nutrient', '현재', '섭취 후', "하루 권장량"],
					//['supportpereat',  ${foodSum.supportpereat},      938],
					['calory',  ${foodSum.calory}, ${afterSum.calory}, 2600],
					['carbo',  ${foodSum.carbo},  ${afterSum.carbo}, 460],
					['protein',  ${foodSum.protein}, ${afterSum.protein}, 55],
					['fat',  ${foodSum.fat}, ${afterSum.fat}, 1600],
					['sugar',  ${foodSum.sugar}, ${afterSum.sugar}, 25],
					['natrium',  ${foodSum.natrium}, ${afterSum.natrium}, 1500],
					['chole',  ${foodSum.chole},  ${afterSum.chole}, 300],
					['fattyacid',  ${foodSum.fattyacid}, ${afterSum.fattyacid}, 15],
					['transfat',  ${foodSum.transfat},  ${afterSum.transfat}, 2.2]
				]);
			var options = {
					title : '예상 섭취 그래프',
					vAxis: {title: '섭취량'},
					hAxis: {title: '영양소'}, 
					seriesType: 'bars',
					series: {
						0: { color: '#a561bd' },
			            1: { color: '#c784de' },
			            2: { color: '#f1ca3a' }
					}
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