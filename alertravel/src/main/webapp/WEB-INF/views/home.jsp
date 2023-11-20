<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>

<%@ include file="../views/layouts/header1.jsp"%>

<style>
#backtotop {
	background-color: rgb(47, 48, 89);
	width: 40px;
	height: 40px;
	text-align: center;
	border-radius: 20px;
	position: fixed;
	bottom: 30px;
	right: 30px;
	transition-property: background-color, opacity, visibility;
	transition-duration: 0.3s, 0.5s, 0.5s;
	opacity: 0;
	visibility: hidden;
	z-index: 999;
}

/* 아이콘 적용 방법
  1. ::after (요소 뒤에 content 추가) 가상 요소에서,
  2. content: "폰트어썸 유니코드" 를 넣고,
  3. font-family: FontAwesome 이라고 넣으면 됨
  */
#backtotop::after {
	content: "\f077";
	font-family: FontAwesome;
	font-size: 1.5rem;
	line-height: 40px;
	color: #fff;
}

#backtotop.show:hover {
	cursor: pointer;
	background-color: #2186c4;
}

#backtotop.show {
	opacity: 1;
	visibility: visible;
	background-color: rgb(47, 48, 49);
}

.card-banner {
	width: 800px;
	height: 100%;
	margin: 0 auto;
	padding: 0rem 2rem;
	overflow: hidden;
}
</style>



<section class="main">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">안전한 여행</div>
				<div class="message">
					해외국가의 단계별 여행 경보를 알려드립니다.<br /> 여러분의 여행 발자취를<br /> 이곳에 남기어 같이
					공유해주세요.<br />
				</div>
			</div>
		</div>
	</div>
</section>

<div id="map" class="inner">
	<%@ include file="country/map.jsp"%>
</div>

<div class="card-banner">
	<div class="roadmap-container">
		<div class="roadmap-title-container">
			<div class="roadmap-title">추천 여행지</div>
			<div class="arrow-container">
				<i class="fas fa-chevron-circle-left slide-prev"></i> <i
					class="fas fa-chevron-circle-right slide-next"></i>
			</div>
		</div>
		<!-- HTML5 에서는 태그에 확장처리를 위한 속성으로 data-* 속성 추가
            data-변수이름=변수값 으로 정의하고, JS 등에서 활용 가능
          -->
		<ul class="class-list" data-position="0">
			<li class="class-card"><img
				src="../resources/images/Gaeseonmoon.png" class="class-image" />

				<div class="class-container">
					<div class="class-skill">
						<div class="class-type">프랑스</div>
						<div class="class-format">유럽</div>
					</div>
					<div class="class-desc">
						<div class="class-title">개선문</div>
						<div class="class-detail">개선문은 프랑스 역사를 대표하는 상징적 건축물이다.</div>
					</div>
				</div></li>
			<li class="class-card"><img
				src="../resources/images/vangoumeseum.png" class="class-image" />

				<div class="class-container">
					<div class="class-skill">
						<div class="class-type">네덜란드</div>
						<div class="class-format">유럽</div>
					</div>
					<div class="class-desc">
						<div class="class-title">반 고흐 미술관</div>
						<div class="class-detail">반 고흐 미술관(VanGoghMuseum)은 네덜란드
							암스테르담에 위치한 미술관으로서, 네덜란드를 대표하는 19세기 신인상파 화가 빈센트 반 고흐의 작품들을 주로 전시하고
							있다.</div>
					</div>
				</div></li>
			<li class="class-card"><img
				src="../resources/images/tokyosky.png" class="class-image" />

				<div class="class-container">
					<div class="class-skill">
						<div class="class-type">일본</div>
						<div class="class-format">아시아</div>
					</div>
					<div class="class-desc">
						<div class="class-title">도쿄 스카이트리</div>
						<div class="class-detail">일본 도쿄도 스미다구에 있는 전파 송출용 탑이자 일본에서 가장
							높은 구조물로, 도쿄의 랜드마크이다.</div>
					</div>
				</div></li>
			<li class="class-card"><img
				src="../resources/images/centralpark.png" class="class-image" />

				<div class="class-container">
					<div class="class-skill">
						<div class="class-type">미국</div>
						<div class="class-format">아메리카</div>
					</div>
					<div class="class-desc">
						<div class="class-title">뉴욕 센트럴 파크</div>
						<div class="class-detail">샌프란시스코의 골든 게이트 파크와 함께 미국 최대 규모의
							공원으로 손꼽힌다.</div>
					</div>
				</div></li>
			<li class="class-card"><img src="../resources/images/quoka.png"
				class="class-image" />
				<div class="class-container">
					<div class="class-skill">
						<div class="class-type">호주</div>
						<div class="class-format">오세아니아</div>
					</div>
					<div class="class-desc">
						<div class="class-title">로트네스트 아일랜드</div>
						<div class="class-detail">세상에서 가장 행복한 동물인 쿼카가 사는 서식지로 유명한
							곳이다. 해당 섬의 이름은 쿼카를 보고 쥐가 많이 산다고 하여 쥐의 소굴 'Rats nest'에서 유래했다.</div>
					</div></li>
			<li class="class-card"><img
				src="../resources/images/chiangmai.png" class="class-image" />
				<div class="class-container">
					<div class="class-skill">
						<div class="class-type">방콕</div>
						<div class="class-format">동남아시아</div>
					</div>
					<div class="class-desc">
						<div class="class-title">치앙마이</div>
						<div class="class-detail">치앙마이는 태국 북부에서 가장 크고 문화적으로 중요한 도시이며
							태국에서 두 번째로 큰 도시이자 치앙마이 주의 주도이다.</div>
					</div>
				</div></li>
		</ul>
	</div>
</div>

<%@ include file="../views/layouts/footer1.jsp"%>
