<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@
taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@
include file="../layouts/header1.jsp"%>

<section class="donate-main">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">후원하기</div>
				<div class="message">당신의 작은 도움이 어려운 이들에겐 큰 도움이 될 수 있습니다.</div>
			</div>
		</div>
	</div>
</section>

<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card border-0"> <!-- 외부 선 제거 -->
				<div class="card-body">
					<%-- <form action="payment" method="post"> --%>
					<form action="" method="post" id="donationForm">
						<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
						<div class="form-group">
							<br>
							<h3>
								<b>후원자 정보</b>
							</h3>
							
							<br>
							<hr color="15bdb1" />
							<br>
							
							<!-- 후원자 개인 정보 입력 -->
							<div class="form-group" id="nameInput">
								<label for="donateName">성명</label> 
								<input type="text" name="donateName" class="form-control" placeholder="성명을 입력하세요" required />
							</div>

							<br />

							<div class="form-group" id="birthdayInput">
								<label for="donateBirthday">생년월일</label> <input type="text"
									name="donateBirthday" class="form-control"
									placeholder="생년월일 6자리를 입력하세요" required />
								<pre>※만 14세 미만의 경우, 후원이 불가능합니다.※</pre>
							</div>

							<br />

							<div class="form-group" id="phoneInput">
								<label for="donatePhoneNumber">휴대폰 번호</label> <input type="text"
									name="donatePhoneNumber" class="form-control"
									placeholder="휴대폰 번호를 입력하세요 ('-' 제외)" required />
							</div>

							<br />

							<div class="form-group" id="emailInput">
								<label for="donateEmail">이메일</label> <input type="text"
									name="donateEmail" class="form-control" placeholder="이메일 주소를 입력하세요"
									required />
							</div>

							<br />
							<hr color="15bdb1" />
							<br />

							<!-- 후원 목적 선택창 -->
							<label for="select"><h5><b>후원 목적 선택</b></h5></label> <select
								class="form-control" name="donateSelect" id="donateSelect">
								<option value="donateSelect">== 후원 목적 선택 ==</option>
								<c:forEach var="donateSelect" items="${donateSelectList}">
									<option value="${donateSelect.donateSelect}">
										${donateSelect.donateSelect}</option>
								</c:forEach>
							</select> <br /> <br />

							<!-- 후원 금액 선택창 -->
							<label for="donateOption"><h5><b>후원 금액 선택</b></h5></label> <select
								class="form-control" name="donateMoney" id="donateMoney">
								<option value="donateMoney">== 후원 금액 선택 ==</option>
								<c:forEach var="donateMoney" items="${donateAmountList}">
									<option value="${donateMoney.donateMoney}">
										${donateMoney.donateOption}</option>
								</c:forEach>
							</select>
						</div>

						<br>

						<div class="form-group">
							<label for="donateMessage"><h5>
									<b>응원 메시지</b>
								</h5></label>
							<textarea class="form-control" name="donateMessage" rows="3"
								placeholder="응원 메시지를 남겨주세요" required></textarea>
						</div>

						<br />
						<hr color="#15bdb1" />
						<br />

						<!-- 후원 요약 정보를 보여줄 컨테이너 -->
						<div id="summaryContainer" style="display: none">
							<label for="summary"><h5>
									<b>후원 요약</b>
								</h5></label>
							<p id="summaryText"></p>
						</div>

						<!-- <button type="submit" class="btn btn-block">후원하기</button> -->

					    <div class="form-group" id="donatePayment">
					        <button type="submit" id="cardButton" name="donatePayment" value="카드" class="btn btn-primary">카드 결제하기</button>
					    </div>
					
					    <div class="form-group" id="donatePayment">
					        <button type="submit" id="cashButton" name="donatePayment" value="현금" class="btn btn-primary">현금 결제하기</button>
					    </div>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
document.getElementById("cardButton").addEventListener("click", function() {
	document.getElementById("donationForm").action = "payment1";
});

document.getElementById("cashButton").addEventListener("click", function() {
	document.getElementById("donationForm").action = "payment2";
});
</script>

<script>
  // 함수를 만들어 후원 목적 및 후원 금액에 대한 요약을 업데이트
  function updateSummary() {
    var summaryContainer = document.getElementById('summaryContainer');
    var summaryText = document.getElementById('summaryText');

    // 선택한 후원 목적 및 후원 금액 가져오기
    var selectedOption =
      document.getElementById('donateSelect').options[
        document.getElementById('donateSelect').selectedIndex
      ].text;
    var selectedAmount =
      document.getElementById('donateMoney').options[
        document.getElementById('donateMoney').selectedIndex
      ].text;

    // 항상 요약을 표시
    summaryContainer.style.display = 'block';
    summaryText.innerText =
      '선택하신 후원 목적: ' +
      selectedOption +
      '\n선택하신 후원 금액: ' +
      selectedAmount;
  }

  // 후원 금액 변경 시 이벤트 처리
  document
    .getElementById('donateMoney')
    .addEventListener('change', function () {
      updateSummary();
    });

  // 후원 목적 변경 시 이벤트 처리
  document
    .getElementById('donateSelect')
    .addEventListener('change', function () {
      updateSummary();
    });

  // 초기 로딩 시 실행
  window.addEventListener('load', function () {
    // 처음에 숨겨둔 요약 컨테이너를 표시
    document.getElementById('summaryContainer').style.display = 'block';
  });
</script>

<script>
  // 후원 목적과 설명을 매핑할 객체 -- 후원 목적 설명 포기! 못해먹겠네!
  var descriptionMap = {
  	<c:forEach var="donateSelect" items="${donateSelectList}">
  		'${donateSelect.donateSelect}': '${donateSelect.donateDescription}'
  	</c:forEach>
  };
</script>

<style>
.donate-main {
	height: 360px;
	background-image: url('/resources/images/donate.png');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	z-index: 1;
}
</style>

<style>
.btn {
	background-color: #15bdb1;
	border-color: #15bdb1;
	color: white;
}
</style>

<%@ include file="../layouts/footer1.jsp"%>
