<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../layouts/header.jsp"%>

<sec:authentication property="principal.member" var="member" />

<script>
	
</script>

<br>
<br>
<br>

<div class="text-center">
	<img src="/resources/images/mainecoon.jpg" class="profileImage" />
</div>

<br>
<br>

<div>
	<h4>
		<i class="fa-solid fa-id-card"></i> 아이디: ${member.username}
	</h4>
</div>
<br>
<div>
	<h4>
		<i class="fa-solid fa-at"></i> 이메일: ${member.email}
	</h4>
</div>
<br>
<div>
	<h4>
		<i class="fa-solid fa-calendar-days"></i> 가입일:
		<fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd HH:mm" />
	</h4>
</div>
<br>
<div>
	<h4>
		<i class="fa-solid fa-calendar-plus"></i> 수정일:
		<fmt:formatDate value="${member.updateDate}"
			pattern="yyyy-MM-dd HH:mm" />
	</h4>
</div>

<br>
<br>

<div class="text-right">
	<button type="button" class="btn btn-primary"
		onclick="location.href='/security/update'">
		<i class="fa-solid fa-user-pen"></i> 내 정보 수정
	</button>
</div>

<%@ include file="../layouts/footer.jsp"%>
