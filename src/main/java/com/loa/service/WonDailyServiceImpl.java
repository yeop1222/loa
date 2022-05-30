package com.loa.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loa.mapper.WonDailyMapper;
import com.loa.model.NpcDTO;
import com.loa.model.WonDailyDTO;

@Service

public class WonDailyServiceImpl implements WonDailyService {
	
	@Autowired
	private WonDailyMapper mapper;

	@Override
	public void init() {
		
		WonDailyDTO dto = mapper.getWonDaily();
		
		//날짜,주 차이 계산
		Date currDate = new Date();
		int dateGap=0;
		int weekGap=0;
		if(currDate.getHours() < 6) {
			//현재시간이 6시이전이면 -1
			dateGap--;
		}
		if(currDate.getDay() < 3 || (currDate.getDay()==3 && currDate.getHours() < 6)) {
			//현재가 수요일 6시이전이면 -1
			weekGap--;
		}
		Date saveDate = dto.getReg();
		if(saveDate.getHours() < 6) {
			//저장된시간이 6시이전이면 +1
			dateGap++;
		}
		if(saveDate.getDay() < 3 || (saveDate.getDay()==3 && saveDate.getHours() < 6)) {
			//저장된 시간이 수요일 6시이전이면 +1
			weekGap++;
		}
		//날짜차이 더함
		dateGap += (int)((currDate.getTime()-saveDate.getTime())/86400000);
		//주 차이 더함
		weekGap += (int)((currDate.getTime()-saveDate.getTime())/(86400000L*7));
		
		//날짜차이 1이상이면 레코드 초기화(모험섬, 비탄, 카게, 보스, pk섬, 호감도)하고
		//호감도 테이블 업데이트
		if(dateGap > 0) {
			// TODO 호감도 증가하는지 확인
			if(dto.getNpc1() != null) {
				int value = dto.getNpcValue() & 0xf;
				mapper.npcUpdate(dto.getNpc1(), value);
			}
			if(dto.getNpc2() != null) {
				int value = (dto.getNpcValue() & 0xf0)>>>4;
				mapper.npcUpdate(dto.getNpc2(), value);
			}
			if(dto.getNpc3() != null) {
				int value = (dto.getNpcValue() & 0xf00)>>>8;
				mapper.npcUpdate(dto.getNpc3(), value);
			}
			if(dto.getNpc4() != null) {
				int value = (dto.getNpcValue() & 0xf000)>>>12;
				mapper.npcUpdate(dto.getNpc4(), value);
			}
			if(dto.getNpc5() != null) {
				int value = (dto.getNpcValue() & 0xf0000)>>>16;
				mapper.npcUpdate(dto.getNpc5(), value);
			}
			if(dto.getNpc6() != null) {
				int value = (dto.getNpcValue() & 0xf00000)>>>20;
				mapper.npcUpdate(dto.getNpc6(), value);
			}
			
			
			//레코드 초기화
			mapper.initDayZero();
		}
				
		//주차이 1이상이면 레코드 초기화(유령선, 로웬, 툴루비크)
		if(weekGap>0) {
			//레코드 초기화
			mapper.initWeekZero();
		}
	}

	@Override
	public WonDailyDTO info() {
		return mapper.getWonDaily();
	}
	
	@Override
	public List<NpcDTO> npcList(){
		return mapper.npcList();
	}
	
	@Override
	public void update(WonDailyDTO dto) {
		mapper.update(dto);
	}
}









