package org.dawin.controller;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.dawin.domain.BoardAttachmentVO;
import org.dawin.domain.BoardVO;
import org.dawin.domain.Criteria;
import org.dawin.domain.PageDTO;
import org.dawin.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	@GetMapping("/register")
	public void register(@ModelAttribute("board") BoardVO board) {	
	}

	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("board") BoardVO board,
			Errors errors,			
			List<MultipartFile> files,
			RedirectAttributes rttr) throws Exception {

		log.info("register: " + board);
		if(errors.hasErrors()) {
			return "board/register";
		}

		service.register(board, files);

		rttr.addFlashAttribute("result", board.getPostid());

		return "redirect:/board/list";
	}
	

	@PostMapping("/modify")
	public String modify(
			@Valid @ModelAttribute("board") BoardVO board,
			Errors errors,
			List<MultipartFile> files,
			@ModelAttribute("cri") Criteria cri,			
			RedirectAttributes rttr) throws Exception {
		
		log.info("modify:" + board);

		if(errors.hasErrors()) {
			return "board/modify";
		}		
		
		
		if (service.modify(board, files)) {
			// Flash --> 1회성
			rttr.addFlashAttribute("result", "success");

		}
//		return "redirect:/board/get";
		return "redirect:" + cri.getLinkWithPostid("/board/get", board.getPostid());
		
		

	}	
	

	@PostMapping("/remove")
	public String remove(
			@RequestParam("postid") Long postId, 
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
	
		log.info("remove..." + postId);
		if (service.remove(postId)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list" + cri.getLink();

	}
	
	//파일 다운로드
	@GetMapping("/download/{no}")
	@ResponseBody // view를 사용하지 않고, 직접 내보냄
	public void download(
	@PathVariable("no") Long no, 
	HttpServletResponse response) throws Exception {
		
	BoardAttachmentVO attach = service.getAttachment(no);
	 if (attach != null) {
	        attach.download(response);
	    } else {
	        // attach가 null인 경우에 대한 예외 처리
	        // 예를 들어, 적절한 에러 메시지 출력 또는 처리 로직 추가
	    }
	}
	
	//파일 삭제
	@DeleteMapping("/remove/attach/{no}")
	@ResponseBody
	public String removeAttach(@PathVariable("no") Long no) throws Exception {
	service.removeAttachment(no);
	return "OK";
	}


}
