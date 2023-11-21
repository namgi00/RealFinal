<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>


<%@ include file="../layouts/header1.jsp"%>

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
