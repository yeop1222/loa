package com.loa.service;

import java.util.List;

import com.loa.model.EponaDTO;

public interface EponaService {
	
	//에포나 전체 데이터 불러옴
	public List<EponaDTO> listAll();
	
	//해당 에포나 정보 불러옴
	public EponaDTO info(String name);
	
	//에포나 정보 수정(횟수랑 캐릭만 수정가능)
	public int update(EponaDTO dto);
	
	//에포나 정보 수정시 daily content테이블도 수정
	public void dailyUpdate(List<String> charList);
}
