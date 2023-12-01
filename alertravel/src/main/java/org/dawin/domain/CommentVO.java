package org.dawin.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CommentVO {
	private Long no;
	private Long postid;
	private String username;
	private String content;
	private Date regDate;
	private Date updateDate;
	
	List<ReplyVO> replyList;
}
