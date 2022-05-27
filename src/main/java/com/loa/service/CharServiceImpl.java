package com.loa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loa.mapper.CharMapper;
import com.loa.model.CharDTO;

@Service
public class CharServiceImpl implements CharService{

	@Autowired
	private CharMapper mapper;
	
	@Override
	public int addChar(CharDTO dto) {
		return mapper.addChar(dto);
	}

	@Override
	public List<CharDTO> charList() {
		return mapper.charList();
	}

	@Override
	public int delete(String name) {
		return mapper.delete(name);
	}

	@Override
	public CharDTO info(String name) {
		return mapper.info(name);
	}

	@Override
	public int update(CharDTO dto) {
		return mapper.update(dto);
	}
	
}
