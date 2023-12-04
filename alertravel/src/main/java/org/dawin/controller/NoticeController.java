package org.dawin.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;

import org.dawin.domain.Criteria;
import org.dawin.domain.NoticeVO;
import org.dawin.domain.PageDTO;
import org.dawin.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@ModelAttribute("searchTypes")
	public Map<String, String> searchTypes() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("", "-- 검색대상선택 --");
		map.put("T", "제목");
		map.put("C", "내용");
		map.put("TC", "제목+내용");
		
		return map;
	}
	
	@GetMapping("/notice")
	public void notice(@ModelAttribute("cri") Criteria cri,
			Model model) {
		
		log.info("=== 공지사항notice 접속 중 ===");
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@GetMapping("/noticewrite")
	public void noticewrite(@ModelAttribute("notice") NoticeVO notice) {	
	}

	@PostMapping("/noticewrite")
	public String noticewrite(
			@Valid @ModelAttribute("notice") NoticeVO notice,
			Errors errors,			
			RedirectAttributes rttr) throws Exception {

		log.info("register: " + notice);
		if(errors.hasErrors()) {
			return "notice/noticewrite";
		}

		service.register(notice);

		rttr.addFlashAttribute("result", notice.getNoticeNo());

		return "redirect:/notice/notice";
	}
	
	
	@GetMapping({ "/noti-get" })
	public void get(
			@RequestParam("no") Long noticeNo,
			Model model) {

		model.addAttribute("noticeNo", service.get(noticeNo));
	}
	
}
