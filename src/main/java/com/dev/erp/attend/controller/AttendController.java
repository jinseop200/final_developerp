package com.dev.erp.attend.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.attend.model.service.AttendService;


@Controller
public class AttendController {
	@Autowired
	AttendService attendService;

	static final Logger logger 
	= LoggerFactory.getLogger(AttendController.class);
	
	@RequestMapping("/attend/attendList.do")
	public ModelAndView selectBoardList(ModelAndView mav) {

		mav.setViewName("gw/attendCal");
		return mav;
	}
	@RequestMapping("/attend/attendForm.do")
	public ModelAndView showAttendForm(ModelAndView mav, @RequestParam String date
										) {
		System.out.println("dddddd"+date);
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
		mav.addObject("date",date);
		mav.setViewName("gw/attendForm");
		return mav;
	}
	@RequestMapping("/attend/attendant.do")
	public ModelAndView attendant(ModelAndView mav, @RequestParam String date,@RequestParam String email
			) {
System.out.println("dddddd"+date);
System.out.println("dddddd"+email);

int result=attendService.attendant(email);

//mav.addObject("totalContents", totalContents);
//mav.addObject("date",date);
//mav.setViewName("gw/attendForm");
mav.addObject("msg", result>0?"출석 성공!":"출석 실패!");
mav.addObject("loc", "/attend/attendForm.do");
mav.setViewName("common/msg");
return mav;

}
}
