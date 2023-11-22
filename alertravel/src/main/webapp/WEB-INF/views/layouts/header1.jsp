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
<meta name="google-signin-client_id"
	content="155152759107-l9l3rvt9bfc4r88di8eo2gq8aep7s2j6.apps.googleusercontent.com">

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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

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
						<sec:authentication property="principal.username" var="username" />
						<!--로그인 된 상태-->
						<div>
							<a href="/security/profile"> ${username} </a>
						</div>
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


	<!-- 메뉴바와 관련된 코드입니다. -->
	<nav class="navbar navbar-expand-sm navbar-color">
		<ul class="navbar-nav">
			<!-- Dropdown -->
			<li class="nav-item dropdown"><a class="nav-link dropdown-title"
				href="#" id="navbardrop" data-toggle="dropdown"> 해외안전정보 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/alarm/list">단계별 여행 경보</a> <a
						class="dropdown-item" href="#">공지사항</a>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-title"
				href="#" id="navbardrop" data-toggle="dropdown"> 소통마당 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">소통 게시판</a>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-title"
				href="#" id="navbardrop" data-toggle="dropdown"> 편의기능 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item"
						href="https://www.passport.go.kr/home/kor/main.do">여권 분실 시 <i
						class="fa-solid fa-up-right-from-square"></i>
					</a> <a class="dropdown-item"
						href="https://www.0404.go.kr/callcenter/callcenter_intro.jsp">영사콜
						센터 <i class="fa-solid fa-up-right-from-square"></i>
					</a>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-title"
				href="#" id="navbardrop" data-toggle="dropdown"> 후원하기 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/donate/donate">따뜻한 마음 나누기</a>
				</div></li>
		</ul>
	</nav>



	<!-- 로그아웃과 관련된 코드입니다. -->
	<form id="logoutForm" action="/security/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />
	</form>

	<script>
		$(document).ready(function() {
			$('.head-logout').click(function(e) {
				e.preventDefault();
				$('#logoutForm').submit();
			});
		});
	</script>
	
	<!-- 네비게이션 바 hover 관련 코드입니다. -->
	<script>
		var $dropdown = $(".navbar-nav .dropdown");
		var $dropdownToggle = $(".dropdown-toggle");
		var $dropdownMenu = $(".dropdown-menu");
		var showClass = "show";
		$(window).on("load resize", function() {
			if (this.matchMedia("(min-width: 768px)").matches) {
				$dropdown.hover(function() {
					var $this = $(this);
					$this.addClass(showClass);
					$this.find($dropdownToggle).attr("aria-expanded", "true");
					$this.find($dropdownMenu).addClass(showClass);
				}, function() {
					var $this = $(this);
					$this.removeClass(showClass);
					$this.find($dropdownToggle).attr("aria-expanded", "false");
					$this.find($dropdownMenu).removeClass(showClass);
				});
			} else {
				$dropdown.off("mouseenter mouseleave");
			}
		});
	</script>