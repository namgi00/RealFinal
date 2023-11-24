package org.dawin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/")
@Controller
public class StoryController {
	
	@GetMapping("/story")
	public String story() {
		log.info("=== 소통게시판 접속 중 ===");
		return "story";
	}

}
