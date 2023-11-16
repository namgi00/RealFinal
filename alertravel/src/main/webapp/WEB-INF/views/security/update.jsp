<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header.jsp"%>
<br>
<br>
<br>
<br>


<div>
	<form:form modelAttribute="member">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<%-- 		action="/security/update?_csrf=${_csrf.token}"
		enctype="multipart/form-data" style="width:500px" class="mx-auto"> --%>

		<div class="card">
			<div class="card-header">
				<h1>
					<i class="fa-solid fa-user-pen"></i> 회원정보 수정
				</h1>
			</div>
			<div class="card-body">

				<div class="form-group">
					<form:label path="password">
						<i class="fa-solid fa-lock"></i> 변경할 비밀번호
					</form:label>
					<form:password path="password" class="form-control" />
					<form:errors path="password" cssClass="error" />
				</div>
				<div class="form-group">
					<form:label path="password2">
						<i class="fa-solid fa-lock"></i> 비밀번호 확인
					</form:label>
					<form:password path="password2" class="form-control" />
					<form:errors path="password2" cssClass="error" />
				</div>
				<div class="form-group">
					<form:label path="email">
						<i class="fa-solid fa-envelope"></i> 변경할 이메일 주소
					</form:label>
					<form:input path="email" class="form-control" />
					<form:errors path="email" cssClass="error" />
				</div>

				<button type="submit" class="btn btn-success">
					<i class="fas fa-check"></i> 확인
				</button>

				<a href="javascript:history.back()" class="btn btn-danger get">
					<i class="fas fa-file-alt"></i> 돌아가기
				</a>
			</div>
		</div>

	</form:form>
</div>

<%@ include file="../layouts/footer.jsp"%>
