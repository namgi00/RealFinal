package org.dawin.controller;

import org.dawin.service.ExchangeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@Autowired
	ExchangeService exservice;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@GetMapping(value = "/")
	public String home(Model model) {
		logger.info("=== home page 접속 중 ===");
		model.addAttribute("lists", exservice.exchangeData());
		return "home";
	}
}

