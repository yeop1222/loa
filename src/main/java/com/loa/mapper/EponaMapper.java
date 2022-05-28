package com.loa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.loa.model.EponaDTO;

public interface EponaMapper {
	public List<EponaDTO> listHasChar();
	public List<EponaDTO> listHasntChar();
	public EponaDTO info(String name);
	public int update(EponaDTO dto);
	public List<String> charEponaList(String charName);
	public void updateCharEpona(@Param("epona1") String epona1,
								@Param("epona2") String epona2,
								@Param("epona3") String epona3,
								@Param("charic") String charic);
}
