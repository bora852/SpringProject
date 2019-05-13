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
<c:url value="/static/css/common.css" var="commoncss"></c:url>
<link href="${heroiccss }" rel="stylesheet">
<link href="${maincss }" rel="stylesheet">
<link href="${modalcss }" rel="stylesheet">
<link href="${signUpcss }" rel="stylesheet">
<link href="${commoncss }" rel="stylesheet">
<script src="http://www.w3schools.com/lib/w3data.js"></script>

<c:url value="/static/css/table.css" var="tablecss"></c:url>
<link rel="stylesheet" type="text/css" href="${tablecss }"/>

</head>
<body>

	<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar.jsp" />
	</header>
	<!--   container -->
	<div id="app">
		<h1>- QnA -</h1>
		<div>
			<!-- <router-link to="/route3">업데이트</router-link>
			<router-link to="/route4">자세히</router-link> -->
		</div>
		<router-view></router-view>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>

<!-- QnA 리스트 화면 -->
<script type="text/x-template" id="list-temp">
<div>
<button><router-link to = "/route2">문의하기</router-link></button>
<div>
<table class='list_table'>
<col width="15%"><col width="70%"><col width="20%">
<c:url value="/static/img/question.png" var="question"></c:url>
<tr>
  <th>번호</th>
  <th>제목</th>
  <th>날짜</th>
</tr>
<tr v-for="qna in qnalist">
  <td><img src="${question }" width="30px" height="30px">{{qna.qna_idx}}</td>
  <td @click="show_detail(qna.qna_idx)"><a href="#">{{qna.title}}</a></td>
  <td v-html="qna.qna_date"></td>
</tr>
</table>
</div>
		<!--<input type="text" placeholder="검색어 입력" v-model:value="searchValue" @keyup.enter="search">-->
		<input type="button" class="btn btn-info btn-sm" value="검색">
<div>
</script>

<!-- QnA 추가 화면 -->
<script type="text/x-template" id="add-temp">
<div>
<form action="" method="post" id="_frmForm" name="qnaForm" @submit.prevent="addQna">
<table class="content_table">
<colgroup>
		<col style="width:30%;" />
		<col style="width:70%;" />							
</colgroup>	
<tr>
<th>문의유형</th>
<td><select name="job" id="_category" v-model="qcategory">
    	<option value="">문의 유형 선택</option>
    	<option value="1">음식1</option>
    	<option value="2">음식2</option>
    	<option value="3">음식3</option>
	</select>
</td>
</tr>
<tr>
<th>제목</th>
<td><input data-msg="제목" type="text" name="title"  id="_title" size="30" v-model="qtitle"/></td>  
</tr>
<tr>
<th>문의내용</th>
<td><input data-msg="문의내용" type="contents"  id="_contents" size="30" v-model="qcontents"/></td>
</tr>
<tr>
<td colspan="2" style="height:50px; text-align:center;">
<button><router-link to = "/">목록</router-link></button>
<button type="submit" name="button">등록</button></td>
</tr>
</table>
</form>
</div>
</script>

<!-- QnA 수정 화면 -->
<script type="text/x-template" id="update-temp">
<div>
<article  id="body">
		<div class="container" role="main">
			<h3>공지사항 수정화면</h3>
			<c:url value="/writeNotice" var="writeNotice"></c:url>
			<form name="form" id="form" role="form" method="post" action="${writeNotice}">
				<input type="hidden" name="userId" value="관리자">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				
				<input type="submit" class="btn btn-sm btn-primary" value="저장" id="btnSave" />
				
				<c:url value="/qna" var="qna"></c:url>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='${qna}'">목록</button>
			</form>
			<div >
			</div>
		</div>
	</article>
</div>
</script>

<!-- QnA 상세보기 화면 -->
<script type="text/x-template" id="detail-temp">
<div>
<article  id="body">
		<div class="container" role="main">
			<h3>공지사항 상세보기</h3>
			<c:url value="/writeNotice" var="writeNotice"></c:url>
			<form name="form" id="form" role="form" method="post" action="${writeNotice}">
				<input type="hidden" name="userId" value="관리자">
				<div class="mb-3">
					<label for="title">제목</label>
					<p v-html="qna.title"></p>
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<p v-html="qna.content"></p>
				</div>

				<button class="btn btn-sm btn-primary" id="btnSave" onclick="location.href='/SF_WS_03/qna#/route3'">수정</button>
				<c:url value="/qna" var="qna"></c:url>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='${qna}'">목록</button>
			</form>
		</div>
	</article>
</div>
</script>


<script>

/* QnA리스트 화면 */
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
				.get('http://121.147.32.111:9090/api/qnas')
				.then((res) => {
					this.qnalist = res.data.data;
				})
				.catch((error) => {
					console.log(error);
					this.errored = true;
				})
				.finally(() => this.loading=false)
			},
			methods:{
				show_detail:function(idx){
					router.push({path:'/route4/'+idx});
				}
			}
		});

/* QnA추가 화면 */
		let addView = Vue.component('addView', {
			template : '#add-temp',
			data:function(){
				return{
					quserId:'${loginUser.id}',
					qcategory:'',
					qtitle:'',
					qcontents:''
				}
			},
			methods:{
				addQna:function(){
					if(this.qcategory==''){alert('카테고리를 선택하세요.');return;}
					if(this.qtitle==''){alert('제목을 입력하세요.');return;}
					if(this.qcontents==''){alert('내용을 입력하세요.');return;}
					
					console.log(this.qcontents);
					
					axios.post('http://121.147.32.111:9090/api/qnas', {
						user_id : this.quserId,
						category : this.qcategory,
						title : this.qtitle,
						content : this.qcontents
					}
							)
					.then((res) =>{
						this.qans = res.data.data;
						alert('글이 등록되었습니다.');
						location.href="/SF_WS_03/qna#/"; 
					}).catch(error => {
						console.log(error);
						this.errored = true;
					}).finally(()=>{
						this.loading=false;
					})
				}
			}
		});
		
/* QnA 수정 화면 */
		let updateView = Vue.component('updateView', {
			template : '#update-temp'
		});
		
/* QnA 자세히 화면 */
		let detailView = Vue.component('detailView', {
			template : '#detail-temp',
			data : function(){
				return { 
					qna : {}
				}
			},
			mounted:function(){
				axios.get("http://121.147.32.111:9090/api/qnas/"+this.$route.params.id)
				.then(res => {
					this.qna = res.data.data;
					console.log(this.qna)
				}).catch(error => {
					console.log(error)
				})
				
			},
			methods : {
				
			}
		});

		const routes = [ {
			path : '/',
			component : listView
		}, {
			path : '/route2',
			component : addView
		}, {
			path : '/route3',
			component : updateView
		}, {
			path : '/route4/:id',
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