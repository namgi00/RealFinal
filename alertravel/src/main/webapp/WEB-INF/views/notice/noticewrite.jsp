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
        <div class="notice-title">글 작성</div>
      </div>
    </div>
  </div>
</section>
<div class="inner"><!--  테이블 구성하기 -->
	<div class="notice-container">
		<div class="notice-row"> 
			<form method="get" action="/notice/noticewrite2">
				<table class="table" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align:center;">글쓰기 양식 </th>
	 				</tr>
	 			</thead>
	 			<tbody>
	 				<tr>
	 					<td> <input type="text" class="form-control" placeholder="글 제목"  name="noticeTitle" maxlength="50"></td>
 					</tr>
 					<tr>
	 					<td> <textarea class="form-control" placeholder="글 내용"  name="noticeContent" style="height: 350px;"></textarea></td>
					</tr>
	 			</tbody> 
				</table>
				<input type="submit" class="btn btn-primary" value="글쓰기">
			</form>
			</div>
		</div>
</div>

<%@ include file="../layouts/footer1.jsp"%>