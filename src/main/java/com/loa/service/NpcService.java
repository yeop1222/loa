package com.loa.service;

import java.util.List;

import com.loa.model.NpcDTO;
import com.loa.model.NpcRewardDTO;

public interface NpcService {

	//전체 목록 받아다가 보여줌. 필터기능(정렬), 검색기능
	public List<NpcDTO> listAll(String filter, String search);
	//노래 이름 받으면 점수 리턴
	public int getSongScore(String name);
	//감정표현 이름 받으면 점수 리턴
	public int getEmoteScore(String name);
	//이름 파라미터로 받아서 호감도 달성 보상 리턴해줌
	public NpcRewardDTO getReward(String name);
}
