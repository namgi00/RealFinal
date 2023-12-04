<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../layouts/header1.jsp"%>
<div style="background-color: #D5E5F4;">

	<br>
	<br>
	<br>
	
	<h1	style="color: #28a745; text-align: center; font-family: 'Arial', sans-serif; margin-top: 50px; font-size: 5em; font-weight: bold;">
		🌱 후원이 완료됐습니다 🌱
	</h1>
	
	<br>
	
	<p style="color: #333; text-align: center; font-family: 'Arial', sans-serif; margin-top: 20px; font-size: 1.7em;">
		후원해 주셔서 대단히 감사합니다. 🙏 <br> 기부하신 후원금은 선택하신 목적에 맞게 올바르게 사용하겠습니다. 💖
	</p>
	
	<div style="text-align: center;">
		<img src="/resources/images/jihyunBW.png" width="1000px" height="500px">
	</div>
	
	<br>
	<br>
	<br>
	<br>
	
	<div class="finddonatebutton" style="text-align: center;">
		<img src='/resources/images/greatjob.gif' alt="greatjob" onclick="location.href='finddonate';">
	</div>
	
	<div style="text-align: center">
		<h3 style="color: #0e7886">
			<strong>↑ 후원 내역 바로 검색하러 가기 ↑</strong>
		</h3>
	</div>

	<style>
	    .finddonatebutton img {
	        cursor: pointer;
	        display: block;
	        margin: auto;
	        margin-top: 50px;
	    }
	</style>

</div>
<%@ include file="../layouts/footer1.jsp"%>