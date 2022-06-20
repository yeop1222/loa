package com.loa.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CharWeeklyDTO {
	private String charName;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date reg;
	private int epona;
	private int oreha;
	private int kayangel;
	private int argos;
	private int gun1;
	private int gun2;
	private int gun3;
	private int gun4;
	
}
