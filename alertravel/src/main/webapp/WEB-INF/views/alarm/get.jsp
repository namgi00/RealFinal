<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>


<%@ include file="../layouts/header1.jsp"%>




<style>
.infomation-banner {
	height: 360px;
	background-image: url('/resources/images/informationbanner.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	z-index: 1;
}
</style>

<section class="infomation-banner">
		<div class="main-container">
			<div class="inner">
				<div class="title-container">
					<div class="title">국가 관련 정보</div>
					<div class="message">
						해당 국가의 정보를 확인하시어 <br/> 
						여행에 도움이 되기를 바랍니다.<br/>
					</div>
				</div>
			</div>
		</div>
</section>


<div class="inner">
	<div class="flag-container">
		<div>
			<img class="flag-image" src="${alarm.flagDownloadUrl }" />
		</div>
		<span class="flag-info">${alarm.countryNm }(${alarm.countryEngNm })</br>
			${alarm.continentNm }
		</span>
	</div>

	<div class="country-container">
		<img class="country-image" src="${alarm.mapDownloadUrl }" />
	</div>

	<div class="basic-container">
		<h1>기본정보</h1>
		${basic.basic} 
	</div>

</div>


<%@ include file="../layouts/footer1.jsp"%>
