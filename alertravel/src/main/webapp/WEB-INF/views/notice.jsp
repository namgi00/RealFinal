<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../views/layouts/header1.jsp"%>


<section class="notice-main">
  <div class="main-container">
    <div class="inner">
      <div class="title-container">
        <div class="notice-title">공지 사항</div>
      </div>
    </div>
  </div>
</section>










<%@ include file="../views/layouts/footer1.jsp"%>

<style>
  .notice-main {
    height: 360px;
    background-image: url('/resources/images/notice-image.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    z-index: 1;
  }
  .notice-title{
  font-size: 50px;
	font-weight: bold;
	color: #fff;
	padding-top:3rem;
  }
</style>