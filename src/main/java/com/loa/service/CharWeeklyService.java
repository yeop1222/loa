package com.loa.service;

import com.loa.model.CharWeeklyDTO;

public interface CharWeeklyService {
	
	//매주 초기화
	public void init(String charName);
	//정보 불러오기
	public CharWeeklyDTO info(String charName);
	//정보 업데이트
	public boolean update(CharWeeklyDTO dto);
}
