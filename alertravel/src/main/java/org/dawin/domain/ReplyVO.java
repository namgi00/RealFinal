package org.dawin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long no;
	private Long cno; // Comment의 no
	
	private String username;
	private String content;
	
	private Date regDate;
	private Date updateDate;

}
