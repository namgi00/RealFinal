<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>Alertravel</title>
    <meta
      name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
    />
    <!-- user-scalable 을 사용하지 않는 디바이스를 위해, maximun-scale/minimum-scale 설정을 하는 것입니다-->
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <!-- Open Graph (Facebook, Linkedin) -->
    <!-- https://ourcodeworld.com/public-media/articles/articleocw-56d1a6901b773.png -->
    <meta property="og:type" content="website" />
    <!-- https://ogp.me/#types -->
    <meta property="og:title" content="Alertravel" />
    <meta
      property="og:description"
      content="여러분의 안전한 여행을 응원하는 Alertravel입니다."
    />
    <meta property="og:site_name" content="Alertravel" />

    <!-- twitter card (Twitter) -->
    <!-- https://csharpcorner-mindcrackerinc.netdna-ssl.com/article/twitter-cards-implementation-with-websites/Images/summary_card_tweet.png -->
    <meta name="twitter:card" content="summary" />
    <!-- card 종류: summary, photo, player -->
    <meta name="twitter:title" content="Alertravel" />
    <meta
      name="twitter:description"
      content="여러분의 안전한 여행을 응원하는 Alertravel입니다."
    />
    

    <!-- 일반적인 fabicon 설정 -->
    <link rel="icon" href="img/alertravelicon.ico" />
    <!-- 아이폰용 fabicon 설정 -->
    <link rel="apple-touch-icon" href="img/alertravelicon.ico" />
    <!-- 인터넷 익스플러오용 fabicon 설정-->
    <link rel="short icon" type="image/x-icon" href="img/alertravelicon.ico" />

    
    <link rel="stylesheet" href="/resources/css/normalize.css" />
    
    <link rel="stylesheet" href="/resources/css/main.css" />
    
    <!-- https://fontawesome.com/start -->
    <script
      src="https://kit.fontawesome.com/f1def33959.js"
      crossorigin="anonymous"
    ></script>
    <!-- Spoca Han Sans Neo: https://spoqa.github.io/spoqa-han-sans/ko-KR/ -->
    <link
      href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css"
      rel="stylesheet"
      type="text/css"
    />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/style.css" />
  </head>
  <body>
    <header>
      <div class="inner">
        <div class="head-container">
          <div class="head-brand">
            <a href="#">Alertravel</a>
          </div>
          <div class="head-blog">
              여러분의 여행을 응원합니다.
          </div>
        </div>
      </div>
    </header>

    <!-- 메인 이미지 섹션 -->
    <section class="main">
      <div class="main-container">
        <div class="inner">
          <div class="title-container">
            <div class="title">안전한 여행</div>
            <div class="message">
              해외국가의 단계별 여행 경보를 알려드립니다.<br />
              여러분의 여행 발자취를<br />
              이곳에 남기어 같이 공유해주세요.<br />
            </div>
          </div>
        </div>
      </div>
    </section>
    <section>
      <div class="inner">
        <div class="skill-container">
          <div class="skill">
            <i class="fas fa-info skill-icon"></i>
            <div class="skill-title">
              <div class="skill-name">해외안전정보</div>
            </div>
          </div>
          <div class="skill">
            <i class="fas fa-comments skill-icon"></i>
            <div class="skill-title">
              <div class="skill-name">소통마당</div>
            </div>
          </div>
          <div class="skill">
            <i class="fas fa-route skill-icon"></i>
            <div class="skill-title">
              <div class="skill-name">편의기능</div>
            </div>
          </div>
          <div class="skill">
            <i class="fas fa-money-check skill-icon"></i>
            <div class="skill-title">
              <div class="skill-name">후원하기</div>
            </div>
          </div>
        </div>
      </div>
    </section>