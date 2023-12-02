<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ include file="../layouts/header1.jsp"%>

<section class="donate-main">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">내 후원 내역 검색하기</div>
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
						<b>내가 얼마나 후원했는지 확인해보세요</b>
					</h3>
					<form action="/donate/finddonate" method="post" onsubmit="showResults();">
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
						<div class="form-group" id="emailInput">
							<label for="donateBirthday">이메일</label>
							<input type="email" name="donateEmail" class="form-control" placeholder="이메일을 입력하세요" required />
						</div>
						<br>
						<button type="submit" class="btn btn-primary btn-block" style="background-color: #0e7886;">검색하기</button>
					</form>
					
					<c:choose>
					    <c:when test="${empty donateMyList}">
					        <div class="alert alert-warning" role="alert">
					            후원 내역을 찾지 못했습니다.
					        </div>
					    </c:when>
					    <c:otherwise>
					        <table class="table table-striped">
					            <thead>
					                <tr>
					                    <th>후원 날짜</th>
					                    <th>결제</th>
					                    <th>후원 목적</th>
					                    <th>후원액</th>
					                    <th>메세지</th>
					                </tr>
					            </thead>
					            <tbody>
									<c:forEach var="donate" items="${donateMyList}">
									    <c:set var="donateDate" value="${donate.donateDate}" />
									    <tr class="donateResult">
									        <td>
									            <%
									                Date donateDate = (Date) pageContext.getAttribute("donateDate");
									                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm", java.util.Locale.KOREA);
									                String formattedDate = sdf.format(donateDate);
									                out.print(formattedDate);
									            %>
									        </td>
					                        <td>${donate.donatePayment}</td>
					                        <td>${donate.donateSelect}</td>
					                        <td>${donate.donateMoney}</td>
					                        <td>${donate.donateMessage}</td>
					                    </tr>
					                </c:forEach>
					            </tbody>
					        </table>
					    </c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>
</div>


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

<%@ include file="../layouts/footer1.jsp"%>