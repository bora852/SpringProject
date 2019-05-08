<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>QnA</title>

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

<script src="https://unpkg.com/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
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
<link rel="stylesheet" type="text/css" href="./table.css"/>

</head>
<body>
	<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar.jsp" />
	</header>

	<!--   container -->
	<div id="app">
		<h1>QnA</h1>
		<div>
			<router-link to="/route1">리스트</router-link>
			<router-link to="/route2">추가</router-link>
			<router-link to="/route3">업데이트</router-link>
			<router-link to="/route4">자세히</router-link>
			
		</div>
		<router-view></router-view>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>

	<script type="text/x-template" id="list-temp">
<div>
<button><router-link to = "/route2">문의하기</router-link></button>
<div>
<table class='list_table'>
<col width="10%"><col width="70%"><col width="20%">
<tr>
  <th>번호</th>
  <th>제목</th>
  <th>날짜</th>
</tr>
<tr v-for="qna in qnalist">
  <td v-html="qna.qna_idx" @click="show_detail(emp.id)"></td>
  <td v-html="qna.title"></td>
  <td v-html="qna.qna_date"></td>
</tr>
</table>
</div>
<div>
</script>
	<script type="text/x-template" id="add-temp">
<div>
<form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="addQna">
<table class="content_table">
<colgroup>
		<col style="width:30%;" />
		<col style="width:70%;" />							
</colgroup>	
<tr>
<th>문의유형</th>
<td><input data-msg="문의유형" type="text" name="category" id="_category" size="30" v-model="cname"/></td>
</tr>
<tr>
<th>제목</th>
<td><input data-msg="제목" type="text" name="title"  id="_title" size="20" v-model="cmailid" /></td>
</tr>
<tr>
<th>문의내용</th>
<td><input data-msg="문의내용" type="date" name="contents"  id="_contents" size="30" v-model="cstart_date" /></td>
</tr>

<td colspan="2" style="height:50px; text-align:center;">
<button>취소</button>
<button type="submit" name="button">등록</button></td>
</tr>
</table>
</form>
</div>
</script>
	<script type="text/x-template" id="update-temp">
<div>
	수정화면
</div>
</script>
	<script type="text/x-template" id="detail-temp">
<div>
	상세보기화면
</div>
</script>
	<script>
		let listView = Vue.component('listView', {
			template : '#list-temp',
			data:function(){
				return{
					qnalist : [],
					loading : true,
					errored : false
				}
			},
			mounted:function(){
				axios
				.get('http://121.147.32.117:9090/api/qnas')
				.then((res) => {
					this.qnalist = res.data.data
				})
				.catch(error => {
					console.log(error)
					this.errored = true
				})
				.finally(() => this.loading=false)
			}
		});
		let addView = Vue.component('addView', {
			template : '#add-temp'
		});
		let updateView = Vue.component('updateView', {
			template : '#update-temp'
		});
		let detailView = Vue.component('detailView', {
			template : '#detail-temp'
		});

		const routes = [ {
			path : '/route1',
			component : listView
		}, {
			path : '/route2',
			component : addView
		}, {
			path : '/route3',
			component : updateView
		}, {
			path : '/route4',
			component : detailView
		} ];

		const router = new VueRouter({
			routes : routes
		});
		var vi = new Vue({
			el : "#app",
			router : router
		});
	</script>
</body>
</html>