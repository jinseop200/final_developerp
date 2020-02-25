package com.dev.erp.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.board.model.dao.BoardDAO;
import com.dev.erp.board.model.vo.Board;
import com.dev.erp.board.model.vo.BoardCategory;


@Service
public class BoardServiceImpl implements BoardService {
	

	@Autowired
	BoardDAO boardDAO;
	

	@Override
	public int insertBoardCategory(BoardCategory boardCategory) {
		return boardDAO.insertBoardCategory(boardCategory);
	}

	@Override
	public List<Map<String, Object>> selectBoardCategoryList() {
		return boardDAO.selectBoardCategoryList();
			
		}

	@Override
	public Board seletOneBoard(int boardNo) {
		return boardDAO.seletOneBoard(boardNo);
	}

	

	@Override
	public BoardCategory boardCategoryView(int categoryNo) {
		return boardDAO.boardCategoryView(categoryNo);
	}

	@Override
	public List<Map<String,Object>> selectBoardClubList(int boardNo) {
		return boardDAO.selectBoardClubList(boardNo);
	}

	@Override
	public List<Board> selectBoardList() {
		return boardDAO.selectBoardList();
	}

	@Override
	public List<Map<String,Object>> selectBoardAllList() {
		return boardDAO.selectBoardAllList();
	}

	@Override
	public List<Board> selectBoardType() {
		return boardDAO.selectBoardType();
	}





	


}








