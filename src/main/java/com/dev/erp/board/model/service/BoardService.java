package com.dev.erp.board.model.service;

import java.util.List;

import com.dev.erp.board.model.vo.Board;
import com.dev.erp.board.model.vo.BoardCategory;
import com.dev.erp.board.model.vo.BoardClub;




public interface BoardService {

	Board seletOneBoard(int boardNo);
	BoardCategory boardCategoryView(int categoryNo);
	int insertBoardCategory(BoardCategory boardCategory);
	List<Board> selectBoardType();

	List<BoardCategory> selectBoardCategoryList();
	
	
	


}
