package org.dawin.controller;

import java.time.LocalDateTime;

import org.dawin.common.NoticePagination;
import org.dawin.domain.NoticeVO;
import org.dawin.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	
	@Autowired
	NoticeMapper mapper;
	
	@GetMapping("/notice")
	public String notice(Model model
			,@RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range) {
		
		int listCnt = mapper.noticeCnt();
		NoticePagination pagination = new NoticePagination();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", mapper.getNoticeList(pagination));
		log.info("=== 공지사항notice 접속 중 ===");
		return "/notice/notice";
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
		log.info("=== 공지사항 글쓰기 접속 중 ===");
		return "redirect:/notice/notice";
	}
	
	@GetMapping({ "/noti-get" })
	public void get(
			@RequestParam("no") int noticeNO,
			Model model) {

		model.addAttribute("noticeNo", mapper.read(noticeNO));
	}
}
