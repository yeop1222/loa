package com.loa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loa.mapper.NpcMapper;
import com.loa.model.NpcDTO;
import com.loa.model.NpcRewardDTO;

@Service
public class NpcServiceImpl implements NpcService{

	@Autowired
	private NpcMapper mapper;
	
	public List<NpcDTO> listAll(String filter, String search){
		return mapper.listAll(filter,search);
	}

	@Override
	public int getSongScore(String name) {
		return mapper.getSongScore(name);
	}

	@Override
	public int getEmoteScore(String name) {
		return mapper.getEmoteScore(name);
	}

	@Override
	public NpcRewardDTO getReward(String name) {
		return mapper.getReward(name);
	}
}
