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
		<jsp:include page="../include/Navbar2.jsp" />
	</header>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<c:url value="/static/img/rice.png" var="rice"></c:url>
		<div style="padding:10px">
			<img src=${rice } style="width:100px; height:100px;">
			<span style="font-size:40px; vertical-align: bottom;">내 섭취 정보</span>
		</div>
		<hr>
		<div class="mb-4" id="accordion" role="tablist"
			aria-multiselectable="true">

			<div class="card" >
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
								<option value="일별">일별</option>
								<option value="주별">주별</option>
								<option value="월별">월별</option>
							</select>
							<input id="fromDate" type="date" v-model="strDate"> ~ 
							<input id="toDate" type="date" v-model="endDate">
							<input type="button" class="btn btn-info btn-sm" value="차트검색" @click="search">
						</div>
						<!-- 차트 -->
						<canvas id="myChart" width="300" height="300"></canvas>
					</div>
				</div>
			</div>
		</div>

		<c:url value="/deleteMyFood" var="deleteMyFood"></c:url>
		<form method="post" action="${deleteMyFood }">
			<table class="table table-hover">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: 25%;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: 10%;" />
				</colgroup>
	
				<thead>
					<tr>
						<th></th>
						<th scope="col">날짜</th>
						<th scope="col">먹은 음식</th>
						<th scope="col">알러지 유발</th>
						<th scope="col"><input type="checkbox" name="all"
							class="check-all"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${eatList ne null }">
						 <c:set var="endNum" value="${eatList.size()-1 }"/>
							<c:if test="${endNum  ne -1 }">
								<c:forEach var="eat" begin="0" end="${eatList.size()-1 }">
									<tr>
										<td></td>
										<td scope="row">${eatList[eat].getEatDate()}</td>
										<td>${foodList[eat].getName()}</td>
										<td>
											<c:forEach var="allergyitem" items="${loginUser.allergy_arr }" >
												<c:if test="${fn:contains(foodList[eat].material,allergyitem)}">
													<span>${allergyitem } </span>
												</c:if>
											</c:forEach>
										</td>
										<%-- <td><input type="checkbox" name="${eat }" class="allSel"></td> --%>
										<td><input type="checkbox" name="check" class="allSel" value="${eatList[eat].getUserEatIdx()}"></td>
									</tr>
									
								</c:forEach>
							</c:if>
						</c:when>
					</c:choose>
	
				</tbody>
			</table>
			<div style="text-align: right;">
				<input type="submit" class="btn btn-sm btn-primary" id="btnWriteForm" value="삭제"/>
			</div>
		</form>
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
	
	
	
	
	
	
	let vi = new Vue({
		el:"#app",
		data : {
			chartMode : "일별",
			strDate : "",
			endDate : ""
		},
		methods:{
			search(){
				let type = "";
				if(this.strDate==''){alert('시작 날짜를 선택하세요.');return;}
				if(this.endDate==''){alert('종료 날짜를 선택하세요.');return;}
				
				if(this.chartMode === "일별"){
					type = "day";
				}else if(this.chartMode === "월별"){
					type = "month";
				}else{
					type = "week";
				}
				
				axios.get("/SF_WS_03/chartSearch/"+type+"/"+this.strDate+"/"+this.endDate)
				.then(res => {
					
					//charts.js
					let ctx = document.getElementById('myChart').getContext('2d');
					let myChart = new Chart(ctx, {
						type : 'line',
						data : {
							 labels : [],
							datasets : [] 
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
					
				   //labels - x축 값 설정
					for(let j = 0; j < res.data.length; j++){
						myChart.data.labels.push(res.data[j].dates); 
					}
					
				 	for(let i = 0; i < 8; i++){
						
						let chartvalue = new Array();
						for(let j = 0; j < res.data.length; j++){
							chartvalue[j] = res.data[j][nutri_order[i]];
						}
						
						myChart.data.datasets.push(new FoodInfo(nutri[i], chartvalue, backg[i], borderC[i]));
													//new FoodInfo( nutri[0],  [10, 20], backg[0], borderC[0]) 
					}
				 	
					myChart.update();
					console.log("chart data ",myChart.data.datasets);
					
				}).catch(error => {
					console.log(error);
				});
			}
		}
	});
</script>

</html>