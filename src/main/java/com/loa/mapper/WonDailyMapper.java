package com.loa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.loa.model.NpcDTO;
import com.loa.model.WonDailyDTO;

public interface WonDailyMapper {
	public WonDailyDTO getWonDaily();
	public void npcUpdate(@Param("npcName") String npcName,
							@Param("value") int value);
	public void initDayZero();
	public void initWeekZero();
	public List<NpcDTO> npcList();
	
}
