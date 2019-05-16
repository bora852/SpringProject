<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="login_place">
	<div class="container">
	
		<div id="login_nav">
			<c:if test="${empty loginUser}">
				<button type="button"
					class="btn btn-outline-light login_btn login_nav_btn"
					data-toggle="modal" data-target="#myModal">Login</button>
				<c:url value="/signUp" var="signUp"/>
				<button type="button" class="btn btn-outline-light login_btn login_nav_btn" onclick="location.href='${signUp }'">회원가입</button>
			</c:if>
			
			<c:if test="${!empty loginUser}">
				<c:url value="/userInfo" var="userInfo"/>
				<button type="button"
					class="btn btn-outline-light login_btn login_nav_btn"
					onclick="location.href='${userInfo }'">회원정보</button>
				<c:url value="/logout" var="logout"/>	
				<button type="button"
					class="btn btn-outline-light login_btn login_nav_btn"
					onclick="location.href='${logout }'">Logout</button>
			</c:if>
		</div>
	</div>
	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<c:url value="/login" var="login"/>
					<form action="${login}" method="post" id="loginForm">
						<input type="hidden" name="action" value="login">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" name="id"
									placeholder="Id" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" name="pw"
									placeholder="Password" required="required">
							</div>
						</div>
						<div class="form-group">
							<!-- <button class="btn btn-primary btn-block btn-lg" onclick="location.href='index_login.html' ">ㄴㄴ</button> -->
							<input type="submit" class="btn btn-primary btn-block btn-lg"
								value="로그인">
						</div>
						<p class="hint-text">
							<c:url value="/userfindId" var="userfindId"/>
							<a href="${userfindId }">아이디를 잊으셨나요?</a>
						</p>
						<p class="hint-text">
							<c:url value="/userfindPw" var="userfindPw"/>
							<a href="${userfindPw }">비밀번호를 잊으셨나요?</a>
						</p>
					</form>
				</div>
				<div class="modal-footer">
					아직 계정이 없으신가요? <a href="${signUp}">회원가입</a>
				</div>
			</div>
		</div>
	</div>


</nav>
<nav id="menu_place">
	<div class="container">
		
		<c:url value="/static/img/ssafy_Mark.jpg" var="image"></c:url>
			<a href="index.jsp"><img src="${image }" width=100px
				height=70px></a>

		<div id="menu_nav">
			<ul>
				<c:url value="/notice" var="notice"></c:url>
				<li><a href="${notice }" class="menu_a">공지 사항</a></li>
				<c:url value="/productinfo" var="productinfo"></c:url>
				<li><a href="${productinfo }" class="menu_a">상품 정보</a></li>
				<c:if test="${!empty loginUser}">
					<c:url value="/bestList" var="bestList"></c:url>
					<li><a href="${bestList }" class="menu_a">베스트 섭취 정보</a></li>
					<c:url value="/searchMyList" var="searchMyList"></c:url>
					<li><a href="${searchMyList }" class="menu_a">내 섭취 정보</a></li>
					<c:url value="/likeList" var="likeList"></c:url>
					<li><a href="${likeList }" class="menu_a">찜한 목록</a></li>
					<c:url value="/searchLikeList" var="searchLikeList"></c:url>
					<li><a href="${searchLikeList }" class="menu_a">예상 섭취 정보</a></li>
					<%-- <c:url value="/qna" var="qna"></c:url>
					<li><a href="${qna}" class="menu_a">QnA</a> --%>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<div id="top_place">
	<div class="container">
		<div id="top_title">
			<h1>What We Provide</h1>
			<hr>
			<h3>건강한 삶을 위한 먹거리 프로젝트</h3>
		</div>
	</div>
</div>


<script src=" https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script>
	let alarm = "${alarm}";
	if(alarm){
		alert(alarm);
	}
	
	let vq = new Vue({
		el:"#apps",
		data : { searchs : {}},
		mounted: function(){
			axios.get("/SF_WS_03/oftenSearch")
			.then(res => {
				this.searchs = res.data;
				console.log(this.searchs);
			})
		},
		methods:{
			doDetail : function(code){
				console.log(code);
				let url = "detail?name="+code;
				location.href = encodeURI(url);	
			}
		}
	});
</script>
<c:url value="/static/bg/bg1.jpg" var="bg"></c:url> 

 <style>
	<c:url value="/static/font/NANUMSQUAREROUNDR.TTF" var="fonts"></c:url>
	@font-face {
	  font-family: webisfree;
	  src: url('${fonts}');
	}
	
	body {
	  font-family: webisfree;
	}
</style> 