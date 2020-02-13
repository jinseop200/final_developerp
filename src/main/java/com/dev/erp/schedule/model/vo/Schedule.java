package com.dev.erp.schedule.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Schedule {
	private String email;
	private String title;
	private String content;
	private String startScheduleTime;
	private String endScheduleTime;
	private char endTimeYN;
}
