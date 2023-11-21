<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="../../views/layouts/header1.jsp"%>


<h1>국가별 기본정보 페이지</h1>
<div class="flag-container">
	<div>
		<img class="flag-image" src="${country.flagDownloadUrl }" />
	</div>
	<span class="flag-info">${country.countryNm }(${country.countryEngNm })</br>
		${country.continentNm }
	</span>
</div>


<%@ include file="../../views/layouts/footer1.jsp"%>