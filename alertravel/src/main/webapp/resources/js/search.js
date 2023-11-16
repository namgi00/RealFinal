$(document).ready(function() { // 모든 JQuery는 이걸로 시작함
		
	let searchForm = $('#searchForm');
	$('#searchForm button').on('click', function(e) { // searchForm의 후손 중에서 button, 즉 검색 버튼의 클릭 이벤트
		if (!searchForm.find('option:selected').val()) { // option 태그 중에 selected 상태인 것, 즉 뭐 선택했느냐에 따라 val(ue)를 리턴해달라
			alert('검색종류를 선택하세요'); // val가 false면 if처리 해라(value="" 인 것)
			type.focus();
			return false; // false가 아니면(선택하면) if문 나가라. 즉 아래 if문으로 가라 !!submit 하지 마라!!
		}
		
	let keyword = searchForm.find('input[name="keyword"]');
	if (!keyword.val()) {  // 만약 키워드가 비어있다면 if문인 얼럿 출력
		alert('키워드를 입력하세요');
		keyword.focus(); // 강조시킴
		return false; // 키워드가 있다면 얼럿 출력하지 마라
	}
			
		searchForm.find('input[name="pageNum"]').val('1');
		e.preventDefault();
			
		searchForm.submit();
	});
});