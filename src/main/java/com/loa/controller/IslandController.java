package com.loa.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loa.model.IslandDTO;
import com.loa.service.IslandService;

@Controller
@RequestMapping("/island/*")
public class IslandController {

	private static final Logger logger = LoggerFactory.getLogger(IslandController.class);
	
	@Autowired
	private IslandService service;
	
	@RequestMapping("island/")
	public String list(Model model) {
		
		final int ISLAND_TOTAL = 95;
		model.addAttribute("ISLAND_TOTAL", ISLAND_TOTAL);
		model.addAttribute("count", service.countGot());

		model.addAttribute("list", service.listAll());
		return "island/list";
	}

	@RequestMapping("island/updateForm")
	public String updateForm(int num, Model model) {
		model.addAttribute("num", num);
		model.addAttribute("dto", service.info(num));
		return "island/updateForm";
	}
	
	@RequestMapping("island/updatePro")
	public String updatePro(IslandDTO dto, Model model) {
		String str="섬의 마음 수정 실패";
		if(service.update(dto) == 1) {
			str = "섬의 마음 수정 완료";
		}
		model.addAttribute("result", str);
		return "island/updatePro";
	}
}






