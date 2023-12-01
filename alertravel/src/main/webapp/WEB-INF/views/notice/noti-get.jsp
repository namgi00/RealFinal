<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header1.jsp"%>


<section class="notice-main">
  <div class="main-container">
    <div class="inner">
      <div class="title-container">
        <div class="notice-title">공지 사항</div>
      </div>
    </div>
  </div>
</section>
<div class="inner">
	<div class="noti-title">
		${noticeNo.noticeTitle}
	</div>
	<div class="noti-date">
		작성일: ${noticeNo.noticeDate}
	</div>
	<div class="noti-content">
		${noticeNo.noticeContent}
	</div>
	
		<a href="/notice/notice" class="btn btn-primary list" style="margin-top: 1rem;"> <i
			class="fas fa-list"></i> 목록
		</a>
</div>


<%@ include file="../layouts/footer1.jsp"%>

