<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>

<%@ include file="../layouts/header1.jsp"%>

<section class="inner">
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
</section>


<%@ include file="../layouts/footer1.jsp"%>
