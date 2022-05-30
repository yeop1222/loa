package com.loa.service;

import java.util.List;

import com.loa.model.NpcDTO;
import com.loa.model.WonDailyDTO;

public interface WonDailyService {
	//일간 원정대 초기화
	public void init();
	//일간 원정대 컨텐츠 정보
	public WonDailyDTO info();
	//호감작 중인 npc이름 리스트
	public List<NpcDTO> npcList();
	//submit눌렀을때 db에 업데이트
	public void update(WonDailyDTO dto);
}
