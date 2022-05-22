package com.loa.mapper;

import java.util.List;

import com.loa.model.EponaDTO;

public interface EponaMapper {
	public List<EponaDTO> listHasChar();
	public List<EponaDTO> listHasntChar();
	public EponaDTO info(String name);
	public int update(EponaDTO dto);
}
