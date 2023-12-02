<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../../views/layouts/header1.jsp"%>


<section class="board-main">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">소통 게시판</div>
				<div class="message">
					소중한 여러분의 경험을 공유하여<br /> 다른 사람들과 소통하세요
				</div>
			</div>
		</div>
	</div>
</section>

<div class="inner">

	<%@ include file="../common/search_bar.jsp"%>

	<h1 class="page-header" style="margin-top: 20px;">🖥️게시글 목록</h1>
<!-- 	<div class="navigator_boardlist">
		<span style="width: 60px">No</span> <span>제목</span> <span
			style="width: 100px">작성자</span> <span style="width: 130px">등록일</span>
	</div> -->

	<div class="boardlist">
		<c:forEach var="board" items="${list}" varStatus="loop">
			<!-- loop.index는 0부터 시작하는 인덱스이므로 +1을 하여 1부터 시작하도록 수정 -->
			<c:if test="${loop.index + 1 <= 10}">
			
			<div class="post">
				<div class="thumbnail_username">
					<img src="../../resources/images/board/profile_plant.png" width="30" height="30">
				</div>
				<div class="info_userprofile">
					<em class="name_username">${board.username}</em> 
				</div>
				<div class="content">
					<span>${board.region}</span><strong class="title_post"> <a class="move"
						href="${cri.getLinkWithPostid('get', board.postid)}">
							${board.title}</a></strong>
				</div>
				<div class="time"><fmt:formatDate
							pattern="yyyy-MM-dd" value="${board.regDate}" /></div>
			</div>
			</c:if>
		</c:forEach>

	</div>

	<div class="text-right">
		<a href="register" class="btn btn-travel"> <i class="far fa-edit"></i>
			글쓰기
		</a>
	</div>


	<%@include file="../common/pagination.jsp"%>

</div>

<%@ include file="../../views/layouts/footer1.jsp"%>

<style>
.board-main {
	height: 360px;
	background-image: url('/resources/images/boardhead.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	z-index: 1;
}

.boardlist {
    border-top: 1px solid #ccc;
}

.post {
	padding: 10px 10px;
}

.thumbnail_username {
	width: 30px;
	height: 30px;
    float: left;
    margin-right: 10px;
}

.info_userprofile {
    overflow: hidden;
    margin-bottom: 5px;
}

.name_username {
    font-weight: bold;
    margin-right: 5px;
}

.content {
    clear: both;
    margin-bottom: 10px;
}

.title_post a {
    text-decoration: none;
    color: #333;
}

.title_post a:hover {
    color: #008CBA;
    text-decoration: underline;
}

.text-right {
    text-align: right;
    margin-top: 20px;
}

/* 페이지네이션 */
.pagination {
    display: flex;
    justify-content: center;
    list-style: none;
    padding-left: 0;
}

.pagination li {
    margin-right: 5px;
}

.pagination li a {
    text-decoration: none;
    color: #333;
    padding: 5px 10px;
    border: 1px solid #ccc;
}

.pagination li a:hover {
    background-color: #f0f0f0;
}

.btn-travel{
	background-color: #15BDB1;
	color: white !important;
}

.btn-travel:hover {
    background-color: #0a7d7a;
    
}

</style>