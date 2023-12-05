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

<div class="inner">
	<!--  테이블 구성하기 -->
	<div class="notice-writer">
		<div class="notice-row">
			<form action="/notice/noticewrite" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
					<input type="hidden" name="noticeDate" value="${notice.noticeDate}" />
				<table class="table"
					style="text-align: center; border: 1px solid #dddddd; margin: 4rem 0rem;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">글
								작성하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="noticeTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="noticeContent" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				

				<button type="submit" class="btn btn-primary">
					<i class="fas fa-check"></i> 확인
				</button>
				<button type="reset" class="btn btn-primary">
					<i class="fas fa-undo"></i> 취소
				</button>
				<a href="/notice/notice" class="btn btn-primary"> <i
					class="fas fa-list"></i> 돌아가기
				</a>

			</form>

		</div>
	</div>
</div>

<%@ include file="../layouts/footer1.jsp"%>