package com.loa.mapper;

import java.util.ArrayList;

import com.loa.model.CharWeeklyDTO;

public interface CharWeeklyMapper {
	
	public CharWeeklyDTO getCharWeekly(String charName);
	public double getLev(String charName);
	public void initWeekZero(String charName);
	public void update(CharWeeklyDTO dto);
	public ArrayList<CharWeeklyDTO> getValid(String charName);
}
