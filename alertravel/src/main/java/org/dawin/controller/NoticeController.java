package org.dawin.controller;

import java.time.LocalDateTime;

import org.dawin.domain.NoticeVO;
import org.dawin.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeMapper mapper;
	
	@GetMapping("/notice")
	public void notice() {
		log.info("=== 공지사항 접속 중 ===");
	}
	
	@GetMapping("/noticewrite")
	public void noticewrite() {
		log.info("=== 공지사항 접속 중 ===");
	}
	
	@GetMapping("/noticewrite2")
	public String noticewrite2(NoticeVO noticeVO) {
		
		NoticeVO noticeboard = new NoticeVO();
		noticeboard.setNoticeTitle(noticeVO.getNoticeTitle());
		noticeboard.setNoticeContent(noticeVO.getNoticeContent());
		noticeboard.setNoticeDate(LocalDateTime.now());
		mapper.insert(noticeboard);
		log.info(noticeboard);
		log.info("=== 공지사항1111 접속 중 ===");
		return "redirect:/notice/notice";
	}
	


}
