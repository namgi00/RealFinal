package org.dawin.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	
	private int noticeNo;
	private String noticeTitle;
	private LocalDateTime noticeDate;
	private String noticeContent;
}
