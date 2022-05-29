package com.loa.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.loa.mapper.CharDailyMapper;
import com.loa.model.CharDailyDTO;
import com.loa.model.RestDTO;

@Service
public class CharDailyServiceImpl implements CharDailyService {

	@Autowired
	private CharDailyMapper mapper;

	@Override
	public CharDailyDTO init(String charName) {

		CharDailyDTO dto = mapper.getCharDaily(charName);
		
		//날짜차이 계산
		int dateGap=0;
		Date currDate = new Date();
		if(currDate.getHours() < 6) {
			//현재시간이 6시이전이면 -1
			dateGap--;
		}
		Date saveDate = dto.getReg();
		if(saveDate.getHours() < 6) {
			//저장된시간이 6시이전이면 +1
			dateGap++;
		}
		//날짜차이 더함
		dateGap += (int)((currDate.getTime()-saveDate.getTime())/86400000);
		
		//날짜차이 1이상이면 해당 레코드 초기화하고 각 테이블(에포나,캐릭터 휴식게이지)에 값 저장
		if(dateGap > 0) {
			//에포나 증가
			mapper.eponaUpdate(dto);
			
			//휴식게이지 증가
			//휴식게이지 값 불러오기
			RestDTO restDTO = mapper.getRest(charName);
			//카오스
			int r = restDTO.getRestChaos();
			for(int i=0; i<dto.getChaos(); i++) {
				if(r>=20) {
					restDTO.setRestChaos(r-20);
				}else {
					break;
				}
			}
			restDTO.setRestChaos(Math.min(r+(2-dto.getChaos())*10+(dateGap-1)*20, 100));
			//가디언
			r = restDTO.getRestGuardian();
			for(int i=0; i<dto.getGuardian(); i++) {
				if(r>=20) {
					restDTO.setRestGuardian(r-20);
				}else {
					break;
				}
			}
			restDTO.setRestGuardian(Math.min(r+(2-dto.getGuardian())*10+(dateGap-1)*20, 100));
			//에포나
			r = restDTO.getRestEpona();
			int j = dto.getEponav1()+dto.getEponav2()+dto.getEponav3();
			for(int i=0; i<j; i++) {
				if(r>=20) {
					restDTO.setRestEpona(r-20);
				}else {
					break;
				}
			}
			restDTO.setRestEpona(Math.min(r+(3-j)*10+(dateGap-1)*30, 100));
			
			//레코드 초기화
			dto.setChaos(0);
			dto.setGuardian(0);
			dto.setEponav1(0);
			dto.setEponav2(0);
			dto.setEponav3(0);
			dto.setGuild(0);
			mapper.initZero(charName);
			mapper.cRestUpdate(restDTO.getRestChaos(), restDTO.getRestGuardian(), restDTO.getRestEpona(), charName);
			
		}
		
		
		return dto;
	}
	
	public CharDailyDTO info(String name) {
		return mapper.getCharDaily(name);
	}
	
	public void update(CharDailyDTO dto) {
		mapper.update(dto);
	}
	
	public int showAdd(String charName, String eponaName) {
		return mapper.showAdd(charName, eponaName);
	}
}








