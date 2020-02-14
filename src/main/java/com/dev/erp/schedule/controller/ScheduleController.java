package com.dev.erp.schedule.controller;

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

import com.dev.erp.schedule.model.service.ScheduleService;
import com.dev.erp.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired ScheduleService scheduleService;

	@RequestMapping("schedule/schedule.do")
	public ModelAndView schedule(ModelAndView mav,@RequestParam String date) {
		mav.addObject("date",date);
		mav.setViewName("main/schedule");
		return mav;
	}
	@RequestMapping("schedule/scheduleInsert.do")
	public ModelAndView insertSchedule(ModelAndView mav,Schedule schedule) {
		System.out.println("fdsaf"+schedule);
		String date=schedule.getEndScheduleTime()+" "+schedule.getEndTime();
		schedule.setEndScheduleTime(date);
		date=schedule.getStartScheduleTime()+" "+schedule.getStartTime();
		schedule.setStartScheduleTime(date);
		int result=scheduleService.insertSchedule(schedule);

		mav.addObject("loc", "/main/main.do?email="+schedule.getEmail());
		
			mav.addObject("msg", result>0?"등록 성공!":"등록 실패!");
			mav.setViewName("common/msg");
		return mav;
	}
	
	@RequestMapping("schedule/schedulList.do")
	@ResponseBody
	public List<Schedule> scheduleList(ModelAndView mav,@RequestParam String date,@RequestParam String email) {
		System.out.println("aaaaaaadffffffffsadf"+date);
		System.out.println("aaaaaaadffffffffsadf"+email);
		Map<String,Object> map = new HashMap<>();
		map.put("date",date);
		map.put("email",email);
		List<Schedule> list=scheduleService.scheduleList(map);
		System.out.println("SADdddddddd"+list);
	
		return list;
	}
	
	
}
