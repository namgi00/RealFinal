<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../layouts/header1.jsp"%>

<!-- jQuery -->
<!-- <script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- axios -->
<script type="text/javascript"
	src="https://unpkg.com/axios/dist/axios.min.js"></script>


<h1>결제 수단을 선택하세요.</h1>

<br>
<br>



<%
// 폼에서 전달된 파라미터 받기
String donateName = request.getParameter("donateName");
String donatePhoneNumber = request.getParameter("donatePhoneNumber");
String donateEmail = request.getParameter("donateEmail");
String donateMoney = request.getParameter("donateMoney");
String donateSelect = request.getParameter("donateSelect");
String donateMessage = request.getParameter("donateMessage");

out.println("후원자 성함: " + donateName);
out.println("후원자 휴대폰 번호: " + donatePhoneNumber);
out.println("후원자 이메일: " + donateEmail);
out.println("선택한 후원 금액: " + donateMoney);
out.println("선택한 후원 목적: " + donateSelect);
out.println("후원자 메세지: " + donateMessage);
%>

<div class="text-center">
	<button onclick="requestPay1()">체크/신용카드 결제</button>
	<button onclick="requestPay2()">카카오페이 결제</button>
	<button onclick="requestPay3()">토스페이 결제</button>
</div>


<script>
	var IMP = window.IMP; 
    IMP.init("imp81120017"); 
      
    var donateName = '<%=donateName%>';
    var donatePhoneNumber = '<%=donatePhoneNumber%>';
    var donateEmail = '<%=donateEmail%>';
    var donateMoney = '<%=donateMoney%>';
    var donateSelect = '<%=donateSelect%>';

	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var seconds = today.getSeconds(); // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;

	function requestPay1() {
		IMP.request_pay({
			pg : 'kcp', // pg사
			pay_method : 'card', // 결제 수단
//			merchant_uid: "ORD20231111-0000001", // 주문번호
			name : donateSelect, // 상품 이름
			amount : donateMoney, // 총 결제 금액
			buyer_name : donateName, // 구매자 이름
			buyer_tel : donatePhoneNumber, // 구매자 전화번호
			buyer_email : donateEmail // 구매자 이메일
		}, function(rsp) { // callback
			if (rsp.success) {
				console.log(rsp);
			} else {
				console.log(rsp);
			}
		});
	}

	function requestPay2() {
		IMP.request_pay({
			pg : 'kakaopay', // pg사
			pay_method : 'card', // 결제 수단
//			merchant_uid: "ORD20231111-0000002", // 주문번호
			name : select, // 상품 이름
			amount : amount, // 총 결제 금액
			buyer_name : name, // 구매자 이름
			buyer_tel : phone, // 구매자 전화번호
			buyer_email : email	// 구매자 이메일
		}, function(rsp) { // callback
			if (rsp.success) {
				console.log(rsp);
			} else {
				console.log(rsp);
			}
		});
	}

	function requestPay3() {
		IMP.request_pay({
			pg : 'tosspay',
			pay_method : 'card',
//			merchant_uid : 'ORD20231114-000003',
			name : select, // 상품 이름
			amount : amount, // 총 결제 금액
			buyer_name : name, // 구매자 이름
			buyer_tel : phone, // 구매자 전화번호
			buyer_email : email	// 구매자 이메일
		}, function(rsp) { // callback
			if (rsp.success) {
				console.log(rsp);
			} else {
				console.log(rsp);
			}
		});
	}
</script>



<%@ include file="../layouts/footer.jsp"%>