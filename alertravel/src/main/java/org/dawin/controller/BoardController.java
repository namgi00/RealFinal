package org.dawin.controller;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;

import org.dawin.domain.BoardVO;
import org.dawin.domain.Criteria;
import org.dawin.domain.PageDTO;
import org.dawin.service.BoardService;
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
@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	
	@ModelAttribute("searchTypes")
	public Map<String, String> searchTypes() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("", "-- 검색대상선택 --");
		map.put("R", "권역");
		map.put("T", "제목");
		map.put("D", "내용");
		map.put("TD", "제목+내용");
		map.put("TR", "권역+제목");
		map.put("TRD", "권역+제목+내용");
		
		return map;
	}
	
	@GetMapping("/list")
	public void list(
			@ModelAttribute("cri") Criteria cri,
			Model model) {
		log.info("=== 소통게시판 접속 중 ===");
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
		
	
	@GetMapping({ "/get", "/modify" })
	public void get(
			@RequestParam("postid") Long postId,
			@ModelAttribute("cri") Criteria cri,
			Principal principal,
			Model model) {

		model.addAttribute("board", service.get(postId));
	}
	

	@PostMapping("/modify")
	public String modify(
			@Valid @ModelAttribute("board") BoardVO travel,
			Errors errors,
			@ModelAttribute("cri") Criteria cri,			
			RedirectAttributes rttr) {

		if(errors.hasErrors()) {
			return "board/modify";
		}
		
		service.modify(travel);

		return "redirect:" + cri.getLink("/board/get") +
				"&postid=" + travel.getPostid();
		

	}	
	
	@GetMapping("/register")
	public void register(@ModelAttribute("board") BoardVO board) {	
	}

	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("board") BoardVO board,
			Errors errors,			
			RedirectAttributes rttr) {
		
		if(errors.hasErrors()) {		// 유효성 검사 실패하면 
			return "board/register";	// view의 이름 리턴 - forwarding
		}
		
		service.register(board);
		
		return "redirect:/board/list";
	}
	

	@PostMapping("/remove")
	public String remove(
			@RequestParam("postid") Long postId, 
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
	
		service.remove(postId);
		return "redirect:/board/list" + cri.getLink();

	}

}
