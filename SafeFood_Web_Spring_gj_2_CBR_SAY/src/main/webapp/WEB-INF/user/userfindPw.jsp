<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>비밀번호 찾기</title>

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
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/heroic-features.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/signUp.css" rel="stylesheet">
<link href="css/modal.css" rel="stylesheet">
<script src="http://www.w3schools.com/lib/w3data.js"></script> 
</head>
<body>
	<!-- Navigation -->
	<header>
		<div w3-include-html="Navbar.jsp"></div>
	</header>
	<h2>비밀번호 찾기</h2>
	<form method="post" action="user.do" id="findPwForm">
		<input type="hidden" name="action" value="findPw">
		<% if(request.getAttribute("msg")!=null){ %>
			<span><%="-"+request.getAttribute("msg")%></span>
		<%} %>	
		
		<% if(request.getAttribute("id")!=null){ %>
		<div class = "input_info">
			<span>아이디</span>
			<input type="text" name="id" style="width:300px; height:30px;font-size:15px;" placeholder="아이디를 입력해주세요." value="<%=request.getAttribute("id")%>">
		</div>
	
		<div class = "input_info">
			<span>전화번호</span>
			<input type="tel" name="tel" style="width:300px; height:30px;font-size:15px;" placeholder="010-xxxx-xxxx" value="<%=request.getAttribute("tel")%>">
		</div>
		<%} else { %>
		<div class = "input_info">
			<span>아이디</span>
			<input type="text" name="id" style="width:300px; height:30px;font-size:15px;" placeholder="아이디를 입력해주세요.">
		</div>
		<div class = "input_info">
			<span>전화번호</span>
			<input type="tel" name="tel" style="width:300px; height:30px;font-size:15px;" placeholder="010-xxxx-xxxx">
		</div>
		<% } %>
		<input type="submit" value="비밀번호 찾기" style="width:150px; height:30px;font-size:15px; background:#343a40; color:white; border-radius: 5px;">
	</form>
	
	<form method="post" action="user.do" id="RePwForm">
		<input type="hidden" name="id" value="<%=request.getAttribute("id")%>">
		<% if(request.getAttribute("msgRePw")!=null){ %>
			<span><%="-"+request.getAttribute("msgRePw")%></span>
		<%} %>	
		<input type="hidden" name="action" value="rePw">
		<% if(request.getAttribute("findChk")!=null){ %>
			<div class = "input_info">
			<span>비밀번호</span>
			<input type="password" name="pw" style="width:300px; height:30px;font-size:15px;" placeholder="비밀번호를 입력해주세요.">
		</div>
	
		<div class = "input_info">
			<span>비밀번호 확인</span>
			<input type="password" name="pwCf" style="width:300px; height:30px;font-size:15px;" placeholder="비밀번호를  다시 입력해주세요.">
		</div>
			<input type="submit" value="비밀번호 바꾸기" style="width:150px; height:30px;font-size:15px; background:#343a40; color:white; border-radius: 5px;">
		<%} %>	
	</form>
	<!-- /.container -->

	<!-- Footer -->
	<!--   <footer class="py-5 bg-dark"> -->
	<footer>
		<div w3-include-html="Footer.html"></div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
<script>
	w3IncludeHTML();
</script>
</html>