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
        <div class="notice-title">공지사항 작성</div>
      </div>
    </div>
  </div>
</section>
<div class="inner"><!--  테이블 구성하기 -->

	<div class="panel panel-default">
		<div class="panel-body">
			<form:form modelAttribute="notice" role="form"
				action="?_csrf=${_csrf.token}">
				
				<input type="hidden" name="noticeNo" value="${notice.noticeNo}" />
				<input type="hidden" name="pageNum" value="${cri.pageNum}" />
				<input type="hidden" name="amount" value="${cri.amount}" />
				<input type="hidden" name="type" value="${cri.type}" />
				<input type="hidden" name="keyword" value="${cri.keyword}" />



				<div class="form-group" style=" font-weight: bold; font-size: 30px; margin-top: 4rem;">
					<form:label path="noticeTitle">제목</form:label>
					<form:input path="noticeTitle" cssClass="form-control" style="height: 50px;"/>
					<form:errors path="noticeTitle" cssClass="error" />
				</div>



				<div class="form-group" style="font-weight: bold; font-size: 30px; margin-top:2rem;">
					<form:label path="noticeContent">내용</form:label>
					<form:textarea path="noticeContent" class="form-control" style="height: 500px;"></form:textarea>
					<form:errors path="noticeContent" cssClass="error" />
				</div>
				<div style="margin-bottom: 4rem;">
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-check"></i> 확인
				</button>
				<button type="reset" class="btn btn-primary">
					<i class="fas fa-undo"></i> 취소
				</button>
				<a href="/notice/notice"
					class="btn btn-primary get"> <i class="fas fa-file-alt"></i>
					돌아가기
				</a>
				</div>
			</form:form>
		</div>
	</div>
</div>

<%@ include file="../layouts/footer1.jsp"%>