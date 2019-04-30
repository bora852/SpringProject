<%@page import="com.ssafy.model.dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*,java.net.*,javax.xml.parsers.*,org.w3c.dom.*,javax.xml.xpath.*,org.xml.sax.InputSource"%>
<%@ page import="com.ssafy.model.service.*"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>안전먹거리 프로젝트</title>

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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
		<jsp:include page="../include/Navbar.jsp"/>
	</header>
 
	<!-- Page Content -->
	<%--<div class="container main_block">
	<%-- <c:choose>
			<c:when test="${list == null }">
				<div style="text-align:center;">
					<br>
					<h1>조회 결과가 없습니다.</h1>
				</div>
			</c:when>
			<c:when test="${list ne null }">
			<c:forEach var="food" items="${list }">
				 <div id="container" style='width: 960px; margin:0 auto;'>
				    <div id="content" >
				
				    <br>
				    <c:url value="/detail/${food.code }" var="detail"></c:url>
				    <div class="card mb-3" id="${food.code }"  onclick="location.href='${detail }';">
				    <div class="row">
				    <div class="col-6 col-md-4">
				    <c:url value="/static/${food.img }" var="foodimg"></c:url>
				    <img class="card-img-top" src="${foodimg }" alt="Card image cap"></div>
				    <div class="col-12 col-md-8">
				    <div class="card-body">
				   	<h5 class="card-title">${food.name }</h5>
				   	<h6 class="card-subtitle" style="color:red;">
				   		<c:if test="${food.check!=null }">${food.check }</c:if>
				   	</h6>
				   	<p class="card-text">${food.material }</p>
				   	<c:if test="${user != null }">
				   		<div id="${food.code }" class="btn btn-primary add">추가하기</div>
				   	</c:if>
				    </div></div></div></div> 
				    
				    </div>
				  </div>
			</c:forEach>
		  </c:when>
 	 </c:choose> --%>
 	 <c:choose>
 	 <c:when test="${list ne null }">
			<c:forEach var="food" items="${list }">
				<div class="jumbotron my-4 row">
					<div class="col-lg-3 main_img_box">
					<c:url value="/static/${food.img }" var="foodimg"></c:url>
						<img class="main_img"  src="${foodimg }">
						<div class="for_hover">
							<h2 style="color: white; margin-top: 14px;">${food.maker }
							</h2>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="main_name border_line row">
							<h2 class="p_name">${food.name }</h2>
							<%-- <%
								if (alg != null) {
										String s = foods.get(i).getMaterial();
										for (int j = 0; j < alg.size(); j++) {
											if (!"".contains(alg.get(j)) && s.contains(alg.get(j))) {
							%> --%>
							<span class="label label-danger">알레르기주의</span>
						</div>
						<div class="main_mat row">
							<a>${food.material }</a>
						</div>
						<div class="main_bt">
							<div class="info_bt row">
							<c:if test="${not empty loginId }">
								<button type="button" id = "addButton" class="btn btn_d btn-outline-info" onclick="location.href='main.eat?action=add&code=${food.code }'">추가</button>
								<button type="button" class="btn btn_d btn-outline-info">찜</button>
							</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		  </c:when>
		  </c:choose>
		<%-- <%
			ArrayList<String> alg = new ArrayList<>();
			if (session.getAttribute("allergy") != null) {
				alg = (ArrayList) session.getAttribute("allergy");
			}
			FoodService fs = FoodService.getFs();
			List<Food> foods = fs.getList();
			for (int i = 0; i < foods.size(); i++) {
		%>
				<%
					String msg = (String) request.getAttribute("msg");
						if (msg != null && msg.equals("loginFail")) {
							out.println("<script>alert('로그인에 실패하였습니다.');</script>");
							request.setAttribute("msg","true");
						}
				%>
				<div class="jumbotron my-4 row">
					<div class="col-lg-3 main_img_box">
						<img class="main_img" src="<%=foods.get(i).getImg()%>">
						<div class="for_hover">
							<h2 style="color: white; margin-top: 14px;"><%=foods.get(i).getMaker()%>
							</h2>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="main_name border_line row">
							<h2 class="p_name"><%=foods.get(i).getName()%></h2>
							<%
								if (alg != null) {
										String s = foods.get(i).getMaterial();
										for (int j = 0; j < alg.size(); j++) {
											if (!"".contains(alg.get(j)) && s.contains(alg.get(j))) {
							%>
							<span class="label label-danger">알레르기주의</span>
							<%
												break;
											}
										}
									}
							%>
						</div>
						<div class="main_mat row">
							<a><%=foods.get(i).getMaterial()%></a>
						</div>
						<div class="main_bt">
							<div class="info_bt row">
							<c:if test="${not empty loginId }">
								<button type="button" id = "addButton" class="btn btn_d btn-outline-info" onclick="location.href='main.eat?action=add&code=<%=foods.get(i).getCode() %>'">추가</button>
								<button type="button" class="btn btn_d btn-outline-info">찜</button>
							</c:if>
							</div>
						</div>
					</div>
				</div>
		<%
			}
		%>  --%>
	</div>
	<!-- /.container -->
	<!-- Footer -->
	<!--   <footer class="py-5 bg-dark"> -->
	<footer>
		<jsp:include page="../include/footer.jsp"/>
	</footer> 

</body>
<script>
	/* w3IncludeHTML();

	$(document).ready(function() {
		$(document).on('click', 'h2.p_name', function() {
			var url = 'detailinfo.food?action=detail&name=' + $(this).text();
			location.href = encodeURI(url);
		});
	});
	$(document).on('click','#search_bt',function() {
				var name = $("#search_input").val();
				var option = $("#selected option:selected").val();
				if (name) {
					$.ajax({
						url : 'search.food?action=search&by='
								+ option + '&name=' + name,
						type : "POST",
						dataType : "json",
						data : $("#search_bt").serialize(),
						success : function(res) {
							$(".main_block").empty();
							$.each(res,function(idx, data) {
								var str2 = '<div class="jumbotron my-4 row">'
								+ '<div class="col-lg-3 main_img_box">'
								+ '<img class="main_img" src="' + data.img + '">'
								+ '<div class="for_hover"><h2 style="color:white; margin-top:14px;">'
								+ data.maker
								+ '</h2></div></div>'
								+ '<div class="col-lg-9"><div class="main_name border_line row">'
								+ '<h2 class="p_name">'
								+ data.name
								+ '</h2></div><div class="main_mat row">'
								+ '<a>'+ data.material+ '</a></div><div class="main_bt">'
								+ '<div class="info_bt row">'
								+'<c:if test="${not empty loginId }">'
								+ '<div class="info_bt"><button type="button" class="btn btn-outline-info" style="margin-left:5px;" >추가</button><button type="button" class="btn btn-outline-info" style="margin-left:5px;">찜</button>'
								+'</c:if>'
								+'</div></div></div></div>';
								
								$(".main_block").append(str2);
								});
							},
							error : function(e) {
								alert("ajax error");
								}
							});
					}
	});
	
 */
</script>
</html>