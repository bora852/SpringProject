<%@page import="java.util.List"%>
<%@page import="com.ssafy.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>회원가입</title>

<!-- js, jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
<c:url value="/static/css/heroic-features.css" var="heroiccss"></c:url>
<c:url value="/static/css/main.css" var="maincss"></c:url>
<c:url value="/static/css/modal.css" var="modalcss"></c:url>
<c:url value="/static/css/signUp.css" var="signUpcss"></c:url>
<link href="${heroiccss }" rel="stylesheet">
<link href="${maincss }" rel="stylesheet">
<link href="${modalcss }" rel="stylesheet">
<link href="${signUpcss }" rel="stylesheet">
<script src="http://www.w3schools.com/lib/w3data.js"></script>
</head>

<body>
	<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar.jsp" />
	</header>
	
	<!-- 회원정보 폼 -->
	<c:url value="/modify" var="modify"/>
	<form method="post" action="${modify}" id="updateForm">
		<input type="hidden" name="action" value="update">
		<div id="signUp_place">
			<div class="container">
				<div id="signUp_box">
					<h2>회원정보</h2>
					<div class="input_info">
						<span>아이디</span> 
						<input type="text" style="width: 300px; height: 30px; font-size: 15px;" placeholder="아이디를 입력해주세요." value="${loginUser.getId()}" disabled="disabled"> 
						<input type="hidden" name="id" value="${loginUser.id }">
					</div>
					<div class="input_info">
						<span>비밀번호</span> 
						<input type="password" name="pw" style="width: 300px; height: 30px; font-size: 15px;" placeholder="영문 숫자 포함 6자리 이상" value="${loginUser.pw}">
					</div>
					<div class="input_info">
						<span>이름</span> 
						<input type="text" name="name" style="width: 300px; height: 30px; font-size: 15px;" placeholder="이름을 입력해주세요" value="${loginUser.name}">
					</div>
					<div class = "input_info">
						<span>이메일</span>
						<input type="text" name="email" style="width:300px; height:30px;font-size:15px;" placeholder="이메일을 입력해주세요" value="${loginUser.email }">
					</div>
					<div class="input_info">
						<span>주소</span> 
						<input type="text" name="addr" style="width: 300px; height: 30px; font-size: 15px;" placeholder="주소를 입력해주세요" value="${loginUser.addr}">
					</div>
					<div class="input_info">
						<span>전화번호</span> 
						<input type="tel" name="tel" style="width: 300px; height: 30px; font-size: 15px;" placeholder="010-xxxx-xxxx" value="${loginUser.tel}">
					</div>
					<div class="input_info">
						<span>알레르기</span>
						<div id="input_allergy">
							<div class = "allergy">
								<input type="checkbox" name="allergy" value="대두" v-model="allergy"><span>대두</span>
								<input type="checkbox" name="allergy" value="땅콩" v-model="allergy"><span>땅콩</span>
								<input type="checkbox" name="allergy" value="우유" v-model="allergy"><span>우유</span>
								<input type="checkbox" name="allergy" value="게" v-model="allergy"><span>게</span>
								</div>
								<div class = "allergy">
								<input type="checkbox" name="allergy" value="새우" v-model="allergy"><span>새우</span>
								<input type="checkbox" name="allergy" value="참치" v-model="allergy"><span>참치</span>
								<input type="checkbox" name="allergy" value="연어" v-model="allergy"><span>연어</span>
								<input type="checkbox" name="allergy" value="쑥" v-model="allergy"><span>쑥</span>
								</div>
								<div class = "allergy">
								<input type="checkbox" name="allergy" value="소고기" v-model="allergy"><span>소고기</span>
								<input type="checkbox" name="allergy" value="닭고기" v-model="allergy"><span>닭고기</span>
								<input type="checkbox" name="allergy" value="돼지고기" v-model="allergy"><span>돼지고기</span>
								</div>
								<div class = "allergy">
								<input type="checkbox" name="allergy" value="복숭아" v-model="allergy"><span>복숭아</span>
								<input type="checkbox" name="allergy" value="민들레" v-model="allergy"><span>민들레</span>
								<input type="checkbox" name="allergy" value="계란흰자" v-model="allergy"><span>계란흰자</span>
								</div>
							</div>
						</div>
					</div>
					<div class="input_info signUp_submit">
						<input type="submit" value="수정" style="width: 50px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;">				
						<c:url value="/withdraw" var="withdraw"/>
						<button type="button" style="width: 50px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;" onclick="location.href='${withdraw}'">탈퇴</button>
					</div>
				</div>
			</div>
	</form>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
<script src=" https://unpkg.com/vue"></script>	
<script>
let vi = new Vue({
	el:"#input_allergy",
	data : function(){
		return{
			 allergy:[] 
		}	
	},
	mounted : function(){
		this.allergy= ${allergy };
		console.log('${allergy}');
	}
});	
</script>
</body>
</html>