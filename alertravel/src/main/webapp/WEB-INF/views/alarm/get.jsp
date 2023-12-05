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
				<div class="star" style="text-align: right;">*하늘색 별은 수도 위치를
					나타냅니다.</div>
			</div>
		</div>

		<div class="basic-zone">
			<h1 id="basic-title">
				<i class="fa-solid fa-circle-info"></i>&nbsp;기본정보
			</h1>
			<div class="basic-container">${basic.basic}</div>
		</div>
	</div>
		


	<h1 id="contact-title">🚨&nbsp;현지연락처</h1>
	<div class="contact-container">${contactRemark.contactRemark}</div>


</div>


<%@ include file="../layouts/footer1.jsp"%>
