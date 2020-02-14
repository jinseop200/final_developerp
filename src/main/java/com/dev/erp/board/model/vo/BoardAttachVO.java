package com.dev.erp.board.model.vo;

import java.sql.Date;
import java.util.List;
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


public class BoardAttachVO {

	
	private int boardNo;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private Date boardDate;
	private int readCount;
	
	//가상컬럼:첨부파일개수
	private int fileCount;
	
	List<Attachment>attachmentList;
}
