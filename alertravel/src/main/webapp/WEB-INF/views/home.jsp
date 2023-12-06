<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="sec"%>
<%@ page session="false"%>
<%@ include file="../views/layouts/header1.jsp"%>
<!-- 웹폰트 적용 스포카 한산스-->
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
    rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/exchange.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<!-- jQuery -->
<script src="resources/js/exchange/jquery.min.js"></script>
<!-- Owl Carousel JS -->
<script src="resources/js/exchange/owl.carousel.min.js"></script>
<script src="resources/js/exchange/jquery.mousewheel.min.js"></script>
<script src="resources/js/exchange/owl.navigation.js"></script>
<!-- Map Check box JS -->
<script src="resources/js/mapcheck.js"></script>
<!-- 이스터에그 -->
<script src="resources/js/alertravel.js"></script>


<section class="main" id="introImgContainer">
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
<div class="inner">
    <div class="map-check">
        <p class="level-title" style="text-align: center;">여행경보 세계지도</p>
            <label for="case1" class="checkbox-label1">
            <i class="fa-solid fa-circle" style="color: #2c98ca;"></i>
            1단계(여행유의)
            <input type="checkbox" id="case1" name="alarm" value="case1" checked>
        </label>
        <label for="case2" class="checkbox-label2">
            <i class="fa-solid fa-circle" style="color: #f4b22f;"></i>
            2단계(여행자제)
            <input type="checkbox" id="case2" name="alarm" value="case2" checked>
        </label>
        <label for="case3" class="checkbox-label3">
            <i class="fa-solid fa-circle" style="color: #e14c55;"></i>
            3단계(출국권고)
            <input type="checkbox" id="case3" name="alarm" value="case3" checked>
        </label>
        <label for="case4" class="checkbox-label4">
            <i class="fa-solid fa-circle" style="color: #575757;"></i>
            4단계(여행금지)
            <input type="checkbox" id="case4" name="alarm" value="case4" checked>
        </label>
    </div>
    
    <div id="map">
        <%@ include file="country/map.jsp"%>
    </div>
    <div class="map-remark-message" 
    style="text-align: right;
            font-family: 'Spoqa Han Sans Neo', 'Sans-serif';
            margin-top: 5px;
    ">💡외교부에서 여행경보단계 정보를 제공하지 않는 국가 및 대한민국은 흰색으로 표시됩니다. ‖ 경보단계는 같은 국가내에서도 지역에 따라 다를 수 있습니다. </div>
</div>
<div class="inner">
    <div class="inner2"> <!-- 여기다가 수평 정렬로 추천여행지랑 공지사항 넣기 -->
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
                        </div>
                    </li>
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
                        </div>
                    </li>
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
                        </div>
                    </li>
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
                        </div>
                    </li>
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
                            </div>
                        </div>
                    </li>
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
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div> 
        <!-- 공지사항 시작하기 -->
            <div class="card-banner-notice">
                <div class="roadmap-title"><a href="/notice/notice">공지사항</a></div>
                <div class="notice-home">
                    <c:forEach var="unit" items="${noticeList}" begin="0" end="5" step="1">
                        <div class="notice-home-banner">
                            <a href="/notice/noti-get?no=${unit.noticeNo}" style="width: 300px;">※ ${unit.noticeTitle}</a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<c:set var="krw" value="KRW" />
<div class="inner">
<div class=" exchange-title">환율 정보</div>
    <div class="owl-carousel owl-theme">
        <c:forEach var="unit" items="${lists}">
            <c:choose>
                <c:when test="${unit.cur_unit eq krw}">
    
                </c:when>
                <c:otherwise>
                    <div class="exchange-item">
                        <div class="image-caption">
                            <img src="resources/images/nation/${unit.cur_unit}.png" >
                        </div>
                        <div class="nm-text">
                            ${unit.cur_nm}
                        </div>
                        <div class="unit-text">
                            ${unit.cur_unit}
                        </div>
                        <div class="tts-text">
                            ${unit.tts}원  
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
    <div class="ex-text">
        *주말(토요일/일요일)은 전주 금요일의 환율로 측정됩니다.<br>
        *당일 오전 11시 이전까지는 전일 환율로 측정됩니다.
    </div>
</div>
<hr>
<br>
<%@ include file="../views/layouts/footer1.jsp"%>
<!-- <script>
    var imgArray = [
    "../resources/images/newmain.jpg",
    "../resources/images/newmain1.png",
    "../resources/images/newmain2.png",
    "../resources/images/newmain3.png"
  ];
  function showImage() {
    var imgNum = Math.floor(Math.random() * imgArray.length);
    var imageUrl = imgArray[imgNum];
    // Set the background image of the main container
    var mainContainer = document.getElementById("introImgContainer");
    mainContainer.style.backgroundImage = 'url("' + imageUrl + '")';
  }
  // Call the showImage function to display a random image initially
  showImage();
</script> -->

<script>
  var imgArray = [
    "../resources/images/newmain.jpg",
    "../resources/images/newmain1.png",
    "../resources/images/newmain2.png",
    "../resources/images/newmain3.png"
  ];

  var currentImageIndex = 0;
  var intervalTime = 5000; // 이미지 변경 주기를 5초로 설정 (단위: 밀리초)

  function showImage() {
    var imageUrl = imgArray[currentImageIndex];

    // Set the background image of the main container with fade-in fade-out transition
    var mainContainer = document.getElementById("introImgContainer");

    // Fade-out 효과 적용
    mainContainer.style.opacity = 0;

    setTimeout(function () {
      // 이미지 변경 및 Fade-in 효과 적용
      mainContainer.style.backgroundImage = 'url("' + imageUrl + '")';
      mainContainer.style.opacity = 1;
    }, 1000); // 1초 후에 이미지 변경 및 Fade-in 효과 적용 (속도 조절)

    // 새로운 이미지 인덱스로 업데이트
    currentImageIndex = (currentImageIndex + 1) % imgArray.length;
  }

  // 주기적으로 showImage 함수를 호출하여 이미지 변경
  setInterval(showImage, intervalTime);

  // 페이지 로딩 시 초기 이미지 표시
  showImage();
</script>

<script>
    $(document).ready(function() {
        $('.owl-carousel').owlCarousel({
            items : 6,
            responsive: {
                0: { items: 1 },// 뷰포트 폭이 0px 이상일 때, 1개의 아이템을 보여줌
                860: { items: 2 },
                1060: { items: 3 },
                1300: { items: 4 },
                1550: { items: 5 },
                1720: { items: 6 },
            },
            loop : true,
            margin : 20,
            autoplay : true,
            autoplayTimeout : 3000,
            autoplayHoverPause : true,
            mouseDrag : true
        });
    });
</script>
<script>
    $(document).ready(function () {
      $('.exchange-item').on('mousedown', function () {
        // 클릭 시 cursor 속성 직접 변경
        $(this).css('cursor', 'grabbing');
        // 클릭 종료 시 cursor 속성 원래대로 변경
        $(document).on('mouseup', function endGrabbing() {
          $('.exchange-item').css('cursor', 'grab');
          $(document).off('mouseup', endGrabbing);
        });
      });
    });
  </script>