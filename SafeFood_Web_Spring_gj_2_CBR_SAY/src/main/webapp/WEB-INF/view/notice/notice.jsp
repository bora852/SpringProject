<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>공지사항</title>

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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

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

<%-- <c:url value="/static/css/table.css" var="tablecss"></c:url>
<link rel="stylesheet" type="text/css" href="${tablecss }"/> --%>
<style>
	.pagination {
   		justify-content: center;
	}
</style>
</head>
<body>
	<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar2.jsp" />
	</header>
	
	<!--   container -->
	<div class="container">
		<div id="app">
			<c:url value="/static/img/notice.png" var="rice"></c:url>
			<div style="padding:10px">
			<img src=${rice } style="width:100px; height:100px;">
			<span style="font-size:40px; vertical-align:middle;">공지사항</span>
		</div>
			<router-view></router-view>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer --><!-- http://localhost:8080/SF_WS_03/WEB-INF/view/menu/qna.jsp -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>

<!-- 공지사항 리스트 화면 -->
<script type="text/x-template" id="list-temp">
<div class="container">
	<span v-if="'${loginUser.id }' === 'admin'">
	<div style="text-align:right; margin:10px;">
		<button class="btn btn-info btn-sm"><router-link to = "/route2">글쓰기</router-link></button>
	</div>
	</span>
	<div>
		<table class="table table-hover" style="text-align: center;">
			<col width="15%"><col width="50%"><col width="20%"><col width="20%">
			<tr class="active">
			  <th>번호</th>
			  <th>제목</th>
			  <th>조회수</th>
			  <th>날짜</th>
			</tr>
			<tr v-for="qna in qnalist">
			  <td>{{qna.qna_idx}}</td>
			  <td @click="show_detail(qna.qna_idx)"><a href="#">{{qna.title}}</a></td>
 			  <td v-html="qna.views"></td>
			  <td v-html="qna.qna_date"></td>
			</tr>
		</table>
	</div>
	<ul class="pagination">
		<li class="page-item"><a class="page-link" href="#">Previous</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">4</a></li>
		<li class="page-item"><a class="page-link" href="#">5</a></li>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
<div style="text-align: center; margin:15px;">
	<select v-model="searchMode" style="height:30px;">
		<option>제목</option>
		<option>내용</option>
	</select>
	<input type="text" placeholder="검색어 입력" v-model:value="searchValue" @keyup.enter="search">
	<input type="button" class="btn btn-info btn-sm" value="검색" @click="search">
</div>

<div>
</script>

<!-- 공지사항추가 화면 -->
<script type="text/x-template" id="add-temp">
<div>
	<form action="" method="post" id="_frmForm" name="qnaForm" @submit.prevent="addQna">
		<input type="hidden" name="userId" value="관리자">
		<div class="mb-3">
			<label for="title">제목</label>
			<input type="text" class="form-control" v-model="qtitle" name="title" id="title" placeholder="제목을 입력해 주세요">
		</div>

		<div class="mb-3">
			<label for="content">내용</label>
			<textarea class="form-control" v-model="qcontents" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
		</div>

		<div style="text-align: center; margin:10px;">
			<button type="submit"  class="btn btn-info btn-sm"  name="button">등록</button></td>
			<button  class="btn btn-info btn-sm" ><router-link to = "/">목록</router-link></button>
		</div>
	</form>
</div>
</script>

<!-- 공지사항수정 화면 -->
<script type="text/x-template" id="update-temp">
<div>
<article  id="body">
		<div class="container" role="main">
			<h3>공지사항 수정화면</h3>
			<!--<c:url value="/writeNotice" var="writeNotice"></c:url>--> 
			<form name="form" id="form" role="form" method="post" action="${writeNotice}" @submit.prevent="updatQna">
				<input type="hidden" name="userId" value="관리자">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" v-model="qna.title" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea v-model="qna.content" class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				
				<input type="submit" class="btn btn-sm btn-primary" value="저장" id="btnSave" />
				
				<c:url value="/notice" var="notice"></c:url>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='${notice}'">목록</button>
			</form>
		</div>
	</article>
</div>
</script>

<!-- 공지사항상세보기 화면 -->
<script type="text/x-template" id="detail-temp">
<div>
<article  id="body">
		<div class="container" role="main">
			<h3>공지사항 상세보기</h3>
				
				<table class="table table-bordered">
					<col width="15%"><col width="70%">
					<tr>
						<th>번호</th>
						<td><p v-html="qna.qna_idx"></p></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><p v-html="qna.title"></p></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><p v-html="qna.content"></p></td>
					</tr>
					<tr>
					<th>작성자</th>
						<td><p v-html="qna.user_id"></p></td>
					</tr>
					<th>작성일</th>
						<td><p v-html="qna.qna_date"></p></td>
					</tr>
				</table>
				<!-- onclick="location.href='/SF_WS_03/notice#/route3'" -->
				<span v-if="'${loginUser.id }' === 'admin'">
					<button class="btn btn-sm btn-primary" id="btnSave" @click="show_update(qna.qna_idx)">수정</button>
				</span>
				<c:url value="/notice" var="qna"></c:url>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='${qna}'">목록</button>
				<span v-if="'${loginUser.id }' === 'admin'">
					<button class="btn btn-sm btn-primary" id="btnDelete" @click="deleteQna(qna.qna_idx)">삭제</button>
				</span>
		</div>
	</article>
</div>
</script>



<script src="https://unpkg.com/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<script>
		/* QnA리스트 */
		let listView = Vue.component('listView', {
			template : '#list-temp',
			data:function(){
				return{
					qnalist : [],
					loading : true,
					errored : false,
					searchMode:"제목",
					searchValue:"",
					maxPage:0
				}
			},
			mounted:function(){
				axios
				.get('http://localhost:9090/api/qnas')
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
				},
				search() {
					let searchMode = "";
					if(this.searchMode === '제목')
						searchMode = "title";
					else
						searchMode = "content";
					
					if(this.searchValue == ''){
						axios
						.get('http://localhost:9090/api/qnas')
						.then((res) => {
							this.qnalist = res.data.data;
						})
						.catch((error) => {
							console.log(error);
							this.errored = true;
						})
						.finally(() => this.loading=false)
					}else{
						axios.get("http://localhost:9090/api/search/" + searchMode + "/" + this.searchValue)
						.then(response => {
							this.qnalist = response.data.data;
							this.maxPage = Math.ceil(response.data.maxPage/10);
							console.log(this.maxPage);
						}).catch(error => {
							console.log(error);
						});
					}
				}
			}
		});

		/* QnA추가*/
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
					if(this.qtitle==''){alert('제목을 입력하세요.');return;}
					if(this.qcontents==''){alert('내용을 입력하세요.');return;}
					
					console.log(this.qcontents);
					
					axios.post('http://localhost:9090/api/qnas', { //121.147.32.111
						user_id : this.quserId,
						title : this.qtitle,
						content : this.qcontents
					}
							)
					.then((res) =>{
						this.qans = res.data.data;
						alert('글이 등록되었습니다.');
						location.href="/SF_WS_03/notice#/"; 
					}).catch(error => {
						console.log(error);
						this.errored = true;
					}).finally(()=>{
						this.loading=false;
					})
				}
			}
		});
		
		/* 공지사항수정  */
		let updateView = Vue.component('updateView', {
			template : '#update-temp',
			data: function(){
				return {
					qna : {}
				}
			},
			mounted : function(){
				axios.get("http://localhost:9090/api/qnas/"+this.$route.params.id)
				.then(res => {
					this.qna = res.data.data;
					console.log(this.qna)
				}).catch(error => {
					console.log(error)
				})
			},
			methods:{
				updatQna(){
					axios.put("http://localhost:9090/api/qnas", this.qna)
					.then(res => {
						alert('글이 수정되었습니다.');
						router.push({path:'/route4/'+this.qna.qna_idx});
					}).catch(error => {
						console.log(error);
					})
				}
			}
			
		});
		
		/* 공지사항상세보기*/
		let detailView = Vue.component('detailView', {
			template : '#detail-temp',
			data : function(){
				return { 
					qna : {}
				}
			},
			mounted:function(){
				axios.get("http://localhost:9090/api/qnas/"+this.$route.params.id)
				.then(res => {
					this.qna = res.data.data;
					console.log(this.qna)
				}).catch(error => {
					console.log(error)
				})
				
			},
			methods : {
				show_update(idx){
					router.push({path:'/route3/'+idx});
				},
				deleteQna(idx){
					axios.delete("http://localhost:9090/api/qnas/"+idx)
					.then(res => {
						alert("삭제되었습니다.");
						location.href="/SF_WS_03/notice#/";
					}).catch(error => {
						console.log(error);
					})
				}
				
			}
		});

		const routes = [ {
			path : '/',
			component : listView
		}, {
			path : '/route2',
			component : addView
		}, {
			path : '/route3/:id',
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