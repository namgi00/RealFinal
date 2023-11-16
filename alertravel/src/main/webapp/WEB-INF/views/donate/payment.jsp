<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- axios -->
<script type="text/javascript"
	src="https://unpkg.com/axios/dist/axios.min.js"></script>


<%
    // 폼에서 전달된 파라미터 받기
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String amount = request.getParameter("amount");
    String select = request.getParameter("select");
    String message = request.getParameter("message");


	out.println("후원자 성함: " + name);
	out.println("후원자 휴대폰 번호: " + phone);
	out.println("후원자 이메일: " + email);
	out.println("선택한 후원 금액: " + amount);
	out.println("선택한 후원 목적: " + select);
	out.println("후원자 메세지: " + message);
%>

<script>
        var IMP = window.IMP; 
        IMP.init("imp81120017"); 
      
        var name = '<%= name %>';
        var phone = '<%= phone %>';
        var email = '<%= email %>';
        var amount = '<%= amount %>';
        var select = '<%= select %>';
        
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
        function requestPay1() {
            IMP.request_pay({
                pg: 'kcp', // pg사
                pay_method: 'card', // 결제 수단
                merchant_uid: "ORD20231111-0000001", // 주문번호
                name: select, // 상품 이름
                amount: amount, // 총 결제 금액
                buyer_name: name, // 구매자 이름
                buyer_tel: phone, // 구매자 전화번호
                buyer_email: email // 구매자 이메일
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }

        function requestPay2() {
            IMP.request_pay({
                pg: 'kakaopay', // pg사
                pay_method: 'card', // 결제 수단
                merchant_uid: "ORD20231111-0000002", // 주문번호
                name: select, // 상품 이름
                amount: amount, // 총 결제 금액
                buyer_name: name, // 구매자 이름
                buyer_tel: phone, // 구매자 전화번호
                buyer_email: email // 구매자 이메일
            }, function (rsp) { // callback
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
                merchant_uid : 'ORD20231114-000003',
                name: select, // 상품 이름
                amount: amount, // 총 결제 금액
                buyer_name: name, // 구매자 이름
                buyer_tel: phone, // 구매자 전화번호
                buyer_email: email // 구매자 이메일
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
    </script>
<title>Sample Payment</title>
</head>
<body>
	<button onclick="requestPay1()">kcp 결제하기</button>
	<!-- 결제하기 버튼 생성 -->
	<button onclick="requestPay2()">카카오페이 결제하기</button>
	<!-- 결제하기 버튼 생성 -->
	<button onclick="requestPay3()">토스페이 결제하기</button>
	<!-- 결제하기 버튼 생성 -->
</body>
</html>