package com.dev.erp.attend.controller;

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

import com.dev.erp.attend.model.service.AttendService;
import com.dev.erp.attend.model.vo.Attend;


@Controller
public class AttendController {
	@Autowired
	AttendService attendService;

	static final Logger logger 
	= LoggerFactory.getLogger(AttendController.class);

	@RequestMapping("/attend/attendList.do")
	public ModelAndView attendList(ModelAndView mav,@RequestParam String email) {
		System.out.println("fdsafdassdfas"+email);
		List<Attend> list= attendService.attendShow(email);
		System.out.println("fdfddf"+list);
		String content="";
		for(Attend a:list) {
			if(a.getAttendStart()!=null)
				content+=",{title:'출근:"+a.getAttendStart()+"',start:'"+a.getAttendStartForm()+"'}";
			if(a.getAttendEnd()!=null)
				content+=",{title:'퇴근:"+a.getAttendEnd()+"',start:'"+a.getAttendEndForm()+"'}";
		}

		mav.addObject("content",content);
		mav.setViewName("gw/attendCal");
		return mav;
	}
	@RequestMapping("/attend/attendShow.do")
	@ResponseBody
	public Map<String,String> attendShow(ModelAndView mav,@RequestParam String email) {
		List<Attend> list= attendService.attendShow(email);
		System.out.println("fdfddf"+list);
		String content="";
		for(Attend a:list) {
			if(a.getAttendStart()!=null)
				content+=",{title:'출근',start:'"+a.getAttendStartForm()+"'},{title:'"+a.getAttendStart()+"',start:'"+a.getAttendStartForm()+"'}";

		}   	
		System.out.println(content);
		Map<String,String> map =new HashMap<>();
		map.put("content",content);

		return map;

	}
	@RequestMapping("/attend/attendForm.do")
	public ModelAndView showAttendForm(ModelAndView mav, @RequestParam String date,@RequestParam String email
			) {
		System.out.println("dddddd"+date);
		System.out.println("eaaaaaa"+email);
		Attend attend=new Attend(email,"",date,"","","","");
		String attendDate=attendService.checkAttend(attend);
		System.out.println(attendDate);
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
		mav.addObject("attendDate",attendDate);
		mav.setViewName("gw/attendForm");
		return mav;
	}
	@RequestMapping("/attend/attendant.do")
	public ModelAndView attendant(ModelAndView mav, @RequestParam String date,@RequestParam String email) {
		System.out.println("dddddd"+date);
		System.out.println("dddddd"+email);
		Attend attend=new Attend(email,"",date,"","","","");
		Attend attendOne=attendService.selectAttendOne(attend);
		mav.addObject("loc", "/attend/attendList.do?email=${memberLoggedIn.email]");
		String script="";
		System.out.println(attendOne);
		if(attendOne==null) {
			int result=attendService.attendant(email);
			script = "self.close(); opener.location.reload(true)";
			mav.addObject("msg", result>0?"출근 성공!":"출근 실패!");
			mav.setViewName("common/msg");
		}else
		{
			script="self.close()";
			mav.addObject("script",script);
			mav.addObject("msg", "이미 출근기록이 존재합니다.");
			mav.setViewName("common/msg");
		}
		mav.addObject("script",script);
		return mav;

	}
	@RequestMapping("/attend/leave.do")
	public ModelAndView leave(ModelAndView mav, @RequestParam String date,@RequestParam String email) {
		System.out.println("dddddd"+date);
		System.out.println("dddddd"+email);
		Attend attend=new Attend(email,"","","",date,"","");
		Attend attendOne=attendService.selectLeaveOne(attend);
		String script = "self.close(); opener.location.reload(true)";
		mav.addObject("script",script);
		mav.addObject("loc", "/attend/attendList.do?email=${memberLoggedIn.email]");
		System.out.println(attendOne);
		if(attendOne==null) {
			int result=attendService.leave(email);
			mav.addObject("msg", result>0?"퇴근 성공!":"퇴근 실패!");
			mav.setViewName("common/msg");
		}else
		{
			mav.addObject("script",script);
			mav.addObject("msg", "이미 퇴근기록이 존재합니다.");
			mav.setViewName("common/msg");
		}
		return mav;

	}
}
