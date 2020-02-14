package com.dev.erp.board.model.service;

import java.util.List;

import com.dev.erp.board.model.vo.Board;
import com.dev.erp.board.model.vo.BoardCategory;




public interface BoardService {

	List<BoardCategory> selectBoardCategoryList();
	Board seletOneBoard(int boardNo);
	List<Board> selectBoardType();
	int insertBoardCategory(BoardCategory boardCategory);
	BoardCategory boardCategoryView(int categoryNo);
	


}
