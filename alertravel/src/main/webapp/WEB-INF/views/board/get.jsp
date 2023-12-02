<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../../views/layouts/header1.jsp"%>

<script src="/resources/js/rest.js"></script>

<script>
window.addEventListener('load', function() {
    // 이미지 로드 후 실행될 코드
    var imageHeight = document.querySelector('.post-zone img').clientHeight; // 이미지의 높이 가져오기

    var replyZone = document.querySelector('.reply-zone');
    replyZone.style.marginTop = imageHeight + 'px'; // 댓글 영역의 margin-top을 이미지 높이만큼 조절하여 위치 조정
});

//댓글, 답글 기본 URL 상수 - 전역 상수
const COMMENT_URL = '/api/board/${param.postid}/comment/';
const REPLY_URL = '/api/board/${param.postid}/reply/';


$(document).ready(async function() {

	$('.remove').click(function(){
		if(!confirm('정말 삭제할까요?')) return;		
		document.forms.removeForm.submit();
	});	
	
	let postid = ${param.postid}; // 글번호
	let username = '${username}'; // 작성자(로그인 유저)
	
	loadComments(postid, username); // 댓글 목록 불러오기
	
	//댓글 추가 버튼 처리
	$('.comment-add-btn').click(function(e) {
		createComment(postid, username);
	});
	
	$('.comment-list').on('click', '.comment-update-show-btn', showUpdateComment);
		//console.log('수정 버튼 클릭!', $(this)); //this는 comment-update-show-btn 클래스 중 하나가 선택된다.
		
	// 댓글 수정, 삭제 버튼 처리 - 이벤트 버블링(이벤트 처리 위임)
	
		// 댓글 수정 확인 버튼 클릭
		$('.comment-list').on('click', '.comment-update-btn', function (e){
		const el = $(this).closest('.comment');
		updateComment(el, username);
		});
		
		// 댓글 수정 취소 버튼 클릭
		$('.comment-list').on('click', '.comment-update-cancel-btn', 
		cancelCommentUpdate);
	
		// 댓글 삭제 버튼
		$('.comment-list').on('click', '.comment-delete-btn', 
				deleteComment);
		
	/////// 답글 버튼 이벤트 핸들링
		// 답글 추가버튼 인터페이스 보이기
		$('.comment-list').on('click', '.reply-add-show-btn', function(e) {
		showReplyAdd($(this), username);
		});
		
		// 답글 추가해서 작성 후 "확인" 버튼
		$('.comment-list').on('click', '.reply-add-btn', function(e){
		addReply($(this), username);
		});
		
		// 답글 수정 화면 보이기
		$('.comment-list').on('click', '.reply-update-show-btn', function(e) {
		showUpdateReply($(this));
		});
		
		// 답글 수정 등록
		$('.comment-list').on('click', '.reply-update', function(e) {
		updateReply($(this));
		});
		
		// 답글 수정 취소
		$('.comment-list').on('click', '.reply-update-cancel', cancelReplyUpdate);

		
		// 답글 "취소"
		$('.comment-list').on('click', '.reply-add-cancel-btn', cancelReply);
		
		// 답글 삭제
		$('.comment-list').on('click', '.reply-delete-btn', deleteReply);


});

</script>

<h1 class="post-header">${board.title}</h1>

<div class="inner">

	<div class="post-zone">
		<div class="region-container">${board.region}</div>

		<h1 class="page-header">${board.title}</h1>

		<div class="writer-area">
			<div class="writer-zone">
				<i class="fas fa-user"></i> ${board.username}
			</div>
			<div class="date-zone">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" />
			</div>
		</div>

		<div class="text-right">
			<c:forEach var="file" items="${board.attaches}">
				<div class="attach-file-item">
					<a href="/board/download/${file.no}" class="file-link"> <i
						class="fa-solid fa-floppy-disk"></i> ${file.filename}
						(${file.formatSize})<br>
					</a>
				</div>
			</c:forEach>
		</div>


		<%-- 	<div class="image-panel float-left mr-3">
		<img src="${board.photoImg}" alt="게시글 이미지">

		<c:forEach var="image" items="${board.attaches}">
			<img src="${image}" alt="추가 이미지">
		</c:forEach>
	</div> --%>

		<div class="content-zone">${board.content}</div>

	</div>

	<div class="reply-zone">
		<!-- 새 댓글 작성 (작성자 아니어야 가능)-->
		<c:if test="${username != board.username}">
			<div class="bg-light p-2 rounded my-5">
				<div>${username == null ? '댓글을 작성하려면 먼저 로그인하세요' : '댓글 작성' }</div>
				<div>
					<textarea class="form-control new-comment-content" rows="3"
						${username == null ? 'disabled' : '' }></textarea>
					<div class="text-right">
						<button class="btn btn-travel btn-sm my-2 comment-add-btn"
							${username == null ? 'disabled' : '' }>
							<i class="fa-regular fa-comment"></i> 확인
						</button>
					</div>
				</div>
			</div>
		</c:if>


	<div class="mt-4">
		<div class="btn-zone">
			<a href="${cri.getLink('list')}" class="btn btn-travel list"> <i
				class="fas fa-list"></i> 목록
			</a>

			<c:if test="${username == board.username}">
				<a href="${cri.getLinkWithPostid('modify', board.postid) }"
					class="btn btn-travel modify"> <i class="far fa-edit"></i> 수정
				</a>
				<a href="#" class="btn btn-travel remove"> <i
					class="fas fa-trash-alt"></i> 삭제
				</a>
			</c:if>
		</div>
	</div>

		<div class="my-5">
			<i class="fa-regular fa-comments"></i> 댓글 목록
			<hr>
			<div class="comment-list"></div>
		</div>
	</div>


</div>


<form action="remove" method="post" name="removeForm">
	<!-- csrf 토큰 안 넣으면 404 에러 -->
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token }" /> <input type="hidden" name="postid"
		value="${board.postid}" /> <input type="hidden" name="pageNum"
		value="${cri.pageNum}" /> <input type="hidden" name="amount"
		value="${cri.amount}" /> <input type="hidden" name="type"
		value="${cri.type}" /> <input type="hidden" name="keyword"
		value="${cri.keyword}" />
</form>

<%@ include file="../../views/layouts/footer1.jsp"%>

<style>
.post-header {
	font-family: font-family : 'Spoqa Han Sans Neo', 'Sans-serif';
}

.post-zone {
	position: relative;
	margin-top: 80px;
}

.content-zone {
	position: relative;
	font-family: font-family : 'Spoqa Han Sans Neo', 'Sans-serif';
	margin-top: 20px;
}

.reply-zone {
	position: relative;
	margin-top: 20px;
}

.writer-area {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.writer-zone {
	position: relative;
	align-items: center;
	font-family: font-family : 'Spoqa Han Sans Neo', 'Sans-serif';
}

.btn-zone {
	display: flex;
	justify-content: flex-end; /* 버튼을 우측으로 정렬 */
	margin-top: 20px; /* 버튼과 다른 내용 간의 간격 조정 */
	gap: 10px; /* 버튼 간격 설정 */
}

.btn-travel {
	background-color: #15BDB1;
	color: white !important;
}

.btn-travel:hover {
	background-color: #0a7d7a;
}
</style>