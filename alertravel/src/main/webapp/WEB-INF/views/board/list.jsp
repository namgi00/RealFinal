<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../../views/layouts/header1.jsp"%>

<script>

document.addEventListener('DOMContentLoaded', function() {
    var writeButton = document.querySelector('.btn-travel-anonymous'); // 글쓰기 버튼 선택

    // 글쓰기 버튼 클릭 시
    writeButton.addEventListener('click', function(event) {
        event.preventDefault(); // 기본 이벤트 방지 (링크 이동 등)

        var isAnonymous = checkAnonymous(); // 로그인 상태를 확인하는 함수

        if (isAnonymous) {
            // 로그인이 필요한 서비스임을 알리는 팝업 창을 띄웁니다.
            //alert("로그인이 필요한 서비스입니다.");

             var confirmPopup = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
             if (confirmPopup) {
                 window.location.href = "/security/login"; // 로그인 페이지 URL로 이동
            }
        } else {
            // 로그인된 상태에서는 글쓰기 기능을 수행하도록 코드를 추가하세요.
            // 여기에 글쓰기 버튼 클릭 시 동작하는 내용을 추가하세요.
            // ...
        }
    });

    // 사용자가 로그인 상태인지 확인하는 함수 (예시)
    function checkAnonymous() {
        // 여기에 로그인 상태를 확인하는 코드를 작성하세요.
        // 예시: 실제 프로젝트에서 사용자가 로그인되어 있는지 확인하는 방식을 구현해야 합니다.
        // isAnonymous가 true이면 로그인이 되지 않은 상태를 가정합니다.
        var isAnonymous = true; // 실제로는 사용자의 로그인 상태를 확인하여 값을 할당해야 합니다.
        return isAnonymous;
    }
});


	
</script>

<section class="board-main">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">여행후기</div>
				<div class="message">
					소중한 여러분의 여행 경험을 공유하여<br /> 다른 사람들과 소통하세요
				</div>
			</div>
		</div>
	</div>
</section>

<div class="inner">

	<%@ include file="../common/search_bar.jsp"%>

	<h1 class="page-header">🧭우리의 여행기</h1>
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

						<img
							src="https://api.dicebear.com/7.x/notionists/svg?body=variant04"
							width="30" height="30">
					</div>
					<div class="info_userprofile">
						<em class="name_username">${board.username}</em>
					</div>
					<div class="content">
						<c:choose>
							<c:when test="${board.region == '유럽'}">
								<span class="europe">${board.region}</span>
							</c:when>
							<c:when test="${board.region == '아프리카'}">
								<span class="africa">${board.region}</span>
							</c:when>
							<c:when test="${board.region == '중동'}">
								<span class="mid-east">${board.region}</span>
							</c:when>
							<c:when test="${board.region == '아시아'}">
								<span class="asia">${board.region}</span>
							</c:when>
							<c:when test="${board.region == '북미'}">
								<span class="n-america">${board.region}</span>
							</c:when>
							<c:when test="${board.region == '남미'}">
								<span class="s-america">${board.region}</span>
							</c:when>
							<c:when test="${board.region == '오세아니아'}">
								<span class="oceania">${board.region}</span>
							</c:when>
							<c:otherwise>
								<span>${board.region}</span>
							</c:otherwise>
						</c:choose>
						<strong class="title_post"> <a class="move"
							href="${cri.getLinkWithPostid('get', board.postid)}">
								${board.title}</a></strong>
					</div>
					<div class="time">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" />
					</div>
				</div>
			</c:if>
		</c:forEach>

	</div>

	<div class="text-right">
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.username" var="username" />
			<a href="register" class="btn btn-travel"> <i class="far fa-edit"></i>
				글쓰기
			</a>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<a href="/security/login" class="btn btn-travel-anonymous"> <i
				class="far fa-edit"></i> 글쓰기
			</a>
		</sec:authorize>
	</div>


	<br><%@include file="../common/pagination.jsp"%>

</div>

<%@ include file="../../views/layouts/footer1.jsp"%>

<style>

.europe, .africa, .mid-east, .asia, .n-america, .s-america, .oceania{
	font-family:font-family: 'Spoqa Han Sans Neo', 'Sans-serif';
	font-weight: 600;
	display: inline-block;
	margin-top: 5px;
	padding-top: 0.2rem;
	padding-bottom: 0.2rem;
	padding-left: 0.5rem;
	padding-right: 0.5rem;
	border-radius: 3px;
}

.europe {
    color: white;
    background: #3095E9;
}

.africa {
    color: white;
    background: #299E8D;
}

.mid-east {
    color: white;
    background: #F3A361;
}

.asia {
    color: white;
    background: #8D94E9;
}

.n-america {
    color: white;
    background: #F78384;
}
.s-america {
    color: white;
    background: #8BD292;
}

.oceania {
    color: white;
    background: #023048;
}

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

.page-header {
	font-family: 'Spoqa Han Sans Neo', 'Sans-serif';
	font-weight: 500;
	font-size: 35px;
	color: #2F3438;
	margin-top: 20px;
	margin-bottom: 20px;
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

.btn-travel {
	background-color: #15BDB1;
	color: white !important;
}

.btn-travel:hover {
	background-color: #0a7d7a;
}

.btn-travel-anonymous {
	background-color: #15BDB1;
	color: white !important;
}

.btn-travel-anonymous:hover {
	background-color: #0a7d7a;
}
</style>