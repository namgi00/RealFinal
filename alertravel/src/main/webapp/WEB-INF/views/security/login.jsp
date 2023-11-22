<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header1.jsp"%>

<style>
.btn-kakao {
	background-color: #FEE502;
}
</style>

<div style="width: 500px" class="mx-auto login-container">
	<h2 class="my-5 login-main-title">
		<img src="../resources/images/AlertravelMainLogo.png" />여행자들과 소통하세요
	</h2>

	<c:if test="${param.error == 'true'}">
		<div class="error">아이디 또는 비밀번호가 일치하지 않습니다.</div>
	</c:if>
	<c:if test="${param.error == 'login_required'}">
		<div class="error">로그인이 필요한 페이지입니다.</div>
	</c:if>

	<br>

	<form action="/security/login" method='POST'>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<div class="form-group">
			<label for="username"><i class="fas fa-user"></i> 아이디</label> <input
				type="text" name="username" id="username" class="form-control" />
		</div>
		<div class="form-group">
			<label for="password"><i class="fas fa-key"></i> 비밀번호</i></label> <input
				type="password" name="password" id="password" class="form-control" />
		</div>
		<div class="form-group" style="margin-left: 20px">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember-me" /> 로그인
				상태 유지
			</label>
		</div>

		<button type="button" class="btn btn-kakao btn-block"
			onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=d1d68ccbc76688be2f03c65d1ea07a31&redirect_uri=http://localhost:8080/security/kakao&response_type=code'">
			<i class="fa-solid fa-comment" style="color: #423630"></i> 카카오 로그인
		</button>

		<button type="submit" class="btn btn-info btn-block">
			<i class="fa-solid fa-right-to-bracket"></i> 로그인
		</button>

		<button type="submit" class="btn btn-info btn-block">
			<i class="fas fa-user-plus"></i> 회원가입
		</button>
	</form>
</div>


<%@ include file="../layouts/footer1.jsp"%>