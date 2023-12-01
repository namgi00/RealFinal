<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../../views/layouts/header1.jsp"%>

<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.min.css">
<script src="/resources/js/summernote/summernote-lite.min.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.min.js"></script>
<script src="/resources/js/rest.js"></script>

<script>
$(document).ready(function() {
	$('#content').summernote({
		height: 300,    // 에디터 높이
		lang: "ko-KR",	// 한글 설정
	});
	
	//파일 업로드 목록 - html로 해야 함
	const attaches = $('[name="files"]'); 
	const attachList = $('#attach-list');
	
	attaches.change(function (e) {
		let fileList = '';
		for(let file of this.files) {
			let fileStr = `
			<div>
				<i class="fa-solid fa-file"></i> 
				\${file.name}(\${file.size.formatBytes()})
			</div>`;
			fileList += fileStr;
		}
		attachList.html(fileList);
	});
});
</script>

<h1 class="page-header">
	<i class="far fa-edit"></i> 글쓰기
</h1>

<div class="panel panel-default">

	<div class="panel-body">
		<form:form modelAttribute="board" role="form"
			action="?_csrf=${_csrf.token}" enctype="multipart/form-data">
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<form:hidden path="postid"/> --%>
			<form:hidden path="username" value="${username}" />

			<div class="form-group">
				<label for="region">지역</label> <select id="region"
					name="region" class="form-control">
					<option value="">--대륙을 선택하세요--</option>
					<option value="아프리카">아프리카</option>
					<option value="아시아">아시아</option>
					<option value="유럽">유럽</option>
					<option value="남미">남미</option>
					<option value="북미">북미</option>
					<option value="오세아니아">오세아니아</option>
					<option value="중동">중동</option>
					<!-- 기타 region 옵션들 추가 -->
				</select>
			</div>

			<div class="form-group">
				<form:label path="title">제목</form:label>
				<form:input path="title" cssClass="form-control" />
				<form:errors path="title" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="attaches">첨부파일</label>
				<div id="attach-list" class="my-1"></div>
				<input type="file" class="form-control" multiple name="files" />
			</div>

			<div class="form-group">
				<form:label path="username">작성자</form:label>
				${username}
				<form:errors path="username" cssClass="error" />
			</div>


			<div class="form-group">
				<form:label path="content">내용</form:label>
				<form:textarea path="content" class="form-control"></form:textarea>
				<form:errors path="content" cssClass="error" />
			</div>

			<button type="submit" class="btn btn-primary list">
				<i class="fas fa-check"></i> 확인
			</button>
			<button type="reset" class="btn btn-primary">
				<i class="fas fa-undo"></i> 취소
			</button>
			<a href="javascript:history.back()" class="btn btn-primary"> <i
				class="fas fa-list"></i> 목록
			</a>
		</form:form>
	</div>
</div>






<%@ include file="../../views/layouts/footer1.jsp"%>