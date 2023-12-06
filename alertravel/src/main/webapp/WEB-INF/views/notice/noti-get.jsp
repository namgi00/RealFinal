<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header1.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script>
// 댓글 기본 URL 상수 - 전역 상수


	$(document).ready(async function() {
 
		$('.remove').click(function() {
			// 클릭 이벤트 핸들러 함수
			if (!confirm('정말 삭제하시겠습니까?'))
				return;
			document.forms.removeForm.submit();
		});
	});

</script>

<c:if test="${result=='success'}">
	<script>
		alert("수정이 완료되었습니다!");
	</script>
</c:if>

<section class="notice-main">
  <div class="main-container">
    <div class="inner">
      <div class="title-container">
        <div class="notice-title">공지 사항</div>
      </div>
    </div>
  </div>
</section>
<div class="inner">
	<div class="noti-title">
		${notice.noticeTitle}
	</div>
	<div class="noti-date">
		작성일: ${notice.noticeDate}
	</div>
	<div class="noti-content">
		${notice.noticeContent}
	</div>
		<a href="/notice/notice" class="btn btn-travel list" style="margin-top: 1rem;"> <i
			class="fas fa-list"></i> 목록
		</a>
		<div>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.authorities" var="authorities" />
				<c:forEach items="${authorities}" var="authority">
					<c:if test="${authority.authority eq 'ROLE_ADMIN'}">
   						<a href="${cri.getLinkWithNoticeid('noti-modify', notice.noticeNo)}" class="btn btn-travel modify" style="margin-top: 1rem;">
							<i class="far fa-edit"></i> 수정</a>
						<a href="#" class="btn btn-travel remove" style="margin-top: 1rem;"> <i class="fas fa-trash-alt"></i> 삭제</a>
					</c:if>
				</c:forEach>
			</sec:authorize>
		</div>
</div>

<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }" />
	<input type="hidden" name="noticeNo" value="${notice.noticeNo}" />
    <input type="hidden" name="pageNum" value="${cri.pageNum}" />
    <input type="hidden" name="amount" value="${cri.amount}" />
    <input type="hidden" name="type" value="${cri.type}" />
    <input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<%@ include file="../layouts/footer1.jsp"%>

<style>
.btn-travel {
	background-color: #15BDB1;
	color: white !important;
}

.btn-travel:hover {
	background-color: #0a7d7a;
}
</style>

