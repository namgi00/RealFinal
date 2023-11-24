<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../layouts/header1.jsp"%>



<section class="mypage-main">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">마이 페이지</div>
				<div class="message">
					멋진 당신을 다른 사람에게 소개하세요.
				</div>
			</div>
		</div>
	</div>
</section>
<sec:authentication property="principal.member" var="member" />

<div class="profile-item">
	<img src="/resources/images/basic-profile.png" class="profileImage" />
		<div class="user-info-item">
		<br/>
			<div>
				✏️ 아이디: ${member.username}
			</div>
			<c:if test="${member.email != null}" >
			<br/>
				<div>
					✉️ 이메일: ${member.email}
				</div>
			</c:if>
			<br/>
			<div>
				 🗓️ 가입일:
				<fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd HH:mm" />
			</div>
			<br>
			<div>
				🛠️ 수정일:
					<fmt:formatDate value="${member.updateDate}" pattern="yyyy-MM-dd HH:mm" />
			</div>
			<c:if test="${member.email != null}" >
			
			<div class="update-item">
				<button type="button" class="btn btn-primary" onclick="location.href='/security/change_password?username=${member.username }'">
				<i class="fa-solid fa-user-pen"></i> 비밀번호 변경
				</button>
			</div>
			</c:if>
		</div>
</div>

<%@ include file="../layouts/footer1.jsp"%>