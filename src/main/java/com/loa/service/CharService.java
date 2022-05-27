package com.loa.service;

import java.util.List;

import com.loa.model.CharDTO;

public interface CharService {

	//캐릭터 추가
	public int addChar(CharDTO dto);
	//캐릭터 리스트 불러오기
	public List<CharDTO> charList();
	//캐릭 삭제
	public int delete(String name);
	//캐릭터 한개 정보 불러오기
	public CharDTO info(String name);
	//캐릭 정보 수정
	public int update(CharDTO dto);
}
