package com.loa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loa.mapper.EponaMapper;
import com.loa.model.EponaDTO;

@Service
public class EponaServiceImpl implements EponaService{
	
	@Autowired
	private EponaMapper mapper;

	@Override
	public List<EponaDTO> listAll() {
		return mapper.listAll();
	}

	@Override
	public EponaDTO info(String name) {
		return mapper.info(name);
	}

	@Override
	public int update(EponaDTO dto) {
		return mapper.update(dto);
	}
}
