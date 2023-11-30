<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../layouts/header1.jsp"%>

<section class="donate-main">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">내 후원 기록 검색하기</div>
				<div class="message">당신의 후원이 더 아름다운 오늘을 만들었습니다.</div>
			</div>
		</div>
	</div>
</section>

<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card border-0"> <!-- 외부 선 제거 -->
				<div class="card-body">
					<h3 class="card-title">
						<b>후원자 정보</b>
					</h3>
					<form action="finddonate" method="post" onsubmit="showResults();">
						<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
				
						<br>
						<br>
				
						<div class="form-group" id="nameInput">
							<label for="donateName">성명</label>
							<input type="text" name="donateName" class="form-control" placeholder="성명을 입력하세요" required />
						</div>
						
						<br>
						
						<div class="form-group" id="phoneInput">
							<label for="donatePhoneNumber">휴대폰 번호</label>
							<input type="text" name="donatePhoneNumber" class="form-control" placeholder="휴대폰 번호를 입력하세요 ('-' 제외)" required />
						</div>
						
						<br>
						
						<div class="form-group" id="birthdayInput">
							<label for="donateBirthday">생년월일</label>
							<input type="text" name="donateBirthday" class="form-control" placeholder="생년월일 6자리를 입력하세요" required />
						</div>
						
						<br>
						
						<button type="submit" class="btn btn-primary btn-block" style="background-color: #0e7886;">검색하기</button>
					</form>
					
										
					 <!-- 여기에 결과를 표시할 부분 추가 -->
					<c:choose>
					    <c:when test="${empty donateMyList}">
					        <p id="noRecordsMessage" style="display:none;">No donation records found.</p>
					    </c:when>
					    <c:otherwise>
					        <p id="noRecordsMessage">No donation records found.</p>
					        <c:forEach var="donate" items="${donateMyList}">
					            <p class="donateResult">
					                Donate Date: ${donate.donateDate}<br>
					                Donate Payment: ${donate.donatePayment}<br>
					                Donate Name: ${donate.donateName}<br>
					                <!-- 다른 속성들도 필요에 따라 추가 -->
					            </p>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
										
					
				</div>
			</div>
		</div>
	</div>
</div>


<style>
.donate-main {
	height: 360px;
	background-image: url('/resources/images/donateheart.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	z-index: 1;
}
</style>

<script>
    // 검색 결과가 있을 때 결과를 표시하는 함수
    function showResults() {
        document.getElementById("noRecordsMessage").style.display = "none";
        var results = document.getElementsByClassName("donateResult");
        for (var i = 0; i < results.length; i++) {
            results[i].style.display = "block";
        }
    }
</script>





<%@ include file="../layouts/footer1.jsp"%>