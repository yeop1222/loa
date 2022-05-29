package com.loa.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class WonDailyDTO {

	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date reg;
	private int island;
	private int bitan;
	private int chaosGate;
	private int boss;
	private int pkIsland;
	private int ghostShip;
	private int rowen;
	private int thulubik;

	private String npc1;
	private String npc2;
	private String npc3;
	private String npc4;
	private String npc5;
	private String npc6;
	private int npcValue; //비트별로 0~3비트=npc1 4~7=npc2 ...
	
}
