<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header1.jsp"%>

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

		<img alt="카카오로그인"
			src="../resources/images/kakao_login_medium_wide.png"
			onclick="loginWithKakao()">
		<button type="submit" class="btn btn-info btn-block">
			<i class="fa-solid fa-right-to-bracket"></i> 로그인
		</button>

		<button type="submit" class="btn btn-info btn-block">
			<i class="fas fa-user-plus"></i> 회원가입
		</button>
	</form>
</div>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        Kakao.init('b66fbde391b88480d9050ef5798db4ee');
        Kakao.isInitialized();
    });

    function loginWithKakao() {
        Kakao.Auth.authorize({ 
        redirectUri: 'http://localhost:8080/security/login'; 
        }); // 등록한 리다이렉트uri 입력
    }
</script>


<%@ include file="../layouts/footer1.jsp"%>