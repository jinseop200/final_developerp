package com.dev.erp.quality.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.quality.model.service.QualityService;
import com.dev.erp.quality.model.vo.Quality;

@Controller
public class QualityController {

	static final Logger logger = LoggerFactory.getLogger(QualityController.class);
	
	@Autowired
	private QualityService qualityService;

	
	@RequestMapping("/quality/qualityControll.do")
	public ModelAndView qualityControll(ModelAndView mav) {
	
		
		List<Map<String,String>> list = new ArrayList<>();
		
		list = qualityService.selectQualityAll();
//		logger.debug("selectQualityAll list={}",list);
		mav.addObject("list",list);
		
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
	@RequestMapping("/quality/updateQualityForm.do")
	public ModelAndView qualityUpdate(ModelAndView mav, @RequestParam("quality_no") int quality_no) {
		
		Quality qualityContent = qualityService.selectOnebyQualityNo(quality_no);
		
		mav.addObject("qualityContent", qualityContent);
		mav.setViewName("quality/updateQualityForm");
		
	 	String date = qualityContent.getRegDate().toString();
	 	String year = date.substring(2, 4);
	 	String month = date.substring(5, 7);
	 	String day = date.substring(8);
	 	
		return mav;
	}
	
	@RequestMapping(value="/quality/updateQualtyFormEnd.do", method=RequestMethod.POST )
	public ModelAndView qualityUpdateEnd(ModelAndView mav, Quality quality) {
		
//		logger.debug("qualityUpdate quality={}",quality);
		
		int result= qualityService.qualityUpdateOne(quality);
		
		mav.addObject("msg",result>0?"등록성공":"등록실패");
		mav.addObject("loc","/quality/qualityControll.do");
		mav.setViewName("common/msg");
		return mav;
	}
	
	@RequestMapping("/quality/searchSpecify")
	public ModelAndView searchSpecify(ModelAndView mav, @RequestParam("searchType") String searchType) {
		
		List<Map<String,String>> list = new ArrayList<>();
		
		switch(searchType) {
		case "storeNo" : list = qualityService.selectStoreAll();  break;
		case "lotNo" :  list =  qualityService.selectQualityColumn("lot_no"); break;
		case "qualityNo" : list = qualityService.selectQualityColumn("quality_no");  break;
		case "type" :  list = qualityService.selectProductTypeAll(); break;
		}
		
		logger.debug("searchSpecify@list={}",list);
		
		
		mav.addObject("speclist",list);
		mav.setViewName("quality/searchSpecify");
		return mav;
	}
	
	
}
