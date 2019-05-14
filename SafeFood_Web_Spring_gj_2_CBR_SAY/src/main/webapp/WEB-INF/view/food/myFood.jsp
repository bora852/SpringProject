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
<title>Insert title here</title>

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
	  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">내 섭취 정보
    </h1>

    <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
      
      <div class="card">
        <div class="card-header" role="tab" id="headingThree">
          <h5 class="mb-0">
            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">통계보기</a>
          </h5>
        </div>
        <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
          <div class="card-body">
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
				<th scope="col"><input type="checkbox" name="all" class="check-all"></th>
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
	
	<div style="text-align:right;">
		<c:url value="/writeNotice" var="writeNotice"></c:url>
		<button type="button" class="btn btn-sm btn-primary" id="btnWriteForm" onclick="location.href='${writeNotice}'">삭제</button>
	</div>
  </div>
  
<%-- 	<div class="container main_block">
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
								<h2 class="p_name">${food.name }</h2>
								<c:if test="${!empty loginUser }">
									<c:set var="loop_flag" value="false" />
									<c:forEach var="allergyitem" items="${allergy }">
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
									<c:if test="${not empty loginId }">
										<button type="button" id="addButton"
											class="btn btn_d btn-outline-info"
											onclick="location.href='main.eat?action=add&code=${food.code }'">추가</button>
										<button type="button" class="btn btn_d btn-outline-info">찜</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div> --%>
 
<!--    <!-- Navigation -->
  <!-- <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">Start Bootstrap</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="services.html">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Portfolio
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Blog
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
              <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
              <a class="dropdown-item" href="blog-post.html">Blog Post</a>
            </div>
          </li>
          <li class="nav-item active dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Other Pages
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="full-width.html">Full Width Page</a>
              <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
              <a class="dropdown-item active" href="faq.html">FAQ</a>
              <a class="dropdown-item" href="404.html">404</a>
              <a class="dropdown-item" href="pricing.html">Pricing Table</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
 -->

 <!-- /.container -->
 

	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>

</body>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
<script>
    //체크박스 전체선택
	$( document ).ready( function() {
	    $( '.check-all' ).click( function() {
	      $( '.allSel' ).prop( 'checked', this.checked );
	    } );
	  } );	
	
    //charts.js
	let ctx = document.getElementById('myChart').getContext('2d');
	let myChart = new Chart(ctx, {
	    type : 'bar',
	    data: {
	        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	        	/*  xAxes: [{
	                 stacked: true
	             }],
	             yAxes: [{
	                 stacked: true
	             }] */
	             yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }] 
	        }
	    }
	});
</script>

</html>