package com.loa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loa.mapper.IslandMapper;
import com.loa.model.IslandDTO;

@Service
public class IslandServiceImpl implements IslandService{

	@Autowired
	private IslandMapper mapper;
	
	@Override
	public List<IslandDTO> listAll() {
		return mapper.listAll();
	}

	@Override
	public int countGot() {
		return mapper.countGot();
	}

	@Override
	public IslandDTO info(int num) {
		return mapper.info(num);
	}

	@Override
	public int update(IslandDTO dto) {
		return mapper.update(dto);
	}

}
