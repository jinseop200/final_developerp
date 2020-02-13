package com.dev.erp.schedule.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.schedule.model.service.ScheduleService;

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
	
	
	
}
