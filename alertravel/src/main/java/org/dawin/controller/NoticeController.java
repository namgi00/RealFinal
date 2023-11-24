package org.dawin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/")
@Controller
public class NoticeController {
	
	@GetMapping("/notice")
	public void notice() {
		log.info("=== 공지사항 접속 중 ===");
	}

}
