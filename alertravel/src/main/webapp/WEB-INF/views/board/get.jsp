<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../../views/layouts/header1.jsp"%>

<h1 class="post-header">${board.title}</h1>

<div class="clearfix">

	<div class="region-container">${board.region}</div>
	<div class="image-panel float-left mr-3">
		<img src="${board.photoImg}" alt="게시글 이미지">

		<c:forEach var="image" items="${board.additionalImages}">
			<img src="${image}" alt="추가 이미지">
		</c:forEach>
	</div>
</div>
${board.content}



<!-- 새 댓글 작성 (작성자 아니어야 가능)-->
<c:if test="${username != board.postid }">
	<div class="bg-light p-2 rounded my-5">
		<div>${username == null ? '댓글을 작성하려면 먼저 로그인하세요' : '댓글 작성' }</div>
		<div>
			<textarea class="form-control new-comment-content" rows="3"
				${username == null ? 'disabled' : '' }></textarea>
			<div class="text-right">
				<button class="btn btn-primary btn-sm my-2 comment-add-btn"
					${username == null ? 'disabled' : '' }>
					<i class="fa-regular fa-comment"></i> 확인
				</button>
			</div>
		</div>
	</div>
</c:if>


<div class="my-5">
	<i class="fa-regular fa-comments"></i> 댓글 목록
	<hr>
	<div class="comment-list"></div>
</div>


<div class="mt-4">
	<a href="${cri.getLink('list')}" class="btn btn-primary list"> <i
		class="fas fa-list"></i> 목록
	</a>

	<c:if test="${username == board.postid}">
		<a href="${cri.getLinkWithPostid('modify', board.postid) }"
			class="btn btn-primary modify"> <i class="far fa-edit"></i> 수정
		</a>
		<a href="#" class="btn btn-danger remove"> <i
			class="fas fa-trash-alt"></i> 삭제
		</a>
	</c:if>
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