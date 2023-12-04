package org.dawin.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	
	private Long noticeNo;
	private String noticeTitle;
	private LocalDate noticeDate;
	private String noticeContent;
}
