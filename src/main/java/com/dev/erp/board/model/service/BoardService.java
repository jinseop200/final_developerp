package com.dev.erp.board.model.service;

import java.util.List;
import java.util.Map;

import com.dev.erp.board.model.vo.Board;
import com.dev.erp.board.model.vo.BoardCategory;




public interface BoardService {

	
	Board seletOneBoard(int boardNo);
	
	BoardCategory boardCategoryView(int categoryNo);
	
	int insertBoardCategory(BoardCategory boardCategory);
	

	List<Map<String, Object>> selectBoardCategoryList();

	List<Map<String,Object>> selectBoardClubList(int boardNo);

	List<Board> selectBoardList();

	List<Map<String,Object>> selectBoardAllList();
	
	
	


}
