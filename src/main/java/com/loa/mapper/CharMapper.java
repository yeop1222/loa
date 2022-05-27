package com.loa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.loa.model.CharDTO;

public interface CharMapper {

	public int addChar(CharDTO dto);
	public List<CharDTO> charList();
	public int delete(String name);
	public CharDTO info(String name);
	public int update(CharDTO dto);
}
