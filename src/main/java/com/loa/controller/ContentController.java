package com.loa.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loa.model.CharDailyDTO;
import com.loa.model.WonDailyDTO;
import com.loa.service.CharDailyService;
import com.loa.service.CharService;
import com.loa.service.EponaService;
import com.loa.service.WonDailyService;

@Controller
@RequestMapping("/content/*")
public class ContentController {

	@Autowired
	private CharDailyService cds;
	@Autowired
	private CharService cs;
	@Autowired
	private EponaService es;
	@Autowired
	private WonDailyService wds;
	
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
		
		//에포나 완성되었으면 빨간색으로 표시해줄거임
		if(es.info(cds.info(name).getEpona1()).getCurrPoint() 
				== es.info(cds.info(name).getEpona1()).getSumPoint()) {
			model.addAttribute("e1", 1);
		}
		if(es.info(cds.info(name).getEpona2()).getCurrPoint() 
				== es.info(cds.info(name).getEpona2()).getSumPoint()) {
			model.addAttribute("e2", 1);
		}
		if(es.info(cds.info(name).getEpona3()).getCurrPoint() 
				== es.info(cds.info(name).getEpona3()).getSumPoint()) {
			model.addAttribute("e3", 1);
		}
		
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

	@RequestMapping("charWeekly")
	public String charWeekly(Model model, String name2) {
		model.addAttribute("name", name2);
		return "content/charWeekly";
	}
	@RequestMapping("charWeeklyPro")
	public String charWeeklyPro() {
		return "content/charWeeklyPro";
	}
	@RequestMapping("wonDaily")
	public String wonDaily(Model model, String charOpt, String charOpt2) {
		//페이지탭 옵션
		if(charOpt==null) {
			charOpt="1";
		}
		if(charOpt2==null) {
			charOpt2="1";
		}
		model.addAttribute("charOpt", charOpt);
		model.addAttribute("charOpt2", charOpt2);
		
		//초기화
		wds.init();
		//dto보내기
		model.addAttribute("co", wds.info());
		//요일정보 보내기
		model.addAttribute("day", new Date().getDay());
		//npc리스트 보내기
		model.addAttribute("npcList", wds.npcList());
		
		return "content/wonDaily";
	}
	@RequestMapping("wonDailyPro")
	public String wonDailyPro(Model model, WonDailyDTO dto,
								 String charOpt, String charOpt2) {
		
		wds.update(dto);
		
		//페이지탭 옵션
		if(charOpt==null) {
			charOpt="1";
		}
		if(charOpt2==null) {
			charOpt2="1";
		}
		model.addAttribute("wonOpt", 0);
		model.addAttribute("charOpt2", charOpt2);
		model.addAttribute("charOpt", charOpt);
		
		return "content/wonDailyPro";
	}
	@RequestMapping("wonWeekly")
	public String wonWeekly() {
		return "content/wonWeekly";
	}
	@RequestMapping("wonWeeklyPro")
	public String wonWeeklyPro() {
		return "content/wonWeeklyPro";
	}
}
