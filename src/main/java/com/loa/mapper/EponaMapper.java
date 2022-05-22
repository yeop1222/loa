package com.loa.mapper;

import java.util.List;

import com.loa.model.EponaDTO;

public interface EponaMapper {
	public List<EponaDTO> listAll();
	public EponaDTO info(String name);
	public int update(EponaDTO dto);
}
