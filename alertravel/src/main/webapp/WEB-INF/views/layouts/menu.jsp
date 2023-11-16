<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<nav class="navbar navbar-expand-md navbar-dark sticky-top" style="background: #8E6D65">
	<a class="navbar-brand" href="/">
		<i class="fa-solid fa-house"></i>
		메인 화면
	</a>
	
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
		
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<!-- 좌측 메뉴 -->
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="/donate/donate">
					<i class="fa-solid fa-screwdriver-wrench"></i> 후원하기
				</a>
			</li>
		</ul>
		
		<!-- 우측 메뉴 -->
		<ul class="navbar-nav ml-auto">
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="username" />
				<!-- 로그인한 상태 -->
				<li class="nav-item">
					<a class="nav-link" href="/security/profile">
						<img src="/resources/images/mainecoon.jpg" class="avatar-sm" />
						<sec:authentication property="principal.username" />
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link logout-link" href="#">
						<i class="fa-solid fa-right-from-bracket"></i> 로그아웃
					</a>
				</li>
			</sec:authorize>
			
			<!-- 로그아웃된 상태 -->
			<sec:authorize access="isAnonymous()">
				<i class="nav-item">
					<a class="nav-link" href="/security/login">
						<i class="fa-solid fa-right-from-bracket"></i> 로그인
					</a>
				</i>
				<li class="nav-item">
					<a class="nav-link" href="/security/signup">
						<i class="fa-solid fa-user-plus"></i> 회원가입
					</a>
				</li>
			</sec:authorize>
		</ul>
	</div>
</nav>

<!-- 로그아웃 Form -->
<form id="logoutForm" action="/security/logout" method="post" >
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<script>
$(document).ready(function() {
	$('.logout-link').click(function(e) {
		e.preventDefault();
		$('#logoutForm').submit();
	});
});
</script>