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
							<a href="./userfindPw.jsp">비밀번호를 잊으셨나요?</a>
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
		<div id="img_place">
		
		<c:url value="/static/img/ssafy_Mark.jpg" var="image"></c:url>
			<a href="index.jsp"><img src="${image }" width=100px
				height=70px></a>
		</div>

		<div id="menu_nav">
			<ul>
				<li><a href="#" class="menu_a">공지 사항</a></li>
				<li><a href="productinfo.jsp" class="menu_a">상품 정보</a></li>
				<li><a href="#" class="menu_a">베스트 섭취 정보</a></li>
				<%
					if (session.getAttribute("loginId") != null) {
				%>
				<li><a href="eatList.jsp" class="menu_a">내 섭취 정보</a></li>
				<li><a href="#" class="menu_a">예상 섭취 정보</a></li>
				<%
					}
				%>
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

	<div id="search_place">
		<div class="container">
			<div id="search_box">
				<div id="condition" class="search_div">
					<h5>검색 조건</h5>
					<select id="selected" style="width: 100px; height: 30px; font-size: 15px;">
						<option class="s_option" style="width: 100px; height: 30px; font-size: 15px;">상품명</option>
						<option class="s_option" style="width: 100px; height: 30px; font-size: 15px;">제조사</option>
						<option class="s_option" style="width: 100px; height: 30px; font-size: 15px;">재료명</option>
					</select>
				</div>
				<div id="search_word" class="search_div">
					<h5>검색 단어</h5>
					<div id="text_button">
						<input id="search_input" type="text" class="float_left" size="40" style="width: 300px; height: 30px; font-size: 15px;"> 
						<input id="search_bt" type="button" class="float_left" value="검색" style="width: 80px; height: 30px; margin-left: 15px;">
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	let alarm = "${alarm}";
	if(alarm){
		alert(alarm);
	}
	$(document).on('click','#search_bt',function() {
		console.log("들어감")
		$.ajax({
			<c:url value="/search" var="search"></c:url>
		/* 	url : "${search}" */
			type : "get",
			dataType : "json",
			data : {
				"select" : "$('#selected option:selected').val()",
				"input" : "$('#search_input').val()"
			},
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
	
	});
</script>
