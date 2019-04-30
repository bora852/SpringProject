<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>회원가입</title>

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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
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
	<!-- 회원가입 폼 -->
	<%-- <form method="post" action="user.do" id="signUpForm">	
		<input type="hidden" name="action" value="signUp"> 
		<div id ="signUp_place">
			<div class="container">
				<div id ="signUp_box">
				<% if(request.getAttribute("msg")!=null){ %>
					<span><%="-"+request.getAttribute("msg")%></span>
				<%} %>
					<h2>회원가입</h2>
					<div class = "input_info">
						<span>아이디</span>
						<input type="text" name="id" style="width:300px; height:30px;font-size:15px;" placeholder="아이디를 입력해주세요.">
					</div>
					<div class = "input_info">
						<span>비밀번호</span>
						<input type="password" name="pw" style="width:300px; height:30px;font-size:15px;" placeholder="영문 숫자 포함 6자리 이상">
					</div>
					<div class = "input_info">
						<span>이름</span>
						<input type="text" name="name" style="width:300px; height:30px;font-size:15px;" placeholder="User Name">
					</div>
					<div class = "input_info">
						<span>주소</span>
						<input type="text" name="addr" style="width:300px; height:30px;font-size:15px;" placeholder="address">
					</div>
					<div class = "input_info">
						<span>전화번호</span>
						<input type="tel" name="tel" style="width:300px; height:30px;font-size:15px;" placeholder="010-xxxx-xxxx">
					</div>
					<div class = "input_info">
						<span>알레르기</span>
						<div id="input_allergy">
							<div class = "allergy">
							<input type="checkbox" name="allergy" value="대두"><span>대두</span>
							<input type="checkbox" name="allergy" value="땅콩"><span>땅콩</span>
							<input type="checkbox" name="allergy" value="우유"><span>우유</span>
							<input type="checkbox" name="allergy" value="게"><span>게</span>
							</div>
							<div class = "allergy">
							<input type="checkbox" name="allergy" value="새우"><span>새우</span>
							<input type="checkbox" name="allergy" value="참치"><span>참치</span>
							<input type="checkbox" name="allergy" value="연어"><span>연어</span>
							<input type="checkbox" name="allergy" value="쑥"><span>쑥</span>
							</div>
							<div class = "allergy">
							<input type="checkbox" name="allergy" value="소고기"><span>소고기</span>
							<input type="checkbox" name="allergy" value="닭고기"><span>닭고기</span>
							<input type="checkbox" name="allergy" value="돼지고기"><span>돼지고기</span>
							</div>
							<div class = "allergy">
							<input type="checkbox" name="allergy" value="복숭아"><span>복숭아</span>
							<input type="checkbox" name="allergy" value="민들레"><span>민들레</span>
							<input type="checkbox" name="allergy" value="계란흰자"><span>계란흰자</span>
							</div>
						</div>
					</div>
					<div class = "input_info signUp_submit">
						<input type="submit" value="등록" style="width:50px; height:30px;font-size:15px; background:#343a40; color:white; border-radius: 5px;">
					</div>
				</div>
			</div>
		</div>
	</form> --%>
	<!-- /.container -->

	<!-- Footer -->
	<!--   <footer class="py-5 bg-dark"> -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>

</body>
</html>