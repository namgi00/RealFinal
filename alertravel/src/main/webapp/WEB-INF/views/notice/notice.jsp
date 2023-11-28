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
<div class="inner"><!--  테이블 구성하기 -->
	<div class="notice-container">
		<div class="notice-row">
			<table class="table" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;"> 번호 </th>
						<th style="background-color: #eeeeee; text-align:center;"> 제목 </th>
						<th style="background-color: #eeeeee; text-align:center;"> 작성자 </th>
						<th style="background-color: #eeeeee; text-align:center;"> 작성일</th>
	 				</tr>
	 			</thead>
	 			<tbody>
	 				<tr>
	 					<td> 1 </td>
	 					<td> 안녕하세요 </td>
	 					<td> 홍길동 </td>
	 					<td> 11.28 </td>
					</tr>
	 			</tbody>
				</table>
				<a href="/notice/noticewrite" class="btn btn-primary">글쓰기</a>
			</div>
		</div>
</div>










<%@ include file="../layouts/footer1.jsp"%>

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