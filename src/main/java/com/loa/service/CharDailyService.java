package com.loa.service;

import com.loa.model.CharDailyDTO;

public interface CharDailyService {
	
	//페이지 불러올때 수행
	//현재 시간이랑 DB테이블에 저장했던 시간이랑 연산해서
	//저장+초기화 or 값 로드
	public CharDailyDTO init(String charName);
	//name 아이디 DailyDTO정보 불러오기
	public CharDailyDTO info(String name);
	//submit눌렀을때 정보 업데이트
	public void update(CharDailyDTO dto);
	//에포나 리스트 보여줄때 epona+chardaily 합쳐서 보여줌
	//chardaily불러오는 부분
	public int showAdd(String charName, String eponaName);
}
