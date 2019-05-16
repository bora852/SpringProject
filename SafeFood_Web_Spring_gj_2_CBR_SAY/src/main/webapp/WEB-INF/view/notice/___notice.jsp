<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/WEB-INF/view/include/header.jsp"%> --%>
    
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
<c:url value="/static/css/heroic-features.css" var="heroiccss"></c:url>
<c:url value="/static/css/main.css" var="maincss"></c:url>
<c:url value="/static/css/modal.css" var="modalcss"></c:url>
<c:url value="/static/css/common.css" var="commoncss"></c:url>
<link href="${heroiccss }" rel="stylesheet">
<link href="${maincss }" rel="stylesheet">
<link href="${modalcss }" rel="stylesheet">
<link href="${commoncss }" rel="stylesheet">
<script src="http://www.w3schools.com/lib/w3data.js"></script>

</head>
<body>
	<!-- Navigation -->
	<header>
		<jsp:include page="../include/Navbar.jsp" />
	</header>
	<!-- /.container -->

<article>
<div class="container" id="body">
	<div class="table-responsive">
	<table class="table table-striped table-sm">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:auto;" />
				<col style="width:15%;" />
				<col style="width:10%;" />
				<col style="width:20%;" />
			</colgroup>
	
			<thead>
				<tr>
					<th>NO</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
	
			<tbody>
				<c:choose>
					<c:when test="${empty noticeList }" >
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when> 
	
					<c:when test="${!empty noticeList}">
						<c:forEach var="list" items="${noticeList}">
							<tr>
								<td><c:out value="${list.noticeIdx}"/></td>
								<td><c:out value="${list.title}"/></td>
								<td><c:out value="${list.userId}"/></td>
								<td><c:out value="${list.hitCnt}"/></td>
								<td><c:out value="${list.createDate}"/></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<div >
			<c:url value="/writeNotice" var="writeNotice"></c:url>
			<button type="button" class="btn btn-sm btn-primary" id="btnWriteForm" onclick="location.href='${writeNotice}'">글쓰기</button>
		</div>

		<select v-model="searchMode">
			<option>제목</option>
			<option>글쓴이</option>
			<option>내용</option>
		</select>
		<input type="text" placeholder="검색어 입력" v-model:value="searchValue" @keyup.enter="search">
		<input type="button" class="btn btn-info btn-sm" value="검색">
	
	</div>
</div>
</article>
	<!-- Footer -->
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
</body>
<script>
	
</script>
</html>