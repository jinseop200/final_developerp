package com.dev.erp.board.model.vo;

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
public class BoardLine {

	private int lineNo;
	private int docNo;
	private int typeNo;
	private String prevWriter;
	private String nextWriter;
	private String returnYn;
}