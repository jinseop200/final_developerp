package com.dev.erp.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.attend.model.vo.Attend;
import com.dev.erp.schedule.model.service.ScheduleService;
import com.dev.erp.schedule.model.vo.Schedule;

@Controller
public class MainController {
	@Autowired
	ScheduleService scheduleService ;
	@RequestMapping("/main/main.do")
	public ModelAndView mainPage(ModelAndView mav,@RequestParam(value="email") String email) {
		System.out.println("sasfasdddddddddf"+email);		
		List<Schedule> list= scheduleService.getSchedule(email);
		System.out.println("asfsafsfsadddddd"+list);		
		String content="";	
		for(Schedule s:list) {			
				content+=",{title:'"+s.getTitle()+"',start:'"+s.getStartScheduleTime()+"',end:'"+s.getEndScheduleTime()+"'}";
		}			
		mav.addObject("content",content);		
		mav.setViewName("main/main");
		return mav;
	}
	
}
