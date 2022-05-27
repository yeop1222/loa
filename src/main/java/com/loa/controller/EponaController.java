package com.loa.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loa.model.EponaDTO;
import com.loa.service.CharDailyService;
import com.loa.service.EponaService;

@Controller
@RequestMapping("epona/*")
public class EponaController {
	private static final Logger logger = LoggerFactory.getLogger(EponaController.class);
	
	@Autowired
	private EponaService service;
	@Autowired
	private CharDailyService cds;
	
	@RequestMapping("epona/")
	public String list(Model model) {
		List<EponaDTO> list = service.listAll();
		//DailyDAO에서 불러와서 더하는과정
		for(EponaDTO dto : list) {
			if(dto.getCharic()==null) continue;
			dto.setCurrPoint(dto.getCurrPoint() + cds.showAdd(dto.getCharic(), dto.getName())) ;
		}
		
		model.addAttribute("list", list);
		return "epona/list";
	}

	@RequestMapping("epona/updateForm")
	public String updateForm(String name, Model model) {
		model.addAttribute("dto", service.info(name));
		return "epona/updateForm";
	}
	
	@RequestMapping("epona/updatePro")
	public String updatePro(EponaDTO dto, Model model) {
		String str = "에포나 진행도 수정 실패";
		if(service.update(dto) == 1) {
			str = "에포나 진행도 수정 완료";
		}
		//TODO 수정시 char_daily 테이블에도 수정할것
		//TODO 조건은 char_daily eponav1~3값 모두 off일때만 가능
		model.addAttribute("result", str);
		return "epona/updatePro";
	}
}
