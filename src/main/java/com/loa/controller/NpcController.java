package com.loa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.loa.model.NpcDTO;
import com.loa.service.NpcService;

@Controller
@RequestMapping("npc/*")
public class NpcController {

	@Autowired
	private NpcService service;
	
	@RequestMapping("npc/")
	public String list(Model model, String filter, String search) {
		if(search!=null) {
			filter="-1";
		}
		if(filter==null) {
			filter="0";
		}
		model.addAttribute("filter", filter );
		model.addAttribute("search", search);
		
		List<NpcDTO> list = service.listAll(filter, search);
		for(NpcDTO d : list) {
			d.setSongsc1(service.getSongScore(d.getSong1()));
			if(d.getSong2() != null) {
				d.setSongsc2(service.getSongScore(d.getSong2()));
			}
			d.setEmotesc1(service.getEmoteScore(d.getEmote1()));
			if(d.getEmote2() != null) {
				d.setEmotesc2(service.getEmoteScore(d.getEmote2()));
			}
		}
		model.addAttribute("list", list);
		return "npc/list";
	}
	
	@RequestMapping("npc/reward")
	public String reward(String name, Model model) {
		model.addAttribute("dto", service.getReward(name));
		return "npc/reward";
	}
}
