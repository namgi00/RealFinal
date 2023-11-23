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

<script>
	
</script>

<br>
<br>
<br>
<div class="profile-item">
	<img src="/resources/images/basic-profile.png" class="profileImage" />
	<br>
	<br>
		<div class="user-info-item">
			<div>
				✏️ 아이디: ${member.username}
			</div>
			<br>
			<div>
				✉️ 이메일: ${member.email}
			</div>
			<br>
			<div>
				 🗓️ 가입일:
				<fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd HH:mm" />
			</div>
			<br>
			<div>
				🛠️ 수정일:
					<fmt:formatDate value="${member.updateDate}" pattern="yyyy-MM-dd HH:mm" />
			</div>
		</div>
</div>

<br>
<br>

<!-- 로그인 사용자가 두 가지 경우가 존재합니다.
	하나는 우리 사이트 회원, 다른 하나는 SNS 회원입니다.
	SNS 회원은 email존재하지 않습니다. 그리고 password 임시값입니다.
	즉, email존재하지 않는 sns회원은 우리 회원이 아니기때문에 password를 
	변경할 필요가 없습니다.
	SNS회원은 아래의 버튼이 활성화 되면 안됩니다.
	그러기 위해서는 email이 null인지 확인해서 null이면 버튼을 비활성화 하면됩니다. 
  -->


<div class="text-right">
	<button type="button" class="btn btn-primary"
		onclick="location.href='/security/update'">
		<i class="fa-solid fa-user-pen"></i> 내 정보 수정
	</button>
</div>


<%@ include file="../layouts/footer.jsp"%>