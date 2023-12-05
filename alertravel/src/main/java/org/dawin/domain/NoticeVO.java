package org.dawin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	
	private Long noticeNo;
	private String noticeTitle;
	private String noticeDate;
	private String noticeContent;
}
