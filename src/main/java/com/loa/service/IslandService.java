package com.loa.service;

import java.util.List;

import com.loa.model.IslandDTO;

public interface IslandService {
	
	//섬마 전체 테이블 읽어서 보여줌
	public List<IslandDTO> listAll();
	
	//획득한 섬마 갯수 불러오기
	public int countGot();
	
	//섬마 정보 불러오기
	public IslandDTO info(int num);
	
	//섬마 획득정보 수정
	public int update(IslandDTO dto);
}
