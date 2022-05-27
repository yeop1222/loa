package com.loa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loa.model.CharDailyDTO;
import com.loa.service.CharDailyService;
import com.loa.service.CharService;

@Controller
@RequestMapping("/content/*")
public class ContentController {

	@Autowired
	private CharDailyService cds;
	@Autowired
	private CharService cs;
	
	@RequestMapping("/charDaily")
	public String charDaily(String wonOpt, String charOpt2, String name, Model model) {
		//페이지탭 옵션
		if(wonOpt==null) {
			wonOpt="0";
		}
		if(charOpt2==null) {
			charOpt2="1";
		}
		model.addAttribute("wonOpt", wonOpt);
		model.addAttribute("charOpt2", charOpt2);
		
		//초기화
		cds.init(name);
		//charDTO contentDTO
		model.addAttribute("ch", cs.info(name));
		model.addAttribute("co", cds.info(name));
		return "content/charDaily";
	}
	
	@RequestMapping("/charDailyPro")
	public String charDailyPro(String wonOpt, String charOpt2, Model model,
								String chaos1, String chaos2, String guardian1, String guardian2,
								CharDailyDTO dto) {
		
		if(chaos1==null) chaos1="0";
		if(chaos2==null) chaos2="0";
		if(guardian1==null) guardian1="0";
		if(guardian2==null) guardian2="0";
		
		dto.setChaos(Integer.parseInt(chaos1)+Integer.parseInt(chaos2));
		dto.setGuardian(Integer.parseInt(guardian1)+Integer.parseInt(guardian2));
		System.out.println(dto);
		
		cds.update(dto);
		
		//페이지탭 옵션
		if(wonOpt==null) {
			wonOpt="0";
		}
		if(charOpt2==null) {
			charOpt2="1";
		}
		model.addAttribute("wonOpt", wonOpt);
		model.addAttribute("charOpt2", charOpt2);
		model.addAttribute("charOpt", cs.info(dto.getName()).getOrders());
		
		return "content/charDailyPro";
	}
}
