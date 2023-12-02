<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page import="java.text.NumberFormat" %>

<%@ include file="../layouts/header1.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<section class="totaldonate-main">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">따뜻한 마음 나누기</div>
				<div class="message">현재 후원 현황을 확인하고 직접 후원을 하실 수 있습니다.</div>
			</div>
		</div>
	</div>
</section>

<br>
<br>
<br>

<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card border-0"> <!-- 외부 선 제거 -->
				<div class="card-body">
					
					<div class="donatebutton" style="text-align: center; width: 260px; height: 130px; margin: 0 auto;">
						<a href="donate"><img src="/resources/images/donatebutton.gif" alt="donatebutton"></a>
					</div>
					<div style="text-align: center; font-family: 'Spoqa Han Sans Neo', 'Sans-serif';">
						<h3 style="color: #0e7886"><strong>↑ 바로 후원하러 가기 ↑</strong></h3>
					</div>
					
					<br>
					<br>
					<br>
					<br>
					<br>
					
					<canvas id="bar-chart-horizontal" width="1000" height="500"></canvas>
					
					<br>
					<br>
					<br>
					<br>
					<br>
					<hr color="#0e7886" />
					<br>
					<br>
					
					<div style="text-align: center;">
						<h3 style="color: #0e7886"><strong>얼마나 많은 분들께서 따뜻한 마음을 나눠주셨을까요?</strong></h3>
						<br>
						<br>
						<br>
						<div style="position: relative; display: inline-block;">
							<img src="/resources/images/love.gif" alt="love" style="display: block; margin: 0 auto; width: 60%;">

							<!-- 숫자에 자동으로 콤마 주입 -->
 							<c:set var="formattedTotalPeople" value="${donateTotalPeople}" />
							<fmt:formatNumber value="${formattedTotalPeople}" pattern="#,##0" var="formattedNumber" />
							<span class="font-weight-bold" style="font-size: 2em;color: #FDD835;position: absolute;top: 150px;left: 50%;transform: translate(-50%, -50%);">
							    ${formattedNumber}명
							</span>
							
							
						</div>
					</div>
					
					<br>
					<br>
					<br>
					<br>
					<br>
					<hr color="#0e7886" />
					<br>
					<br>

					<div style="text-align: center;">
						<h3 style="color: #0e7886;"><strong>얼마나 많은 따뜻하고 소중한 마음이 모였을까요?</strong></h3>
						<br>
						<br>
						<br>
						<div style="position: relative; display: inline-block; text-align: center;">
					    	<img src="/resources/images/fillingheart.gif" alt="love" style="width: 150%; max-width: 100%; height: auto; margin: 0 auto;">

							<!-- 숫자에 자동으로 콤마 주입 -->
							<c:set var="formattedTotalMoney" value="${donateTotalMoney}" />
							<fmt:formatNumber value="${formattedTotalMoney}" pattern="#,##0" var="formattedMoney" />
							<span class="font-weight-bold" style="font-size: 2em; color: #FDD835; position: absolute; top: 90px; left: 50%; transform: translate(-50%, -50%); width: 300px;">
							    ${formattedMoney}원
							</span>
							
							
						</div>
					</div>

					<br>
					<br>
					<br>
					<br>
					<br>
					<hr color="#0e7886" />
					<br>
					<br>
					
					<h2 style="text-align: center; color:#0e7886;"><strong>
					    남을 돕는 것은 생각보다 어렵지 않습니다. <br><br><br>
					    지금 바로 후원해보세요!
					</strong></h2>
					
					<br>
					<br>
					<br>
					<br>
				
					<button type="submit" class="btn btn-primary btn-block" onclick="location.href='donate';" style="background-color: #0e7886;">
					    후원하러 가기
					</button>

				</div>
			</div>
		</div>
	</div>
</div>


<script>
new Chart(document.getElementById("bar-chart-horizontal"), {
    type: 'horizontalBar',
    data: {
        labels: [
            <c:forEach var="donation" items="${donateOptionTotalList}">
                "${donation.donateSelect}", /* ,를 써야 data: [1000, 2000, 3000,] 이렇게 나옴 */
            </c:forEach>
        ],
        datasets: [
            {
				label: "총 후원 금액",
                backgroundColor: ["#87CEEB", "#FFB6C1", "#98FB98", "#FFA07A", "#800080", "#C0C0C0", "#FFD700", "#F08080"],
                data: [
                    <c:forEach var="donation" items="${donateOptionTotalList}">
                        ${donation.sumDonateMoney},
                    </c:forEach>
                ]
            }
        ]
    },
    options: {
        legend: { display: false },
        title: {
            display: true,
            text: '총 후원 금액 통계',
            fontSize: 24, // 원하는 크기로 조절
            fontColor: 'black', // 텍스트 색상 지정
            fontStyle: 'bold' // 볼드 처리
        }
    }
});
</script>

<style>
	.totaldonate-main {
		height: 360px;
		background-image: url('/resources/images/children.jpg');
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
		z-index: 1;
	}
  
	.donatebutton img {
		transition: transform 0.3s ease;
		cursor: pointer;
	}

	.donatebutton:hover img {
		transform: scale(1.2);
	}
</style>


<%@ include file="../layouts/footer1.jsp"%>