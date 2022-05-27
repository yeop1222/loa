package com.loa.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loa.model.CharDTO;
import com.loa.service.CharService;

@Controller
@RequestMapping("/char/*")
public class CharController {
	
	@Autowired
	private CharService service;
	
	@RequestMapping("/")
	public String listAll(Model model){
		model.addAttribute("list", service.charList());
		
		return "char/list";
	}

	@RequestMapping("/addChar")
	public String addChar(CharDTO dto, Model model) {
		
		String result = "캐릭터 추가 실패";
		if(service.addChar(dto) == 1) {
			result = "캐릭터 추가 완료";
		}
		
		model.addAttribute("result", result);
		
		return "char/addChar";
	}
	
	@RequestMapping("/deletePro")
	public String deletePro(String name, Model model) {
		
		String result = "캐릭터 삭제 실패";
		if(service.delete(name) == 1) {
			result = "캐릭터 삭제 완료";
		}
		model.addAttribute("result", result);
		
		return "char/deletePro";
	}

	@RequestMapping("/updateForm")
	public String updateForm(String name, Model model) {
		
		CharDTO dto = service.info(name);
		model.addAttribute("dto", dto);
		return "char/updateForm";
	}
	@RequestMapping("/updatePro")
	public String updatePro(CharDTO dto, Model model) {

		String result = "캐릭터 정보 수정 실패";
		if(service.update(dto) == 1) {
			result = "캐릭터 정보 수정 완료";
		}
		model.addAttribute("result", result);
		return "char/updatePro";
	}
}






