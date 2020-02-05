package com.dev.erp.quality.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class qualityController {

	static final Logger logger = LoggerFactory.getLogger(qualityController.class);
	
	
	@RequestMapping("/quality/qualityControll.do")
	public ModelAndView qualityControll(ModelAndView mav) {
		
		mav.setViewName("quality/qualityControll");
		
		return mav;
	}
	
	@RequestMapping("/quality/qualitySearch.do")
	public ModelAndView qualitySearch(ModelAndView mav) {
		
		mav.setViewName("quality/qualitySearch");
		
		return mav;
	}
	
	@RequestMapping("/quality/insertQualityForm.do")
	public ModelAndView qualityInsert(ModelAndView mav) {
		
		mav.setViewName("/quality/insertQualityForm");
		
		return mav;
	}
	
}
