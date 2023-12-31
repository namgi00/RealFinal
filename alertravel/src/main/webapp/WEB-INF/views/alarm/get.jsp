<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>


<%@ include file="../layouts/header1.jsp"%>


<section class="infomation-banner">
	<div class="main-container">
		<div class="inner">
			<div class="title-container">
				<div class="title">국가 관련 정보</div>
				<div class="message">
					해당 국가의 정보를 확인하시어 <br /> 여행에 도움이 되기를 바랍니다.<br />
				</div>
			</div>
		</div>
	</div>
</section>


<div class="inner">
	<div class="continent">🌏&nbsp;${alarm.continentNm}</div>
	<div class="flag-container">
		<div>
			<img class="flag-image" src="${alarm.flagDownloadUrl}" />
		</div>
		<div class="flag-info1">${alarm.countryNm}<br>
			<div class="flag-info2">&nbsp;${alarm.countryEngNm}</div>
		</div>
	</div>

	<div class="withbasic">
		<div class="country-container">
			<div class="dangmap" style="height: 700px; width: 700px;">
				<img class="country-image" src="${alarm.dangMapDownloadUrl}"
					style="height: 650px; width: 700px; object-fit: contain;" />
				<div class="written" style="text-align: right;">경보 기준일 :
					${alarm.writtenDt}</div>
					<br>💡외교부에서 여행경보단계 정보를 제공하지 않는 국가 및 대한민국은 흰색으로 표시됩니다.
				<div class="special_lvl">
					
					💡특별여행주의보란?<br>
					단기적으로 긴급한 위험이 있는 국가(지역)에 대하여 발령합니다.
					특별여행주의보 발령에 따른 행동요령은 여행경보 2단계 이상 3단계 이하에 준합니다.
					특별여행주의보 발령 기간은 최대 90일입니다. <br>
					자세한 사항은 외교부 사이트에서 확인하실 수 있습니다.<br>
					<a href="#" onClick="window.open('https://0404.go.kr/dev/special_issue_current.mofa')">[외교부 특별여행주의보 확인하기➡️]</a>
					</div>
				<!-- <div class="star" style="text-align: right;">*하늘색 별은 수도 위치를
					나타냅니다.</div> -->
			</div>
		</div>

		<div class="basic-zone">
			<h1 id="basic-title">
				<i class="fa-solid fa-circle-info"></i>&nbsp;기본정보
			</h1>
			<div class="basic-container">${basic.basic}</div>
			<div class="alarm-lvl-tip">
				<div class="tip1">
					<button type="button"
						onclick="location.href='/alarm/listLvl?alarmLvl=1'"
						class="tip1-btn">여행유의</button>
					- 1단계 : 신변안전 위험 요인 숙지·대비
				</div>
				<br>
				<div class="tip2">
					<button type="button"
						onclick="location.href='/alarm/listLvl?alarmLvl=2'"
						class="tip2-btn">여행자제</button>
					- 2단계 : 불필요한 여행 자제
				</div>
				<br>
				<div class="tip3">
					<button type="button"
						onclick="location.href='/alarm/listLvl?alarmLvl=3'"
						class="tip3-btn">출국권고</button>
					- 3단계 : 여행 취소·연기
				</div>
				<br>
				<div class="tip4">
					<button type="button"
						onclick="location.href='/alarm/listLvl?alarmLvl=4'"
						class="tip4-btn">여행금지</button>
					- 4단계 : (여행예정자) 여행금지 준수<br><br>
					💡&nbsp;버튼 클릭 시, 여행경보 단계별 국가목록 페이지로 이동합니다.<br>
				</div>
			</div>
		</div>
	</div>



	<h1 id="contact-title">🚨&nbsp;현지연락처</h1>
	<div class="contact-container">${contactRemark.contactRemark}</div>


</div>


<%@ include file="../layouts/footer1.jsp"%>
