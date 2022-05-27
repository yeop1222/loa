package com.loa.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CharDailyDTO {
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date reg;
	private int chaos;
	private int guardian;
	private String epona1;
	private String epona2;
	private String epona3;
	private int eponav1;
	private int eponav2;
	private int eponav3;
	private int guild;
}
