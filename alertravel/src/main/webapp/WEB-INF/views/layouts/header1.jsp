<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Alertravel</title>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<!-- user-scalable 을 사용하지 않는 디바이스를 위해, maximun-scale/minimum-scale 설정을 하는 것입니다-->
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<!-- Open Graph (Facebook, Linkedin) -->
<!-- https://ourcodeworld.com/public-media/articles/articleocw-56d1a6901b773.png -->
<meta property="og:type" content="website" />
<!-- https://ogp.me/#types -->
<meta property="og:title" content="Alertravel" />
<meta property="og:description"
	content="여러분의 안전한 여행을 응원하는 Alertravel입니다." />
<meta property="og:site_name" content="Alertravel" />

<!-- twitter card (Twitter) -->
<!-- https://csharpcorner-mindcrackerinc.netdna-ssl.com/article/twitter-cards-implementation-with-websites/Images/summary_card_tweet.png -->
<meta name="twitter:card" content="summary" />
<!-- card 종류: summary, photo, player -->
<meta name="twitter:title" content="Alertravel" />
<meta name="twitter:description"
	content="여러분의 안전한 여행을 응원하는 Alertravel입니다." />


<!-- 일반적인 fabicon 설정 -->
<link rel="icon" href="img/alertravelicon.ico" />
<!-- 아이폰용 fabicon 설정 -->
<link rel="apple-touch-icon" href="/resources/img/alertravelicon.ico" />
<!-- 인터넷 익스플러오용 fabicon 설정-->
<link rel="short icon" type="image/x-icon" href="img/alertravelicon.ico" />


<link rel="stylesheet" href="/resources/css/normalize.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<!-- https://fontawesome.com/start -->
<script src="https://kit.fontawesome.com/f1def33959.js"
	crossorigin="anonymous"></script>


<!-- Spoca Han Sans Neo: https://spoqa.github.io/spoqa-han-sans/ko-KR/ -->
<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<div class="inner">
			<div class="head-container">
				<div class="head-brand">
					<a href="/"><img class="head-logo"
						src="../resources/images/AlertravelLogo.png" alt="Alertravel" /></a>
				</div>
				<div class="head-login-container">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="username"/>
						<!--로그인 된 상태-->
						<div>${username }</div>
						<div>
							<a href="#" class="head-logout"> 로그아웃 </a>
						</div>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<div>
							<a href="/security/login" class="head-login">로그인</a>
						</div>
						<div>
							<a href="/security/signup" class="head-signup">회원가입</a>
						</div>
					</sec:authorize>
				</div>
			</div>
		</div>
	</header>


	<nav
		class="navbar navbar-expand-sm navbar-color justify-content-center">
		<ul class="navbar-nav">
			<!-- Dropdown -->
			<li class="nav-item dropdown"><a class="nav-link dropdown-title"
				href="#" id="navbardrop" data-toggle="dropdown"> 해외안전정보 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Link 1</a> <a
						class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item"
						href="#">Link 3</a>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-title"
				href="#" id="navbardrop" data-toggle="dropdown"> 소통마당 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Link 1</a> <a
						class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item"
						href="#">Link 3</a>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-title"
				href="#" id="navbardrop" data-toggle="dropdown"> 편의기능 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Link 1</a> <a
						class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item"
						href="#">Link 3</a>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-title"
				href="#" id="navbardrop" data-toggle="dropdown"> 후원하기 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Link 1</a> <a
						class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item"
						href="#">Link 3</a>
				</div></li>
		</ul>
	</nav>

<form id="logoutForm" action="/security/logout" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
</form>

<script>
$(document).ready(function(){
	$('.head-logout').click(function(e){
		e.preventDefault();
		$('#logoutForm').submit();
	});
});
</script>



	