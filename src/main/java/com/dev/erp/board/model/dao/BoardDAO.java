package com.dev.erp.board.model.dao;

import java.util.List;
import java.util.Map;

import com.dev.erp.board.model.vo.Board;
import com.dev.erp.board.model.vo.BoardCategory;

public interface BoardDAO {

	
	int insertBoardCategory(BoardCategory boardCategory);

	List<Map<String, Object>> selectBoardCategoryList();

	Board seletOneBoard(int boardNo);



	BoardCategory boardCategoryView(int categoryNo);

	List<Map<String,Object>> selectBoardClubList(int boardNo);

	List<Board> selectBoardList();

	List<Map<String,Object>> selectBoardAllList();


	



	

	
}
