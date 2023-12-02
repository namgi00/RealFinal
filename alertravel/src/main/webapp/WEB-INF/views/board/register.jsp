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
		height: 400,// 에디터 높이
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

//취소 버튼 누를 경우
function confirmNavigate(action) {
    if (action === 'cancel') {
        const confirmed = confirm("작성을 취소하고 목록으로 돌아가시겠습니까?");
        if (confirmed) {
            window.history.back();
        }
    }
}
</script>

<div class="inner">
	<div class="register-area">

		<div class="register-header">
			<h1 class="page-header">
				<!-- <i class="far fa-edit"></i> --> 🍃&nbsp; 여행기 작성 &nbsp;🍃
			</h1>
			<h5 class="sub-register-header"> 생생한 여행 후기를 작성하여 공유해 주세요!
			</h5>
		</div>

		<div class="panel panel-default">

			<div class="panel-body">
				<form:form modelAttribute="board" role="form"
					action="?_csrf=${_csrf.token}" enctype="multipart/form-data">
					<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<form:hidden path="postid"/> --%>
					<form:hidden path="username" value="${username}" />

					
						<div class="form-group">
							<label for="region" style="display: inline-block; width: 80px;">지역</label>
							<select id="region" name="region" class="form-control-register">
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

						<label for="title" style="display: inline-block; width: 80px;">제목</label>
						<input type="text" id="title" name="title"
							class="form-control-register">
						<form:errors path="title" cssClass="error" />

					</div>
					<div class="form-group">
						<label for="attaches" style="display: inline-block; width: 80px;">첨부파일</label>
						<div id="attach-list" class="my-1"></div>
						<input type="file" class="form-control-register" multiple
							name="files">
					</div>

					<div class="form-group">
						<form:label path="username">작성자</form:label>
						${username}
						<form:errors path="username" cssClass="error" />
					</div>


					<div class="form-group">
						<%-- <form:label path="content">내용</form:label> --%>
						<form:textarea path="content" class="form-control"></form:textarea>
						<form:errors path="content" cssClass="error" />
					</div>

				<div class="btn-zone">
					<button type="submit" class="btn btn-travel list">
						<i class="fas fa-check"></i> 완료
					</button>
					
					 <a href="javascript:confirmNavigate('cancel')" class="btn btn-travel">
    					<i class="fas fa-undo"></i> 취소
					</a>
					
					<a href="javascript:history.back()" class="btn btn-travel"> <i
						class="fas fa-list"></i> 목록
					</a>
				</div>
				</form:form>
			</div>
		</div>

	</div>

</div>

<style>
.register-area {
    display: flex;
    justify-content: center; /* 요소들을 수평으로 가운데 정렬 */
    align-items: center; /* 요소들을 수직으로 가운데 정렬 */
    height: 100vh; /* 화면 높이에 맞게 설정 */
    flex-direction: column; /* 내부 요소들을 수직으로 배치 */
}

.register-header {
    font-family: 'Spoqa Han Sans Neo', 'Sans-serif';
    text-align: center; /* 페이지 헤더 가운데 정렬 스타일 */
}

.sub-register-header{
	font-size: 18px;
	color: #959795;
	margin-top: 15px;

}

.form-control-register {
	display: inline-block;
	width: calc(100% - 80px);
	max-width: 800px;
}

.panel-body{
	margin-top: 60px;
}

.form-group {
	display: flex;
	align-items: center;
}

.input-field {
	flex: 1;
}

.error {
	color: red;
	font-size: 12px;
}

.btn-zone {
	display: flex;
    justify-content: flex-end; /* 버튼을 우측으로 정렬 */
    margin-top: 20px; /* 버튼과 다른 내용 간의 간격 조정 */
    gap: 10px; /* 버튼 간격 설정 */
}

.btn-travel{
	background-color: #15BDB1;
	color: white !important;
}

.btn-travel:hover {
    background-color: #0a7d7a;
    
}


</style>

<%@ include file="../../views/layouts/footer1.jsp"%>