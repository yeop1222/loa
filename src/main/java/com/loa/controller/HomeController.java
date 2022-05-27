package com.loa.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loa.service.CharService;

@Controller
public class HomeController {
	
	@Autowired
	private CharService cs;

	@RequestMapping("/")
	public String home(String wonOpt, String charOpt, String charOpt2, Model model) {
		
		//페이지탭 옵션
		if(wonOpt==null) {
			wonOpt="0";
		}
		if(charOpt==null) {
			charOpt="1";
		}
		if(charOpt2==null) {
			charOpt2="1";
		}
		model.addAttribute("wonOpt", wonOpt);
		model.addAttribute("charOpt", charOpt);
		model.addAttribute("charOpt2", charOpt2);
		
		//캐릭터 리스트
		model.addAttribute("charList", cs.charList());
		
		return "home";
	}
	
}
