<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>

<%@ include file="../layouts/header1.jsp"%>

<div class="inner">
	<div class="alarm-container">
		<button type="button"
			onclick="location.href='/alarm/listLvl?alarmLvl=1'" class="alarm1">
			<div class="alarm-title">
				<div class="alarm-name">1단계</div>
				<div class="alarm-content">여행유의</div>
			</div>
		</button>
		<button type="button"
			onclick="location.href='/alarm/listLvl?alarmLvl=2'" class="alarm2">
			<div class="alarm-title">
				<div class="alarm-name">2단계</div>
				<div class="alarm-content">여행자제</div>
			</div>
		</button>
		<button type="button"
			onclick="location.href='/alarm/listLvl?alarmLvl=3'" class="alarm3">
			<div class="alarm-title">
				<div class="alarm-name">3단계</div>
				<div class="alarm-content">출국권고</div>
			</div>
		</button>
		<button type="button"
			onclick="location.href='/alarm/listLvl?alarmLvl=4'" class="alarm4">
			<div class="alarm-title">
				<div class="alarm-name">4단계</div>
				<div class="alarm-content">여행금지</div>
			</div>
		</button>
	</div>
</div>

<section class="inner">
	<table class=table>
		<thead>
			<tr>
				<th>경보단계</th>
				<th colspan="2" align="center">대륙명</th>
				<th colspan="2" align="center">나라명</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="alarm" items="${list }">
				<tr>
					<td class="alarm-td">${alarm.alarmLvl }</td>
					<td class="alarm-td">${alarm.continentEngNm }</td>
					<td class="alarm-td">${alarm.continentNm }</td>
					<td class="alarm-td"><a href="/alarm/get?countryEngNm=${alarm.countryEngNm }">${alarm.countryEngNm }</a></td>
					<td class="alarm-td">${alarm.countryNm }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>



<%@ include file="../layouts/footer1.jsp"%>
