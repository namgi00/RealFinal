<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header1.jsp"%>

<div class="signup">
	
	<form:form modelAttribute="member"
		action="/security/signup?_csrf=${_csrf.token}"
		enctype="multipart/form-data" style="width:500px" class="mx-auto">

		<div class="form-group">
			<form:label path="username">
				<i class="fa-solid fa-user"></i> 아이디</form:label>
			<form:input path="username" class="form-control" />
			<form:errors path="username" cssClass="error"></form:errors>
		</div>
		<div class="form-group">
			<form:label path="password">
				<i class="fa-solid fa-lock"></i> 비밀번호</form:label>
			<form:password path="password" class="form-control" />
			<form:errors path="password" cssClass="error" />
		</div>
		<div class="form-group">
			<form:label path="password2">
				<i class="fa-solid fa-lock"></i> 비밀번호 확인</form:label>
			<form:password path="password2" class="form-control" />
			<form:errors path="password2" cssClass="error" />
		</div>
		<div class="form-group">
			<form:label path="email">
				<i class="fa-solid fa-envelope"></i> 이메일 주소</form:label>
			<form:input path="email" class="form-control" />
			<form:errors path="email" cssClass="error" />
		</div>

		<hr>

		<div class="button-container">
			<button type="submit" class="btn btn-primary">
				<i class="fas fa-check"> 가입</i>
			</button>
			<button type="reset" class="btn btn-warning">
				<i class="fas fa-undo"></i> 재작성
			</button>
			<a href="javascript:history.back()" class="btn btn-danger"> <i
				class="fa-solid fa-ban"></i> 가입 취소
			</a>
		</div>
	</form:form>
</div>



<%@ include file="../layouts/footer1.jsp"%>