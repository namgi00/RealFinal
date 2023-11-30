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
 					<c:forEach var="unit" items="${noticeList}">
 						<tr>
	 						<td >${unit.noticeNo}</td>
	 						<td >${unit.noticeTitle}</td>
	 						<td >${unit.noticeContent}</td>
	 						<td >${unit.noticeDate}</td>
						</tr>
 					</c:forEach>
	 			</tbody>
				</table>
				
				<a href="/notice/noticewrite" class="btn btn-primary">글쓰기</a>
				<!-- pagination{s} -->	
				<div id="paginationBox">
					<ul class="pagination">			
						<c:if test="${pagination.prev}">				
							<li class="page-item">
								<a class="page-link" href="#" onClick="fn_prev('${pagination.page}',
								 '${pagination.range}',
								  '${pagination.rangeSize}')">Previous</a>
							</li>			
					  	</c:if>							
				  		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				  			<li class="page-item 
				  				<c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
				  					<a class="page-link" href="#" onClick="fn_pagination('${idx}',
				  					 '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
		  					 </li>			
	  					 </c:forEach>
	  					 	<c:if test="${pagination.next}">
	  					 		<li class="page-item">
	  					 			<a class="page-link" href="#" onClick="fn_next('${pagination.range}',
	  					 			 '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
  					 			</li>	
  					 		</c:if>
				 	</ul>
				</div>
				<!-- pagination{e} -->	 	
			</div>
		</div>
</div>

<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {	
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/notice/notice"; 
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
		}
	
	  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/notice/notice";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
		}
	
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/notice/notice";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
		}
	</script>










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