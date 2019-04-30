<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>탈퇴 성공</title>

	<!-- js, jquery -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="css/heroic-features.css" rel="stylesheet" type="text/css">
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<link href="css/modal.css" rel="stylesheet" type="text/css">
	<script src="http://www.w3schools.com/lib/w3data.js"></script>

	<style>
		div.jumbotron:hover div.for_hover {
			display: block;
		}
		button {
			text-align:center;
		}
		
	</style>
</head>
<body>
	<!-- Navigation -->
	<header>
		<div id="header_place" w3-include-html="Navbar.jsp"></div>
	</header>
	
	<!-- Page Content -->
	<div class="container main_block">
		<h1>회원 탈퇴되었습니다.</h1>
		<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal">Login</button>
	</div>
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