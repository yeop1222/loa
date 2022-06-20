package com.loa.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loa.mapper.CharWeeklyMapper;
import com.loa.model.CharWeeklyDTO;

@Service
public class CharWeeklyServiceImpl implements CharWeeklyService{

	@Autowired
	private CharWeeklyMapper mapper;
	
	public void init(String charName) {
		
		CharWeeklyDTO dto = mapper.getCharWeekly(charName);
		
		//주 차이 계산
		Date currDate = new Date();
		Date saveDate = dto.getReg();
		int weekGap=0;
		if(currDate.getDay() < 3 || (currDate.getDay()==3 && currDate.getHours() < 6)) {
			//현재가 수요일 6시이전이면 -1
			weekGap--;
		}
		if(saveDate.getDay() < 3 || (saveDate.getDay()==3 && saveDate.getHours() < 6)) {
			//저장된 시간이 수요일 6시이전이면 +1
			weekGap++;
		}
		//주 차이 더함
		Date date1 = new Date(currDate.getYear(),currDate.getMonth(),currDate.getDate());
		Date date2 = new Date(saveDate.getYear(),saveDate.getMonth(),saveDate.getDate());
		weekGap += (int)((date1.getTime()-date2.getTime())/(86400000L*7));
		
		//주차이 1이상이면 레코드 초기화
		if(weekGap>0) {
			mapper.initWeekZero(charName);
		}
	}
	
	public CharWeeklyDTO info(String charName) {
		return mapper.getCharWeekly(charName);
	}
	
	public boolean update(CharWeeklyDTO dto) {
		
		boolean result=true;
		//유효성검사
		ArrayList<CharWeeklyDTO> list = mapper.getValid(dto.getCharName());
		list.add(dto);

		boolean g3=false;
		boolean g4=false;
		System.out.println();System.out.println();System.out.println();System.out.println();
		for(CharWeeklyDTO d : list) {
			System.out.println(d);
			//1. 한 캐릭이 군단장 3회초과해서 돈경우
			if((d.getGun1()>0?1:0) + (d.getGun2()>0?1:0) + (d.getGun3()>0?1:0) + (d.getGun4()>0?1:0) > 3) {
				result = false;
			}
			
			//2. 여러 캐릭이 1회성 컨텐츠(리허설,데자뷰) 두번이상 돈경우
			if(d.getGun3() == 1) {
				if(g3) {
					result=false;
				}else {
					g3=true;
				}
			}
			if(d.getGun4() == 1) {
				if(g4) {
					result=false;
				}else {
					g4=true;
				}
			}
			
		}
		System.out.println(result);
		if(result) {
			mapper.update(dto);
		}
		
		return result;
	}
}



