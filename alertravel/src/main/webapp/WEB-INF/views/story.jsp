<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../views/layouts/header1.jsp"%>


<section class="story-main">
  <div class="main-container">
    <div class="inner">
      <div class="title-container">
        <div class="title">소통 게시판</div>
        <div class="message">
        소중한 여러분의 경험을 공유하여<br /> 다른 사람들과 소통하세요
        </div>
      </div>
    </div>
  </div>
</section>










<%@ include file="../views/layouts/footer1.jsp"%>

<style>
  .story-main {
    height: 360px;
    background-image: url('/resources/images/story-image.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    z-index: 1;
  }
</style>