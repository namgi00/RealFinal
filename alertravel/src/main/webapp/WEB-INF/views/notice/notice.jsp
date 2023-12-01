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
 					<c:forEach var="unit" items="${noticeList}">
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
					<a href="/notice/noticewrite" class="btn btn-primary float-right" >글쓰기</a>
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
