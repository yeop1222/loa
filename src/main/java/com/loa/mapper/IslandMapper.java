package com.loa.mapper;

import java.util.List;

import com.loa.model.IslandDTO;

public interface IslandMapper {
	public List<IslandDTO> listAll();
	public int countGot();
	public IslandDTO info(int num);
	public int update(IslandDTO dto);
}
