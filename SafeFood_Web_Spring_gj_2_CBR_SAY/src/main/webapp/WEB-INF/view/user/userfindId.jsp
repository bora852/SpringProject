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
		<jsp:include page="../include/Navbar2.jsp" />
	</header>
<div class="container">
<div id="app">
	<h2>아이디 찾기</h2>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<c:url value="/userfindId" var="userfindId"></c:url>
			<form action="${userfindId }" method="post" v-on:submit.prevent="findId">
				<div>
					<p>
						<label>Email</label>
						<input class="w3-input" v-model="email" type="text" id="email" name="email" required value="${prev.email }">
					</p>
					
					<p class="w3-center">
						<input type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="아이디찾기">
						<c:url value="/cancel" var="cancel"></c:url>
						<button type="button" onclick="location.href='${cancel}'" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
					</p>
				</div>
			</form>
			<template v-if="isFindId">
				<span>{{id}}</span>
			</template>
		</div>
	</div>
</div>
</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
<script src="https://unpkg.com/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script>
let vi = new Vue({
	el:"#app",
	data:{id:"", email:"", isFindId:false},
	methods:{
		findId(){
			this.isFindId=false;
			 axios.post("/SF_WS_03/userfindId",{email : this.email})
			.then(res => {
				console.log(res);
				this.id = res.data.findId;
				this.isFindId=true;
			}).catch(error => {
				console.log(error)
			}) 
		}
	}	
});
</script>
</body>
</html>