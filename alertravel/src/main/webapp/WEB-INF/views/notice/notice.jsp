<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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

<div class="inner" style="margin-top:4rem; margin-bottom: 4rem;"><!--  테이블 구성하기 -->
	<%@ include file="../common/search_bar.jsp"%>
	<div class="notice-row">
		<table class="notice-table">
			<thead>
				<tr class="notice-top">
					<th> 번호 </th>
					<th> 제목 </th>
					<th> 내용 </th>
					<th> 작성일</th>
 				</tr>
 			</thead>
 			<tbody>
					<c:forEach var="unit" items="${list}">
						<tr class="notice-center">
 						<td ><a href="/notice/noti-get?no=${unit.noticeNo}" style="width: 100px;">${unit.noticeNo}</a></td>
 						<td ><a href="/notice/noti-get?no=${unit.noticeNo}" style="width: 300px;">${unit.noticeTitle}</a></td>
 						<td ><a href="/notice/noti-get?no=${unit.noticeNo}" style="width: 750px;">${unit.noticeContent}</a></td>
 						<td style="width: 200px;">${unit.noticeDate}</td>
					</tr>
					</c:forEach>
 			</tbody>
			</table>
			<div style="margin-top: 2rem;">
				<sec:authorize access="isAuthenticated()">
    					<sec:authentication property="principal.authorities" var="authorities" />
    						<c:forEach items="${authorities}" var="authority">
        						<c:if test="${authority.authority eq 'ROLE_ADMIN'}">
            						<a href="/notice/noticewrite" class="btn btn-primary float-right">글쓰기</a>
        						</c:if>
    						</c:forEach>
					</sec:authorize>
			</div>
	</div>
	<%@include file="../common/pagination.jsp"%>
</div>

<%@ include file="../layouts/footer1.jsp"%>
