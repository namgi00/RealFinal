package org.dawin.controller;

import java.io.IOException;

import javax.validation.Valid;

import org.dawin.domain.DonateVO;
import org.dawin.service.DonateService;
import org.dawin.service.ExchangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/donate")
@Controller
public class DonateController {
	
	@Autowired
	DonateService service;
	
	@Autowired
	ExchangeService exservice;
	
	@GetMapping("/donate")
	public void donateList(Model model) {
		
		log.info("=== donate page GetMapping 접속 중 ===");
		model.addAttribute("donateAmountList", service.getDonateAmountList());
		model.addAttribute("donateSelectList", service.getDonateSelectList());
		model.addAttribute("lists", exservice.exchangeData());
	}
	
	@PostMapping("/donate")
	public String donate(@Valid Errors errors) throws IOException {
		
		log.info("=== donate page PostMapping 접속 중 ===");
		// 처리 로직
		return "/donate";
	}

	@GetMapping("/payment")
	public void payment() {
		log.info("=== payment page GetMapping 접속 중 ===");
	}

	@PostMapping("/payment")
	public String payment(@Valid @ModelAttribute("donate") DonateVO donate, Errors errors, Model model) throws IOException {
		log.info("=== payment page PostMapping 접속 중 ===");
		if (errors.hasFieldErrors()) {
			return "donate/donate";
		}
		
		service.donateRegister(donate);
		return "/donate/payment"; // 성공적인 경우의 뷰 페이지
	}
	
	@GetMapping("/paysuccess")
	public void paysuccess() {
		log.info("=== paysuccess page GetMapping 접속 중 ===");
	}

}