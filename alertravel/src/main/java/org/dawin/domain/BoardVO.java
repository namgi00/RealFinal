package org.dawin.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	//페이지 목록 추출

	
	private Long postid;
	
	private String region;
	
	private String title;
	
	private String username;
	
	private String photoImg;
	
	private String content;
	
	private Date regDate;
	private Date updateDate;
	
	private Long viewCnt;


	List<BoardAttachmentVO> attaches; // 추가 이미지 경로들을 담을 리스트
		
	public String getSummary() {
		// 본문 내용 수정 시 summernote가 <p>태그로 자동 그룹핑하면 카드의 [0]이 적용 안 되는 문제
		// .replace("<p>", "") <<를 붙여줌으로 해결 가능
		return content.split("<br>")[0].replace("<p>", "");
		}
	
}
