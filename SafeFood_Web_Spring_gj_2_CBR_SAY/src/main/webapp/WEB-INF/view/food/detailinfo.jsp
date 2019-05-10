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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js">
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

<!-- Pie Chart Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/frozen.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
</head>

<body>
	<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar.jsp" />
	</header>
	

	<!-- Page Content -->
	<div class="container">

		<!-- Jumbotron Header -->
		<header class="detail_header">
			<h1>제품 정보</h1>
			<c:url value="/static/img/shopping-bag.png" var="shopping"></c:url>
			<img class="detail_logo_img" src="${shopping }">
		</header>

		<!-- Page Features -->
		<div class="detail_block row">
			<div class="col-lg-3 detail_img_box">
				<c:url value="/static/${food.img }" var="foodimg"></c:url>
				<img class="detail_img" style="margin: auto;" src="${foodimg }">
			</div>
			<div class="col-lg-9">
				<div class="border_line row">
					<div class="detail_f col-lg-2">
						<h3>제품명</h3>
					</div>
					<div class="detail_b col-lg-10 detail_name">
						<h3>${food.getName()}</h3>
					</div>
				</div>
				<div class="border_line row">
					<div class="detail_f col-lg-2">
						<h3>제조사</h3>
					</div>
					<div class="detail_b col-lg-10 detail_com">
						<h3>${food.getMaker()}</h3>
					</div>
				</div>
				<div class="border_line row">
					<div class="detail_f col-lg-2">
						<h3>원재료</h3>
					</div>
					<div class="detail_b col-lg-10 detail_mat">
						<a>${food.getMaterial()}</a>
					</div>
				</div>
				<div class="border_line row">
					<div class="detail_f col-lg-2 detail_allergy">
						<h3>알레르기성분</h3>
					</div>
					<div class="detail_b col-lg-10">
						<%-- <%
							if (alg != null) {
								for (int i = 0; i < alg.size(); i++) {
									if(f.getMaterial().contains(alg.get(i))){
									%>
									<a><%=alg.get(i) %> ,</a>
									<%
									}
								}
							}
						%> --%>
					</div>
				</div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-lg-4">
						<h2>Quantity</h2>
					</div>
				</div>
				<div class="row" style="height: 40px;">
					<div class="col-lg-4">
						<input type="number" class="form-control" aria-label="Large"
							aria-describedby="inputGroup-sizing-sm" placeholder="1">
					</div>
				</div>
				<div class="row" style="margin: 10px">
					<div class="info_bt col-lg-4">
						<button type="button" class="btn btn_d btn-outline-info">추가</button>
						<button type="button" class="btn btn_d btn-outline-info">찜</button>
					</div>
				</div>

			</div>

		</div>
		<div>
			<h2>영양 정보</h2>
		</div>
		<div class="row chart_block">
			<div id="chartdiv" class="col-lg-8"></div>
			<div id="nut_info" class="col-lg-4">
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">Serving Size</div>
					<div class="col-lg-6 ss_info">${food.getSupportpereat()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">Kcal</div>
					<div class="col-lg-6 k_info">${food.getCalory()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">carbohydrate</div>
					<div class="col-lg-6 c_info">${food.getCarbo()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">protein</div>
					<div class="col-lg-6 p_info">${food.getProtein()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">fat</div>
					<div class="col-lg-6 f_info">${food.getFat()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6">sugars</div>
					<div class="col-lg-6 s_info">${food.getSugar()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">natrium</div>
					<div class="col-lg-6 n_info">${food.getNatrium()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">cholesterol</div>
					<div class="col-lg-6 chole_info">${food.getChole()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">saturated fat</div>
					<div class="col-lg-6 satu_info">${food.getFattyacid()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">trans fat</div>
					<div class="col-lg-6 tran_info">${food.getTransfat()}</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>


</body>
<script>

	// <!-- Chart code -->
	// Themes begin
	am4core.useTheme(am4themes_frozen);
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create("chartdiv", am4charts.PieChart);
	$.ajax({
		<c:url value="/chart" var="chart"/>
		url : "${chart}",
		type : "POST",
		dataType : "json",
		data : "code=${food.getCode()}",
		success : function(res) {
			console.log(res);
			chart.data = [ {
				"nutrition" : "Kcal",
				"kcal" : res.calory
			}, {
				"nutrition" : "carbo",
				"kcal" : res.carbo
			}, {
				"nutrition" : "protein",
				"kcal" : res.protein
			}, {
				"nutrition" : "fat",
				"kcal" : res.fat
			}, {
				"nutrition" : "sugars",
				"kcal" : res.sugar
			}, {
				"nutrition" : "natrium",
				"kcal" : res.natrium
			}, {
				"nutrition" : "chole",
				"kcal" : res.chole
			}, {
				"nutrition" : "supportpereat",
				"kcal" : res.supportpereat
			}, {
				"nutrition" : "transfat",
				"kcal" : res.transfat
			} ];
		}
	});

	console.log(chart.data);
	
	var pieSeries = chart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.value = "kcal";
	pieSeries.dataFields.category = "nutrition";
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeWidth = 2;
	pieSeries.slices.template.strokeOpacity = 1;

	// This creates initial animation
	pieSeries.hiddenState.properties.opacity = 1;
	pieSeries.hiddenState.properties.endAngle = -90;
	pieSeries.hiddenState.properties.startAngle = -90;
</script>

</html>