package com.dev.erp.attend.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;





@Controller
public class AttendController {

	static final Logger logger 
	= LoggerFactory.getLogger(AttendController.class);
	
	@RequestMapping("/attend/attendList.do")
	public ModelAndView selectBoardList(ModelAndView mav
										) {
//		final int numPerPage = 10;
//		
//		//1.업무로직
//		List<Board> list = boardService.selectBoardList(cPage, numPerPage);
//		logger.debug("list={}", list);
//		int totalContents = boardService.selectTotalContents();
//		
//		//2.view model처리
//		mav.addObject("list", list);
//		mav.addObject("numPerPage", numPerPage);
//		mav.addObject("cPage", cPage);
//		mav.addObject("totalContents", totalContents);
		
		mav.setViewName("gw/attendCal");
		return mav;
	}
}
