package com.dev.erp.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.erp.board.model.vo.Board;
import com.dev.erp.board.model.vo.BoardCategory;
import com.dev.erp.board.model.vo.BoardClub;

	@Repository
	public class BoardDAOImpl implements BoardDAO {

		@Autowired
		SqlSessionTemplate sqlSession;

		@Override
		public int insertBoardCategory(BoardCategory boardCategory) {
			return sqlSession.insert("board.insertBoardCategory",boardCategory);
		}

		@Override
		public List<BoardCategory> selectBoardCategoryList() {
			return sqlSession.selectList("board.selectBoardCategoryList");
		}

		@Override
		public Board seletOneBoard(int boardNo) {
			return sqlSession.selectOne("board.seletOneBoard",boardNo);
		}

		@Override
		public List<Board> selectBoardType() {
			return sqlSession.selectList("board.selectBoardType");
		}

		@Override
		public BoardCategory boardCategoryView(int categoryNo) {
			return sqlSession.selectOne("board.boardCategoryView",categoryNo);
		}

		/*@Override
		public List<BoardClub> selectBoardClubList(int boardNo) {
			return sqlSession.selectList("board.selectBoardClubList",boardNo);
		}	*/
}
