package org.dawin.controller;

import org.dawin.service.AlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/alarm")
public class AlarmController {

	@Autowired
	private AlarmService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list: ");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/listLvl")
	public void listLvl(Model model, @RequestParam("alarmLvl") Long alarmLvl) {
		log.info("list: ");
		model.addAttribute("list", service.getListLvl(alarmLvl));
	}
	
	
	
	@GetMapping("/get")
	public void get(@RequestParam("countryNm") String countryNm, Model model) {
		
		log.info("/get");
		model.addAttribute("alarm", service.get(countryNm));
		model.addAttribute("basic", service.getBasic(countryNm));
		
		log.info("컨트롤러" + service.getBasic(countryNm));
		
	}
	
}
