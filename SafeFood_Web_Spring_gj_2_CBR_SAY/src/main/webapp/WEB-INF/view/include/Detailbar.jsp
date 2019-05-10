<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav id="login_place">
	<div class="container">
		<div id="login_nav">
			<c:if test="${empty loginUser }">
			<button type="button"
				class="btn btn-outline-light login_btn login_nav_btn"
				data-toggle="modal" data-target="#myModal">Login</button>
			<button type="button"
				class="btn btn-outline-light login_btn login_nav_btn"
				onclick="location.href='SignUp.jsp'">회원가입</button>
			</c:if>
			<c:if test="${!empty loginUser }">
			<button type="button"
				class="btn btn-outline-light login_btn login_nav_btn"
				onclick="location.href='userInfo.do?action=userInfo'">회원정보</button>
			<button type="button"
				class="btn btn-outline-light login_btn login_nav_btn"
				onclick="location.href='Logout.do?action=logout'">Logout</button>
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
					<form action="user.do" method="post" id="loginForm">
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
							<a href="./userfindPw.jsp">비밀번호를 잊으셨나요?</a>
						</p>
					</form>
				</div>
				<div class="modal-footer">
					아직 계정이 없으신가요? <a href="./SignUp.html">회원가입</a>
				</div>
			</div>
		</div>
	</div>


</nav>
<nav id="menu_place">
	<div class="container">
		<div id="img_place">
			<a href="index.jsp"><img src="./img/ssafy_Mark.jpg" width=100px
				height=70px></a>
		</div>

		<div id="menu_nav">
			<ul>
				<li><a href="#" class="menu_a">공지 사항</a></li>
				<li><a href="productinfo.jsp" class="menu_a">상품 정보</a></li>
				<li><a href="#" class="menu_a">베스트 섭취 정보</a></li>
				<c:if test="${!empty loginUser }">
				<li><a href="#" class="menu_a">내 섭취 정보</a></li>
				<li><a href="#" class="menu_a">예상 섭취 정보</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<hr>
</nav>


