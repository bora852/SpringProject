<%@page import="java.util.Arrays"%>
<%@page import="com.ssafy.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>회원정보</title>

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
	<%
		UserVO user = (UserVO) request.getAttribute("user");
	%>
	<!-- Navigation -->
	<header>
		<div w3-include-html="Navbar.jsp"></div>
	</header>
	<!-- 회원정보 폼 -->
	<form method="post" action="user.do" id="updateForm">
		<input type="hidden" name="action" value="update">
		<div id="signUp_place">
			<div class="container">
				<div id="signUp_box">
					<%
						if (request.getAttribute("msg") != null) {
					%>
					<span><%="-" + request.getAttribute("msg")%></span>
					<%
						}
					%>
					<h2>회원정보</h2>
					<div class="input_info">
						<span>아이디</span> <input type="text"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="아이디를 입력해주세요." value="${user.getId()}"
							disabled="disabled"> <input type="hidden" name="id"
							<%-- value="<%=user.getId()%>"> --%>
							value="${user.getId()}">
					</div>
					<div class="input_info">
						<span>비밀번호</span> <input type="password" name="pw"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="영문 숫자 포함 6자리 이상" value="${user.getPw()}">
					</div>
					<div class="input_info">
						<span>이름</span> <input type="text" name="name"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="이름을 입력해주세요" value="${user.getName()}">
					</div>
					<div class="input_info">
						<span>주소</span> <input type="text" name="addr"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="주소를 입력해주세요" value="${user.getAddr()}">
					</div>
					<div class="input_info">
						<span>전화번호</span> <input type="tel" name="tel"
							style="width: 300px; height: 30px; font-size: 15px;"
							<%-- placeholder="010-xxxx-xxxx" value="<%=user.getTel()%>"> --%>
							placeholder="010-xxxx-xxxx" value="${user.getTel()}">
					</div>
					<div class="input_info">
						<span>알레르기</span> <input type="hidden" id="allvalue"
							<%-- value="<%=user.getAllergy()%>"> --%>
							value="${user.getAllergy()}">
						<div id="input_allergy">

							<%
								String[] s = user.getAllergy();
								String al = "";
								for (int i = 0; i < s.length; i++) {
									al += s[i];
								}
							%>
							<div class="allergy">
								<%
									if (al.contains("대두")) {
								%>
								<input type="checkbox" checked="checked" id="대두" name="allergy"
									value="대두"><span>대두</span>
								<%
									} else {
								%>
								<input type="checkbox" id="대두" name="allergy" value="대두"><span>대두</span>
								<%
									}
								%>
								<%
									if (al.contains("땅콩")) {
								%>
								<input type="checkbox" id="땅콩" checked="checked" name="allergy" value="땅콩"><span>땅콩</span>
								<%
									} else {
								%>
								<input type="checkbox" id="땅콩" name="allergy" value="땅콩"><span>땅콩</span>
								<%
									}
								%>
								<%
									if (al.contains("우유")) {
								%>
								<input type="checkbox" checked="checked" id="우유" name="allergy"
									value="우유"><span>우유</span>
								<%
									} else {
								%>
								<input type="checkbox" id="우유" name="allergy" value="우유"><span>우유</span>
								<%
									}
								%>
								<%
									if (al.contains("게")) {
								%>
								<input type="checkbox" id="게" checked="checked" name="allergy" value="게"><span>게</span>
								<%
									} else {
								%>
								<input type="checkbox" id="게" name="allergy" value="게"><span>게</span>
								<%
									}
								%>
							</div>
							<div class="allergy">
								<%
									if (al.contains("새우")) {
								%>
								<input type="checkbox" id="새우" checked="checked" name="allergy" value="새우"><span>새우</span>
								<%
									} else {
								%>
								<input type="checkbox" id="새우" name="allergy" value="새우"><span>새우</span>
								<%
									}
								%>
								<%
									if (al.contains("참치")) {
								%>
								<input type="checkbox" id="참치" checked="checked" name="allergy" value="참치"><span>참치</span>
								<%
									} else {
								%>
								<input type="checkbox" id="참치" name="allergy" value="참치"><span>참치</span>
								<%
									}
								%>
								<%
									if (al.contains("연어")) {
								%>
								<input type="checkbox" id="연어" checked="checked" name="allergy" value="연어"><span>연어</span>
								<%
									} else {
								%>
								<input type="checkbox" id="연어" name="allergy" value="연어"><span>연어</span>
								<%
									}
								%>
								<%
									if (al.contains("쑥")) {
								%>
								<input type="checkbox" id="쑥" checked="checked" name="allergy" value="쑥"><span>쑥</span>
								<%
									} else {
								%>
								<input type="checkbox" id="쑥" name="allergy" value="쑥"><span>쑥</span>
								<%
									}
								%>
							</div>
							<div class="allergy">
								<%
									if (al.contains("소고기")) {
								%>
								<input type="checkbox" id="소고기" checked="checked" name="allergy" value="소고기"><span>소고기</span>
								<%
									} else {
								%>
								<input type="checkbox" id="소고기" name="allergy" value="소고기"><span>소고기</span>
								<%
									}
								%>
								<%
									if (al.contains("닭고기")) {
								%>
								<input type="checkbox" id="닭고기" checked="checked" name="allergy" value="닭고기"><span>닭고기</span>
								<%
									} else {
								%>
								<input type="checkbox" id="닭고기" name="allergy" value="닭고기"><span>닭고기</span>
								<%
									}
								%>
								<%
									if (al.contains("돼지고기")) {
								%>
								<input type="checkbox" id="돼지고기" checked="checked" name="allergy" value="돼지고기"><span>돼지고기</span>
								<%
									} else {
								%>
								<input type="checkbox" id="돼지고기" name="allergy" value="돼지고기"><span>돼지고기</span>
								<%
									}
								%>
							</div>
							<div class="allergy">
								<%
									if (al.contains("복숭아")) {
								%>
								<input type="checkbox" id="복숭아" checked="checked" name="allergy" value="복숭아"><span>복숭아</span>
								<%
									} else {
								%>
								<input type="checkbox" id="복숭아" name="allergy" value="복숭아"><span>복숭아</span>
								<%
									}
								%>
								<%
									if (al.contains("민들레")) {
								%>
								<input type="checkbox" id="민들레" checked="checked"  name="allergy" value="민들레"><span>민들레</span>
								<%
									} else {
								%>
								<input type="checkbox" id="민들레" name="allergy" value="민들레"><span>민들레</span>
								<%
									}
								%>
								<%
									if (al.contains("계란흰자")) {
								%>
								<input type="checkbox" id="계란흰자" checked="checked" name="allergy" value="계란흰자"><span>계란흰자</span>
								<%
									} else {
								%>
								<input type="checkbox" id="계란흰자" name="allergy" value="계란흰자"><span>계란흰자</span>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<div class="input_info signUp_submit">
						<input type="submit" value="수정"
							style="width: 50px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;">
						<button type="button"
							style="width: 50px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;"
							onclick="location.href='userInfo.do?action=withdraw'">탈퇴</button>
						<!-- <input type="submit" value="탈퇴" style="width:50px; height:30px;font-size:15px; background:#343a40; color:white; border-radius: 5px;"> -->
					</div>
				</div>
			</div>
		</div>
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