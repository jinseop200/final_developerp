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
		List<Attend> list= attendService.attendShow(email);
		String content="";

		
		for(Attend a:list) {
			if(a.getEarlyAttend()!=null)
			{
				content+=",{title:'*조퇴 사유 :"+a.getReason()+"',start:'"+a.getEarlyAttendForm()+"'}";
				content+=",{title:'*조퇴 시간 :"+a.getEarlyAttend()+"',start:'"+a.getEarlyAttendForm()+"'}";
			}
			if(a.getAttendStart()!=null)
				content+=",{title:'-출근:"+a.getAttendStart()+"',start:'"+a.getAttendStartForm()+"'}";
			if(a.getAttendEnd()!=null)
				content+=",{title:'-퇴근:"+a.getAttendEnd()+"',start:'"+a.getAttendEndForm()+"'}";
		}

		mav.addObject("content",content);
		mav.setViewName("gw/attendCal");
		return mav;
	}
//	@RequestMapping("/attend/attendShow.do")
//	@ResponseBody
//	public Map<String,String> attendShow(ModelAndView mav,@RequestParam String email) {
//		List<Attend> list= attendService.attendShow(email);
//		String content="";
//		for(Attend a:list) {
//			if(a.getAttendStart()!=null)
//				content+=",{title:'출근',start:'"+a.getAttendStartForm()+"'},{title:'"+a.getAttendStart()+"',start:'"+a.getAttendStartForm()+"'}";
//
//		}   	
//		System.out.println(content);
//		Map<String,String> map =new HashMap<>();
//		map.put("content",content);
//
//		return map;
//
//	}
	@RequestMapping("/attend/attendForm.do")
	public ModelAndView showAttendForm(ModelAndView mav, @RequestParam String date,@RequestParam String email
			) {
		Attend attend=new Attend(email,"",date,"","","","","","");
		Attend end=new Attend(email,"","","",date,"","","","");
		Attend early=new Attend(email,"","","","","",date,"","");
		String attendDate=attendService.checkAttend(attend);
		String endDate=attendService.checkend(end);
		String earlyDate=attendService.checkearly(early);
		mav.addObject("date",date);
		mav.addObject("attendDate",attendDate);
		mav.addObject("endDate",endDate);
		mav.addObject("earlyDate",earlyDate);
		mav.setViewName("gw/attendForm");
		return mav;
	}
	@RequestMapping("/attend/attendant.do")
	public ModelAndView attendant(ModelAndView mav, @RequestParam String date,@RequestParam String email) {

		mav.addObject("loc", "/attend/attendList.do?email=${memberLoggedIn.email]");
		String script="";
		
			int result=attendService.attendant(email);
			script = "self.close(); opener.location.reload(true)";
			mav.addObject("msg", result>0?"출근 성공!":"출근 실패!");
			mav.addObject("script",script);
			mav.setViewName("common/msg");
		
		return mav;

	}
	@RequestMapping("/attend/leave.do")
	public ModelAndView leave(ModelAndView mav, @RequestParam String date,@RequestParam String email) {
	
		String script = "self.close(); opener.location.reload(true)";
		mav.addObject("script",script);
		mav.addObject("loc", "/attend/attendList.do?email=${memberLoggedIn.email]");
		
			int result=attendService.leave(email);
			mav.addObject("msg", result>0?"퇴근 성공!":"퇴근 실패!");
			mav.setViewName("common/msg");
		return mav;

	}
	@RequestMapping("/attend/earlyleave.do")
	public ModelAndView earlyLeave(ModelAndView mav,@RequestParam String reason,@RequestParam String email) {
		Attend attend=new Attend(email,"","","","","","","",reason);
		int result=attendService.earlyLeave(attend);
		String script = "self.close(); opener.location.reload(true)";
		mav.addObject("script",script);
		mav.addObject("loc", "/attend/attendList.do?email=${memberLoggedIn.email]");
			mav.addObject("msg", result>0?"조퇴 성공!":"조퇴 실패!");
			mav.setViewName("common/msg");
		
		return mav;
	}
	@RequestMapping("/attend/test.do")
	public ModelAndView test(ModelAndView mav) {
		mav.setViewName("gw/test");
		
		return mav;
	}
}
