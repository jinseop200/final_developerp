package com.dev.erp.board.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.board.model.service.BoardService;
import com.dev.erp.board.model.vo.Board;
import com.dev.erp.board.model.vo.BoardCategory;

@Controller
public class BoardController {

	static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping("/board/boardList.do")
	public ModelAndView selectBoardList(ModelAndView mav)
	{
		List<Map<String,Object>> boardCategoryList= new ArrayList<>();
		List<Board> boardList = new ArrayList<>();
		boardCategoryList = boardService.selectBoardCategoryList();	
		boardList = boardService.selectBoardList();
		
		
		mav.addObject("boardlist",boardCategoryList);
		mav.addObject("board",boardList);
		mav.setViewName("board/boardList");
		return mav;
	}
	@RequestMapping("/board/boardClubList.do")
	@ResponseBody
	public Map<String,Object> selectBoardClubList( @RequestParam("boardNo") int boardNo)
	{
		List<Map<String,Object>> boardClubList= new ArrayList<>();
		boardClubList = boardService.selectBoardClubList(boardNo);
		logger.debug("boardClubList={}",boardClubList);
		Map<String,Object> map = new HashMap<>();
		map.put("list", boardClubList);
		
		return map;
	}

	@RequestMapping("/board/insertBoardForm.do")
	public ModelAndView insertBoardForm(ModelAndView mav) {
		List<Board> board = new ArrayList<>();
		board = boardService.selectBoardType();
		mav.addObject("board",board);
		mav.setViewName("/board/insertBoardForm");
		return mav;
	}
	
	@RequestMapping("/board/enrollBoard.do")
	public ModelAndView InsertBoard(ModelAndView mav, 
												@RequestParam("categoryDate") Date categoryDate,
												@RequestParam("boardType") int boardType,
												@RequestParam("categoryTitle") String categoryTitle,
												@RequestParam("categoryComment") String categoryComment,
												@RequestParam("categoryWriter") String categoryWriter)
												{	
		BoardCategory boardCategory = new BoardCategory(0,boardType,categoryComment, categoryWriter,categoryTitle,"y",categoryDate);
		System.out.println("Dfffffffffffff"+boardCategory);
		int result = boardService.insertBoardCategory(boardCategory);
		logger.debug("category={}",categoryDate);
		mav.addObject("msg",result>0?"등록성공":"등록실패");
		mav.addObject("loc","/board/boardList.do");
		mav.setViewName("common/msg");
		return mav;
	}
	@RequestMapping("/board/boardDetailView.do")
	public ModelAndView documentDetailView(ModelAndView mav, @RequestParam("categoryNo") int categoryNo) {		
		Board board = new Board();
		BoardCategory boardCategory = new BoardCategory();
		boardCategory = boardService.boardCategoryView(categoryNo);
		logger.debug("boardCategory={}",boardCategory);
		mav.addObject("list",board);
		mav.addObject("categorylist",boardCategory);
		mav.setViewName("board/boardDetailView");
		
		return mav;
	}
	@RequestMapping("/board/boardAllList.do")
	@ResponseBody
	public Map<String,Object> boardAllList(){
		List<Map<String,Object>> boardCategoryList = new ArrayList<>();
		boardCategoryList = boardService.selectBoardAllList();
		Map<String,Object> map = new HashMap<>();
		logger.debug("boardCategoryList={}",boardCategoryList);
		map.put("list", boardCategoryList);
		return map;
		
	}

}
