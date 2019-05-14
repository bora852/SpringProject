<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*,java.net.*,javax.xml.parsers.*,org.w3c.dom.*,javax.xml.xpath.*,org.xml.sax.InputSource"%>
<%@ page import="com.ssafy.model.service.*"%>
<!DOCTYPE html>
<html>
<style>
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
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>내 섭취 정보</title>

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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
</head>

<body>
	<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar.jsp" />
	</header>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">내 섭취 정보</h1>

		<div class="mb-4" id="accordion" role="tablist"
			aria-multiselectable="true">

			<div class="card">
				<div class="card-header" role="tab" id="headingThree">
					<h5 class="mb-0">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">통계보기</a>
					</h5>
				</div>
				<div id="collapseThree" class="collapse" role="tabpanel"
					aria-labelledby="headingThree">
					<div class="card-body">
						<div id="app" style="text-align: center; margin:10px;">
							<select v-model="chartMode">
								<option>일별</option>
								<option>월별</option>
								<option>연별</option>
							</select>
							<input type="button" class="btn btn-info btn-sm" value="차트검색" > <!-- @click="search" -->
						</div>
						<!-- 차트 -->
						<canvas id="myChart" width="400" height="400"></canvas>
					</div>
				</div>
			</div>
		</div>

		<table class="table table-hover">
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: 25%;" />
				<col style="width: auto;" />
				<col style="width: 10%;" />
			</colgroup>

			<thead>
				<tr>
					<th></th>
					<th scope="col">날짜</th>
					<th scope="col">먹은 음식</th>
					<th scope="col"><input type="checkbox" name="all"
						class="check-all"></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${eatList ne null }">
						<c:forEach var="eat" begin="0" end="${eatList.size()-1 }">
							<tr>
								<td></td>
								<td scope="row">${eatList[eat].getEatDate()}</td>
								<td>${foodList[eat].getName()}</td>
								<td><input type="checkbox" name="${eat }" class="allSel"></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>

			</tbody>
		</table>

		<div style="text-align: right;">
			<c:url value="/writeNotice" var="writeNotice"></c:url>
			<button type="button" class="btn btn-sm btn-primary"
				id="btnWriteForm" onclick="location.href='${writeNotice}'">삭제</button>
		</div>
	</div>

	<!-- /.container -->

	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>

</body>
<!-- #일별
select substr(eat_date,1,10), sum(carbo), sum(protein), sum(fat), sum(sugar)
	 , sum(natrium), sum(chole), sum(fattyacid), sum(transfat)
  from food f, usereat e
 where f.code = e.food_code
 group by substr(eat_date,1,10)
 ;
 
 select substr(eat_date,1,10)
   from usereat;
 
 #주간
 SELECT DATE_FORMAT(DATE_SUB(eat_date, INTERVAL (DAYOFWEEK(eat_date)-1) DAY), '%Y/%m/%d') as start,
       DATE_FORMAT(DATE_SUB(eat_date, INTERVAL (DAYOFWEEK(eat_date)-7) DAY), '%Y/%m/%d') as end,
       DATE_FORMAT(eat_date, '%Y%U') AS `aaa`,
       sum(carbo)
  from food f, usereat e
  where f.code = e.food_code
 GROUP BY aaa;

 
 #월별
 select substr(eat_date,1,7), sum(carbo), sum(protein), sum(fat), sum(sugar)
	 , sum(natrium), sum(chole), sum(fattyacid), sum(transfat)
  from food f, usereat e
 where f.code = e.food_code
 group by substr(eat_date,1,7)
 ; -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script>
	//체크박스 전체선택
	$(document).ready(function() {
		$('.check-all').click(function() {
			$('.allSel').prop('checked', this.checked);
		});
	});

	let nutri = new Array("탄수화물", "단백질", "지방", "당류", "나트륨", "콜레스테롤", "포화지방산", "트랜스지방");
	//charts.js
	let ctx = document.getElementById('myChart').getContext('2d');
	let myChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ '1월', '2월', 'Yellow', 'Green', 'Purple', 'Orange' ],
			datasets : [ {
				label : nutri[0],
				data : [10, 20, 30, 40, 50, 60],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)'],
				borderColor : [ 'rgba(255, 99, 132, 1)'],
				borderWidth : 1
			} ,
			{
				label : nutri[1],
				data : [10, 30, 30, 40, 50, 40],
				backgroundColor : [ 'rgba(255, 206, 86, 0.2)'],
				borderColor : [ 'rgba(255, 99, 132, 1)'],
				borderWidth : 1
			} 
			
			
			]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
	
	let vi = new Vue({
		el:"#app",
		data : {
			chartMode : ""
		}
	});
</script>

</html>