<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script>
	$(document).ready(function() {

		let searchForm = $('#searchForm');
		
		$('#searchForm button').on('click', function(e) { 
			let type =searchForm.find('option:selected');
			if (!type.val()) {
				alert('검색종류를 선택하세요');
				return false;
			}

			let keyword = searchForm.find('input[name="keyword"]');
			if (!keyword.val()) { //필수요소 체크
				keyword.focus();
				alert('키워드를 입력하세요');
				return false;
			}

			searchForm.find('input[name="pageNum"]').val('1');
			e.preventDefault();
			searchForm.submit();
		});

	});
</script>


<div>
		<form:form id="searchForm" modelAttribute="pagination" method="get" class="d-flex">
			<form:hidden path="page" />
			<form:hidden path="listSize" />
				<form:select path="type" items="${searchTypes}" 
				cssClass="form-select rounded-0 ml-1" />
			<div class="input-group">
				<form:input path="keyword" cssClass="form-control rounded-0" 
					value="${pagination.keyword}"/>
				<button type="submit" Class="btn btn-success rounded-0">
					<i class="fa-solid fa-magnifying-glass"></i> 검색
				</button>
			</div>
		</form:form>
	</div>










