package org.dawin.controller;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Map;

import org.dawin.domain.Criteria;
import org.dawin.domain.NoticeVO;
import org.dawin.domain.PageDTO;
import org.dawin.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		// 현재시간 값을 받는 변수를 생성해서
		// 그걸 이제 모델에 담아서 noticewrite.jsp에 보낸다.
		LocalDate date = LocalDate.now();
		notice.setNoticeDate(date.toString());
		log.info("시간확인" + notice.getNoticeDate());
		
	}

	@PostMapping("/noticewrite")
	public String noticewrite(
			@ModelAttribute("notice") NoticeVO notice,
			RedirectAttributes rttr) throws Exception {
		
		log.info("타이틀 " + notice.getNoticeTitle());
		log.info("타이틀 " + notice.getNoticeContent());
		log.info("타이틀 " + notice.getNoticeDate());
		
		service.register(notice);

		rttr.addFlashAttribute("result", notice.getNoticeNo());

		return "redirect:/notice/notice";
	}
	
	
	@GetMapping({ "/noti-get","/noti-modify" })
	public void get(
			@RequestParam("no") Long noticeNo, @ModelAttribute("cri") Criteria cri,
			Model model) {

		model.addAttribute("notice", service.get(noticeNo));
	}
	
	@PostMapping("/noti-modify")
	public String modify(@ModelAttribute("notice") NoticeVO notice,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {
		
		log.info("noti-modify:" + notice);

		if (service.modify(notice)) {
			// Flash --> 1회성
			rttr.addFlashAttribute("result", "success");
//			rttr.addAttribute("bno", board.getBno());
//			rttr.addAttribute("pageNum", cri.getPageNum());
//			rttr.addAttribute("amount", cri.getAmount());
//			rttr.addAttribute("type", cri.getType());
//			rttr.addAttribute("keyword", cri.getKeyword());
		}
		
		return "redirect:" + cri.getLinkWithNoticeid("/notice/noti-get", notice.getNoticeNo());
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("noticeNo") Long noticeNo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		log.info("remove..." + noticeNo);
		if (service.remove(noticeNo)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
		}
		return "redirect:" + cri.getLink("/notice/notice");
	}
	
	
	
}
