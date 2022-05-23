package com.loa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.loa.model.NpcDTO;
import com.loa.model.NpcRewardDTO;

public interface NpcMapper {
	public List<NpcDTO> listAll(@Param("filter") String filter, 
								@Param("search") String search);
	public int getSongScore(String name);
	public int getEmoteScore(String name);
	public NpcRewardDTO getReward(String name); 
}
