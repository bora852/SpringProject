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
	
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

합쳐지고 최소화된 최신 자바스크립트
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	 -->
	
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

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
								<option>주별</option>
								<option>월별</option>
							</select>
							<input id="fromDate" type="date" v-model="strDate"> ~ 
							<input id="toDate" type="date" v-model="endDate">
							<input type="button" class="btn btn-info btn-sm" value="차트검색" @click="search">
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
	let nutri_order = new Array("carbo", "protein", "fat", "sugar", "natrium", "chole", "fattyacid", "transfat");
	let backg = new Array('rgba(255, 99, 132, 0.2)',
				            'rgba(54, 162, 235, 0.2)',
				            'rgba(255, 206, 86, 0.2)',
				            'rgba(75, 192, 192, 0.2)',
				            'rgba(153, 102, 255, 0.2)',
				            'rgba(255, 159, 64, 0.2)',
				            'rgba(153, 051, 204, 0.2)',
			                'rgba(255, 000, 000, 0.2)');
	
	let borderC = new Array( 'rgba(255, 99, 132, 1)',
				            'rgba(54, 162, 235, 1)',
				            'rgba(255, 206, 86, 1)',
				            'rgba(75, 192, 192, 1)',
				            'rgba(153, 102, 255, 1)',
				            'rgba(255, 159, 64, 1)',
				            'rgba(102, 000, 153, 1)',
			                'rgba(255, 000, 000, 1)');
						
	
	function FoodInfo(label, data, bg, border){
		this.label = label;
		this.data = data;
		this.backgroundColor = bg;
		this.borderColor = border;
		this.borderWidth= 1;
	}
	
	
	
	//charts.js
	let ctx = document.getElementById('myChart').getContext('2d');
	let myChart = new Chart(ctx, {
		type : 'line',
		data : {
			 labels : [ /* '1월', '2월', 'Yellow', 'Green', 'Purple', 'Orange'  */],
			datasets : [ 
				/* new FoodInfo( nutri[0],  [10, 20, 30, 40, 50, 10], backg[0], backg[0]) */
				/*  ,	{
				label : nutri[0],
				data : [10, 20, 30, 40, 50, 60],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)'],
				borderColor : [ 'rgba(255, 99, 132, 1)'],
				borderWidth : 1
			}   */
			
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
			chartMode : "일별",
			strDate : "",
			endDate : ""
		},
		mounted(){
			// axios를 통해서 데이터 조회 후 사용
			 /* console.log("chart data ",myChart.data.datasets)
			myChart.data.datasets.push(new FoodInfo("test",  [10, 20, 30, 40, 50, 60], [ 'rgba(255, 99, 132, 0.2)']));
			
			console.log("chart data ",myChart.data.datasets);  */
		},
		methods:{
			search(){
				myChart.data.datasets.push(new FoodInfo("test",  [10, 20, 30, 40, 50, 60], [ 'rgba(255, 99, 132, 0.2)']));
				console.log("chart data ",myChart.data.datasets); 
/* 				let type = "";
				console.log(this.strDate);
				if(this.chartMode == "일별"){
					type = "day";
				}else if(this.chartMod == "월별"){
					type = "month";
				}else{
					type = "week";
				}
				
				axios.get("/SF_WS_03/chartSearch/"+type+"/"+this.strDate+"/"+this.endDate)
				.then(res => {
					console.log(res.data);
					console.log(res.data.length);
					
					for(let i = 0; i < res.data.length; i++){
						let chartvalue = new Array();
						
						console.log("i : ",i);
						
						let test =  res.data[i];
						for(let j = 0; j < 8; j++){
							/* console.log("vvvaaalll : ", test[nutri_order[j]]); 
							chartvalue[j] = test[nutri_order[j]];
						}
						
						console.log("제발아아 : ", chartvalue);
						
						
						myChart.data.labels.push(test.dates);		
						console.log("날짜 :: ",test.dates);
						myChart.data.datasets.push(new FoodInfo(nutri[i], chartvalue, backg[i], borderC[i]));
						console.log("chart data ",myChart.data.datasets); 
					}
					
				}).catch(error => {
					console.log(error);
				}); */
			}
		}
	});
</script>

</html>