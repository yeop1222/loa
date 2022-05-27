package com.loa.mapper;

import org.apache.ibatis.annotations.Param;

import com.loa.model.CharDailyDTO;
import com.loa.model.RestDTO;

public interface CharDailyMapper {
	public CharDailyDTO getCharDaily(String name);
	public void eponaUpdate(CharDailyDTO dto);
	public RestDTO getRest(String name);
	public void initZero(String name);
	public void cRestUpdate(@Param("restChaos") int restChaos,
							@Param("restGuardian") int restGuardian,
							@Param("restEpona") int restEpona,
							@Param("name") String name);
	public void update(CharDailyDTO dto);
	public int showAdd(@Param("charName") String charName,
						@Param("eponaName") String eponaName);
}
